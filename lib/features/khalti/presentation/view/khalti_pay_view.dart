import 'dart:developer';

import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart';
import 'package:final_assignment/features/khalti/presentation/viewmodel/khalti_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

class KhaltiSDKDemo extends ConsumerStatefulWidget {
  const KhaltiSDKDemo({
    super.key,
    required this.pidx,
    required this.amount,
  });

  final String pidx;
  final double amount;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KhaltiSDKDemoState();
}

class _KhaltiSDKDemoState extends ConsumerState<KhaltiSDKDemo> {
  late final Future<Khalti?> khalti;

  PaymentResult? paymentResult;
  ConfirmBookingEntity? bookingEntity;

  @override
  void initState() {
    super.initState();

    final payConfig = KhaltiPayConfig(
      publicKey: 'e41580caa0ae438cbec17ec1b5f69e72',
      pidx: widget.pidx,
      environment: Environment.test,
    );

    khalti = Khalti.init(
      enableDebugging: true,
      payConfig: payConfig,
      onPaymentResult: (paymentResult, khalti) {
        log(paymentResult.toString());
        KhaltiEntity khaltiEntity = KhaltiEntity(
          pidx: paymentResult.payload!.pidx ?? '',
          transactionId: paymentResult.payload!.transactionId ?? '',
          productId: paymentResult.payload!.purchaseOrderId ?? '',
          amount: paymentResult.payload!.totalAmount.toDouble(),
        );

        ref
            .read(khaltiViewModelProvider.notifier)
            .verifyPayment(khaltiEntity, bookingEntity?.id ?? '');

        khalti.close(context);
      },
      onMessage: (
        khalti, {
        description,
        statusCode,
        event,
        needsPaymentConfirmation,
      }) async {
        log(
          'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
        );
        log('confiramtiona=== $needsPaymentConfirmation');
        khalti.close(context);
      },
      onReturn: () => log('Successfully redirected to return_url.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: khalti,
          initialData: null,
          builder: (context, snapshot) {
            final khaltiSnapshot = snapshot.data;
            if (khaltiSnapshot == null) {
              return const CircularProgressIndicator.adaptive();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 120),

                Text("Rs.${widget.amount}",
                    style: const TextStyle(fontSize: 20)),
                OutlinedButton(
                  onPressed: () => khaltiSnapshot.open(context),
                  child: const Text('Pay with Khalti'),
                ),
                const SizedBox(height: 120),
                paymentResult == null
                    ? Text(
                        'pidx: ${widget.pidx}',
                        style: const TextStyle(fontSize: 15),
                      )
                    : Column(
                        children: [

                          Text('Status: ${paymentResult!.payload?.status}'),
                          Text(
                            'Amount Paid: ${paymentResult!.payload?.totalAmount}',
                          ),
                          Text(
                            'Transaction ID: ${paymentResult!.payload?.transactionId}',
                          ),
                        ],
                      ),
                const SizedBox(height: 120),
                const Text(
                  'Make a payment to book',
                  style: TextStyle(fontSize: 12),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
