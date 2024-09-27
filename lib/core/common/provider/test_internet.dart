import 'package:final_assignment/core/common/provider/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestInternet extends ConsumerStatefulWidget {
  const TestInternet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestInternetState();
}

class _TestInternetState extends ConsumerState<TestInternet> {
  @override
  Widget build(BuildContext context) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Internet Connectivity'),
        centerTitle: true,
      ),
      body: connectivityStatus == ConnectivityStatus.isConnected
          ? const Center(
              child: Text(
                'You are connected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          : const Center(
              child: Text(
                'You are Disconnected,',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
    );
  }
}
