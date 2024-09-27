import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/change_password/presentation/navigator/change_password_navigator.dart';
import 'package:final_assignment/features/chat/presentation/navigator/chat_navigator.dart';
import 'package:final_assignment/features/edit_profile/presentation/navigator/edit_profile_navigator.dart';
import 'package:final_assignment/features/notification/presentation/navigator/notification_navigator.dart';
import 'package:final_assignment/features/profile/presentation/view/profile_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileNavigatorProvider = Provider<ProfileNavigator>((ref) {
  return ProfileNavigator();
});

class ProfileNavigator
    with
        EditProfileViewRoute,
        LoginViewRoute,
        NotificationViewRoute,
        ChangePasswordViewRoute,
        ChatViewRoute {}

mixin ProfileRoute {
  openProfile() {
    NavigateRoute.popAndPushRoute(const ProfileView());
  }
}
