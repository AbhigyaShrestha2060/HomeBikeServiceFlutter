import 'package:final_assignment/features/edit_profile/presentation/navigator/edit_profile_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileViewmodel extends StateNotifier<void> {
  EditProfileViewmodel(this.navigator) : super(null);

  final EditProfileViewNavigator navigator;
}
