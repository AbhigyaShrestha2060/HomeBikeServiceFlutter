import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_assignment/core/common/widgets/notification_button.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:final_assignment/features/profile/presentation/state/current_profile_state.dart';
import 'package:final_assignment/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final List<String> carouselImages = [
    'assets/images/bg1.png',
    'assets/images/bg2.jpeg',
    'assets/images/bg3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewmodelProvider);
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(size, profileState, isTablet),
              SizedBox(height: size.height * 0.02),
              _buildCarousel(size, isTablet),
              SizedBox(height: size.height * 0.02),
              _buildDashboardContent(size, isTablet),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Size size, CurrentProfileState profileState, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isTablet ? size.height * 0.03 : size.height * 0.02,
        horizontal: isTablet ? size.width * 0.05 : size.width * 0.05,
      ),
      height: isTablet ? size.height * 0.2 : size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade900],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome back,',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: isTablet ? size.width * 0.03 : size.width * 0.04,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                profileState.authEntity?.fullName ?? "User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? size.width * 0.04 : size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          NotificationButton(
            icon: Icons.notifications,
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).openNotificationView();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(Size size, bool isTablet) {
    return CarouselSlider.builder(
      itemCount: carouselImages.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(carouselImages[index]),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: isTablet ? size.height * 0.3 : size.height * 0.25,
        viewportFraction: isTablet ? 0.6 : 0.85,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: true,
      ),
    );
  }

  Widget _buildDashboardContent(Size size, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: TextStyle(
              fontSize: isTablet ? size.width * 0.04 : size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          _buildDashboardGrid(size, isTablet),
        ],
      ),
    );
  }

  Widget _buildDashboardGrid(Size size, bool isTablet) {
    return GridView.count(
      crossAxisCount: isTablet ? 3 : 2,
      crossAxisSpacing: isTablet ? size.width * 0.03 : size.width * 0.04,
      mainAxisSpacing: isTablet ? size.width * 0.03 : size.width * 0.04,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildDashboardCard(
          size,
          icon: Icons.date_range,
          title: 'Book Now',
          color: Colors.blue,
          onPressed: () {
            // Add functionality for Book Now
          },
          isTablet: isTablet,
        ),
        _buildDashboardCard(
          size,
          icon: Icons.inventory_2,
          title: 'Show Booking',
          color: Colors.orange,
          onPressed: () {
            // Add functionality for Show Booking
          },
          isTablet: isTablet,
        ),
        _buildDashboardCard(
          size,
          icon: Icons.attach_money,
          title: 'Payments',
          color: Colors.green,
          onPressed: () {
            // Add functionality for Revenue
          },
          isTablet: isTablet,
        ),

      ],
    );
  }

  Widget _buildDashboardCard(Size size,
      {required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onPressed,
        required bool isTablet}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(isTablet ? size.width * 0.02 : size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: isTablet ? size.width * 0.06 : size.width * 0.1, color: color),
            SizedBox(height: size.height * 0.01),
            Text(
              title,
              style: TextStyle(
                fontSize: isTablet ? size.width * 0.02 : size.width * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}