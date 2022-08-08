import 'dart:async';

import 'package:advanced_flutter_mvvm/domain/models.dart';
import 'package:advanced_flutter_mvvm/presentation/base/baseviewmodel.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers for outputs
  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;

  // onboarding view model inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  // onboarding view inputs
  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // onboarding view outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((SliderViewObject) => SliderViewObject);

  // onboarding private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];
}

// inputs means "Orders" that our view model will recieve from view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks right arrow or swipes left
  void goPrevious(); // when user clicks left arrow or swipes right
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // stream controller outputs
  Stream<SliderViewObject> get outputSliderViewObject;
}
