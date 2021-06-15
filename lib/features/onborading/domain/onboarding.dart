library onboarding.dart;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:enviable_app/utils/utils.dart';

part 'onboarding.freezed.dart';

@freezed
@immutable
class OnboardingItem<Pixel> with _$OnboardingItem<Pixel> {
  const OnboardingItem._();

  const factory OnboardingItem({
    required String title,
    required String description,
    required Pixel image,
  }) = _OnboardingItem;

  static KtList<OnboardingItem<String>> get list => KtList.from([
        OnboardingItem(
          title: 'Report a crime',
          description: 'Lorem ipsum dolor sit amet, consectetur'
              'adipiscing elit, sed do eiusmod tempor'
              'incididunt ut labore et dolore magna aliqua.',
          image: AppAssets.civilian,
        ),
        //
        OnboardingItem(
          title: 'Find an officer',
          description: 'Lorem ipsum dolor sit amet, consectetur'
              'adipiscing elit, sed do eiusmod tempor'
              'incididunt ut labore et dolore magna aliqua.',
          image: AppAssets.officer,
        ),
        //
        OnboardingItem(
          title: 'Safety Always!',
          description: 'Lorem ipsum dolor sit amet, consectetur'
              'adipiscing elit, sed do eiusmod tempor'
              'incididunt ut labore et dolore magna aliqua.',
          image: AppAssets.getHelp,
        ),
      ]);
}