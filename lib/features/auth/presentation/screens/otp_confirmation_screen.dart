import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:enviable_app/features/auth/presentation/managers/index.dart';
import 'package:enviable_app/manager/locator/locator.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:enviable_app/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget to render OtpConfirmationScreen.
class OtpConfirmationScreen extends StatefulWidget with AutoRouteWrapper {
  final PhoneVerification? verification;

  const OtpConfirmationScreen({
    Key? key,
    required this.verification,
  }) : super(key: key);

  void phoneNumberAutoVerified(
    BuildContext context,
    PhoneVerification verification,
  ) {
    if (verification.verified) {
      context.read<AuthCubit>().codeChanged(verification.credential!.smsCode!);
      context.read<AuthCubit>().signInWithCredentials(
            credential: verification.credential!,
          );
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>()..initOTPVerification(verification!),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listenWhen: (p, c) =>
                p.verification?.verified != c.verification?.verified,
            listener: (c, s) {
              if (s.verification != null)
                phoneNumberAutoVerified(c, s.verification!);
            },
            child: this,
          ),
          BlocListener<AuthCubit, AuthState>(
            listenWhen: (p, c) =>
                p.authStatus.isSome() && c.authStatus.isSome(),
            listener: (c, s) => s.authStatus.fold(
              () => null,
              (either) => either.fold(
                (f) => BottomAlertDialog.show(c, message: f.message),
                (_) => null,
              ),
            ),
            child: this,
          ),
        ],
        child: this,
      ),
    );
  }

  @override
  _OtpConfirmationScreenState createState() => _OtpConfirmationScreenState();
}

class _OtpConfirmationScreenState extends State<OtpConfirmationScreen> {
  Duration duration = Duration(seconds: AuthFacade.TIMEOUT_SEC);
  Timer? timer;

  String get tick => '${duration.inMinutes}:'
      '${((duration.inSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();

    startCountdown();

    if (widget.verification != null)
      widget.phoneNumberAutoVerified(context, widget.verification!);
  }

  void startCountdown() {
    // Reset Duration
    duration = Duration(seconds: AuthFacade.TIMEOUT_SEC);
    // Cancel timer if already started
    timer?.cancel();
    // Start timer
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted)
        setState(() {
          if (duration.inSeconds > 0) {
            duration = duration - Duration(seconds: 1);
          } else {
            timer.cancel();
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (p, c) => p.isResendingCode != c.isResendingCode,
      listener: (c, s) {
        if (s.verification != null) if (s.verification!.codeSent)
          startCountdown();
      },
      child: Scaffold(
        appBar: Toolbar(
          leadingCondition: false,
          leadingAction: () => navigator.pop(true),
          title: 'Verify '
              '${widget.verification?.phone.country.dialCode}'
              '${'${widget.verification?.phone.getOrEmpty}'.formatNumber(div: 3, count: 7)}',
          titleStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        body: Column(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Helpers.appPadding),
                child: AutoSizeText.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Waiting to automatically detect an SMS sent to ',
                    ),
                    TextSpan(
                      text: '${widget.verification?.phone.country.dialCode} '
                          '${'${widget.verification?.phone.getOrEmpty}'.formatNumber(div: 3, count: 7)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '.'),
                  ]),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ),
            ),
            //
            VerticalSpace(height: App.shortest * 0.07),
            //
            GestureDetector(
              onTap: () => navigator.pop(true),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: AutoSizeText(
                  'Wrong number?',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            //
            VerticalSpace(height: App.shortest * 0.07),
            //
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: App.width * 0.7,
              ),
              child: PinInputWidget<AuthCubit, AuthState>(
                listenWhen: (p, c) =>
                    c.validate &&
                    p.code.failure?.message != c.code.failure?.message,
                initial: (s) => s.code.getOrEmpty!,
                disabled: (s) => s.verification?.verified ?? s.isResendingCode,
                blinkWhenObscuring: true,
                width: App.width * 0.08,
                keyboardType: TextInputType.number,
                autoFocus: false,
                onChanged: context.read<AuthCubit>().codeChanged,
                onCompleted: context.read<AuthCubit>().codeChanged,
                onSubmitted: context.read<AuthCubit>().codeChanged,
                validate: (s) => s.validate,
                validator: (s) => s.code.value.fold(
                  (f) => f.message,
                  (r) => null,
                ),
              ),
            ),
            //
            VerticalSpace(height: App.shortest * 0.03),
            //
            Flexible(
              child: BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (p, c) => c.isResendingCode,
                builder: (c, s) => ListTile(
                  onTap: () => context
                      .read<AuthCubit>()
                      .loginWithPhone(s.verification?.resendToken),
                  enabled: duration.inSeconds == 0,
                  leading: Icon(Icons.message),
                  title: AutoSizeText('Resend SMS'),
                  trailing: AutoSizeText(tick),
                ),
              ),
            ),
            //
            Divider(height: 0.0),
            //
            Flexible(
              child: ListTile(
                onTap: () {},
                enabled: false,
                leading: Icon(Icons.call),
                title: AutoSizeText('Call me'),
                trailing: AutoSizeText('1:04'),
              ),
            ),
            //
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Helpers.appPadding),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (c, s) => Visibility(
                      visible: !s.isLoading,
                      replacement: Center(
                        child: CircularProgressBar.adaptive(
                          width: App.width * 0.08,
                          height: App.width * 0.08,
                          strokeWidth: 3.5,
                          radius: 14,
                        ),
                      ),
                      child: AppButton(
                        height: 38,
                        disabled: s.verification?.verified ?? s.isResendingCode,
                        textColor: Theme.of(context).platform.fold(
                              material: () => Colors.white,
                              cupertino: () => null,
                            ),
                        onPressed: c.read<AuthCubit>().verifySMSCode,
                        text: 'Next',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //
            VerticalSpace(height: App.shortest * 0.03),
          ],
        ),
      ),
    );
  }
}
