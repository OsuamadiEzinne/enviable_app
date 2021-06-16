import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

enum PinInputType { circle, underline, box }

// ignore: must_be_immutable
class PinInputWidget<Reactive extends Cubit<ReactiveState>, ReactiveState>
    extends StatelessWidget {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  late ReactiveState _state;
  TextEditingController controller = TextEditingController();

  final bool Function(ReactiveState)? validate;
  final void Function(String)? onCompleted;
  final void Function(String)? onSubmitted;
  final void Function(String) onChanged;
  final String? Function(ReactiveState)? validator;
  final TextInputAction action;
  final bool autoDismissKeyboard;
  final bool autoFocus;
  final bool blinkWhenObscuring;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextCapitalization capitalization;
  final Color? cursorColor;
  final bool Function(ReactiveState)? disabled;
  final bool enableActiveFill;
  final bool enablePinAutofill;
  final FocusNode? focus;
  final double? height;
  final TextStyle? hintStyle;
  final String Function(ReactiveState)? initial;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final int length;
  final PinInputType pinType;
  final TextStyle? style;
  final double? width;
  final bool Function(ReactiveState, ReactiveState)? listenWhen;

  PinInputWidget({
    Key? key,
    this.length = 6,
    this.initial,
    this.focus,
    this.validate,
    this.autoFocus = false,
    this.height,
    this.width,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.cursorColor,
    this.style,
    this.hintStyle,
    this.action = TextInputAction.done,
    this.autoDismissKeyboard = true,
    this.keyboardType = TextInputType.number,
    this.capitalization = TextCapitalization.none,
    this.inputFormatters = const [],
    this.enableActiveFill = false,
    this.enablePinAutofill = true,
    this.blinkWhenObscuring = true,
    this.disabled,
    this.pinType = PinInputType.underline,
    this.onCompleted,
    this.onSubmitted,
    required this.onChanged,
    this.validator,
    this.listenWhen,
  }) : super(key: key);

  ReactiveState get state => _state;

  set __state(ReactiveState value) => _state = value;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Reactive, ReactiveState>(
      listenWhen: listenWhen,
      listener: (c, s) => errorController.add(ErrorAnimationType.shake),
      builder: (context, s) {
        __state = s;

        var initialText = initial?.call(s) ?? '';
        var currentOffset = controller.selection.base.offset;

        controller.text = initialText;
        controller.value = TextEditingValue(
          text: initialText,
          selection: TextSelection.fromPosition(
            TextPosition(offset: currentOffset),
          ),
        );

        return PinCodeTextField(
          appContext: context,
          length: length,
          pinTheme: PinTheme(
            fieldHeight: height ?? App.width * 0.12,
            fieldWidth: width ?? App.width * 0.12,
            borderWidth: borderWidth,
            borderRadius: pinType.fold(
              circle: () => null,
              box: () => borderRadius ?? BorderRadius.circular(8.0),
              underline: () => null,
            ),
            shape: pinType.fold(
              circle: () => PinCodeFieldShape.circle,
              box: () => PinCodeFieldShape.box,
              underline: () => PinCodeFieldShape.underline,
            ),
            activeColor: Colors.grey.shade300,
            inactiveColor: Colors.grey,
            activeFillColor: Colors.black12,
            inactiveFillColor: Colors.transparent,
            selectedColor: Theme.of(context).primaryColorDark,
            selectedFillColor: Colors.transparent,
          ),
          controller: controller,
          inputFormatters: inputFormatters,
          enableActiveFill: enableActiveFill,
          enablePinAutofill: enablePinAutofill,
          enabled: disabled != null ? !disabled!.call(s) : true,
          autoFocus: autoFocus,
          textStyle: style,
          hintStyle: hintStyle,
          textInputAction: action,
          autoDismissKeyboard: autoDismissKeyboard,
          blinkWhenObscuring: blinkWhenObscuring,
          cursorColor: cursorColor ?? AppColors.accentColor,
          textCapitalization: capitalization,
          backgroundColor: Colors.transparent,
          animationType: AnimationType.scale,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          errorAnimationController: errorController,
          focusNode: focus,
          errorTextSpace: 30,
          autovalidateMode: validate != null && validate!.call(s)
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          keyboardType: keyboardType,
          beforeTextPaste: (String? clipboard) =>
              RegExp('$onlyNumbersPattern').hasMatch(clipboard?.trim() ?? ''),
          onCompleted: onCompleted,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          validator: (_) => validator?.call(state),
        );
      },
    );
  }
}

extension PinInputTypeX on PinInputType {
  T fold<T>({
    required T Function() circle,
    required T Function() box,
    required T Function() underline,
  }) {
    switch (this) {
      case PinInputType.box:
        return box.call();
      case PinInputType.circle:
        return circle.call();
      case PinInputType.underline:
      default:
        return underline.call();
    }
  }
}
