import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/home/presentation/navigator/home_navigator.dart';
import 'package:final_assignment/features/notification/presentation/view/notification_view.dart';
import 'package:final_assignment/features/profile/presentation/navigator/profile_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationNavigatorProvider =
    Provider<NotificationViewNavigator>((ref) => NotificationViewNavigator());

class NotificationViewNavigator with ProfileRoute, HomeViewRoute {}

mixin NotificationViewRoute {
  openNotificationView() {
    NavigateRoute.pushRoute(const NotificationScreen());
  }
}
