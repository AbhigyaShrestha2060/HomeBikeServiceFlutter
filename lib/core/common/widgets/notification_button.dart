import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const NotificationButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[900],
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
