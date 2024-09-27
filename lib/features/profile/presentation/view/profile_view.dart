import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/profile/presentation/state/current_profile_state.dart';
import 'package:final_assignment/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(profileViewmodelProvider.notifier).initialize(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement refresh logic if needed
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildProfileHeader(profileState),
                    const SizedBox(height: 20),
                    _buildProfileItem(
                      "Edit Profile",
                      "assets/icons/profile.svg",
                      () => ref
                          .read(profileViewmodelProvider.notifier)
                          .openEditProfileView(),
                    ),
                    _buildProfileItem(
                      "Notifications",
                      "assets/icons/Bell.svg",
                      () => ref
                          .read(profileViewmodelProvider.notifier)
                          .notification(),
                    ),
                    _buildProfileItem(
                      "Change Password",
                      "assets/icons/password.svg",
                      () => ref
                          .read(profileViewmodelProvider.notifier)
                          .openChangePassword(),
                    ),
                    // _buildProfileItem(
                    //   "Chat",
                    //   "assets/icons/password.svg",
                    //   () => ref
                    //       .read(profileViewmodelProvider.notifier)
                    //       .openChatView(),
                    // ),
                    _buildProfileItem(
                      "Enable Finger Print",
                      "assets/icons/fingerprint.svg",
                      () => ref
                          .read(profileViewmodelProvider.notifier)
                          .enableFingerprint(),
                    ),
                    _buildProfileItem(
                      "Log Out",
                      "assets/icons/logout.svg",
                      _showLogoutDialog,
                    ),
                    const SizedBox(height: 20),
                    _buildThemeToggle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(CurrentProfileState profileState) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[100],
              child: Text(
                profileState.authEntity?.fullName
                        .substring(0, 1)
                        .toUpperCase() ??
                    "U",
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              profileState.authEntity?.fullName ?? "Full Name",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              profileState.authEntity?.email ?? "email@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String text, String icon, VoidCallback onTap) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          width: 24,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildThemeToggle() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SwitchListTile(
        title: const Text("Dark Mode",
            style: TextStyle(fontWeight: FontWeight.w500)),
        secondary: SvgPicture.asset(
          "assets/icons/dark_mode.svg",
          width: 24,
          color: Theme.of(context).iconTheme.color,
        ),
        value: ref.watch(themeViewModelProvider),
        onChanged: (value) {
          ref.read(themeViewModelProvider.notifier).changeTheme();
        },
      ),
    );
  }

  void _showLogoutDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: 'Logout',
      desc: 'Are You Sure You Want To Logout?',
      btnOkOnPress: () {
        if (mounted) {
          ref.read(profileViewmodelProvider.notifier).logout();
        }
      },
      btnCancelOnPress: () {},
    ).show();
  }
}
