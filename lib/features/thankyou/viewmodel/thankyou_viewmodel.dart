import 'package:final_assignment/features/thankyou/navigator/thankyou_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final thankyouViewModelProvider = StateNotifierProvider<ThankyouViewModel, int>(
  (ref) => ThankyouViewModel(ref.read(thankYouNavigatorProvider)),
);

class ThankyouViewModel extends StateNotifier<int> {
  ThankyouViewModel(this.thankYouNavigator) : super(0);

  final ThankYouNavigator thankYouNavigator;

  void openHomeView() {
    thankYouNavigator.openHomeView();
  }
}
