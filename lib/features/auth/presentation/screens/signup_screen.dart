import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:enviable_app/features/auth/presentation/widgets/index.dart';
import 'package:enviable_app/manager/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enviable_app/widgets/widgets.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/presentation/managers/index.dart';

/// A stateless widget to render SignupScreen.
class SignupScreen extends StatefulWidget with AutoRouteWrapper {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (p, c) => p.authStatus.isSome() && c.authStatus.isSome(),
        listener: (c, s) => s.authStatus.fold(
          () => null,
          (either) => either.fold(
            (f) => BottomAlertDialog.show(c, message: f.message),
            (_) => null,
          ),
        ),
        child: this,
      ),
    );
  }

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (c, s) {
        if (s.verification != null) if (s.verification!.codeSent) {
          var val = s.verification!;

          BottomAlertDialog.show(
            c,
            duration: const Duration(seconds: AuthFacade.TIMEOUT_SEC),
            message: 'Verification Code sent to '
                '${val.phone.country.dialCode}${val.phone.getOrEmpty}',
            icon: Icons.info_outline_rounded,
            iconColor: AppColors.assessmentBlue,
            shouldIconPulse: false,
          );

          navigator.push(
            OtpConfirmationRoute(verification: s.verification!),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Helpers.appPadding)
              .copyWith(top: Helpers.appPadding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                bottom: false,
                child: AutoSizeText(
                  'Enter your mobile number',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              //
              VerticalSpace(height: App.shortest * 0.05),
              //
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (c, s) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: DropdownFieldWidget<Country>(
                                hint: '-- Select Country --',
                                disabled: s.isLoading,
                                items: Country.list
                                    .map<DropdownMenuItem<Country>>(
                                      (item) => DropdownMenuItem<Country>(
                                        value: item,
                                        child: AutoSizeText(
                                          '${item.codeName}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                selected: s.country,
                                onChanged: c.read<AuthCubit>().countryChanged,
                              ),
                            ),
                            //
                            AutoSizeText('${s.country.dialCode}'),
                          ],
                        ),
                      ),
                    ),
                    //
                    Expanded(
                      flex: 2,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (c, s) => AdaptiveTextFormInput(
                          enableSuggestions: true,
                          autoCorrect: false,
                          hintText: '8123456789',
                          keyboardType: TextInputType.number,
                          capitalization: TextCapitalization.none,
                          maxLength: 10,
                          autoFillHints: [
                            AutofillHints.telephoneNumber,
                            AutofillHints.telephoneNumberDevice,
                            AutofillHints.telephoneNumberLocal,
                            AutofillHints.telephoneNumberNational,
                          ],
                          validate: s.validate,
                          onChanged: c.read<AuthCubit>().phoneChanged,
                          errorText: s.phone.value.fold(
                            (f) => f.message,
                            (r) => null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              VerticalSpace(height: App.shortest * 0.05),
              //
              AutoSizeText('Or signup with:'),
              //
              VerticalSpace(height: App.shortest * 0.05),
              //
              OAuthWidget(apple: true),
              //
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'By continuing you may recieve an SMS for verification. '
                        'Message and data rates may apply',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      //
                      VerticalSpace(height: App.shortest * 0.04),
                      //
                      BlocBuilder<AuthCubit, AuthState>(
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
                            textColor: Theme.of(context).platform.fold(
                                  material: () => Colors.white,
                                  cupertino: () => null,
                                ),
                            onPressed: c.read<AuthCubit>().loginWithPhone,
                            text: 'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              VerticalSpace(height: App.shortest * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
