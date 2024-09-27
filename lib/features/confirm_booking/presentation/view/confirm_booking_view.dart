import 'package:final_assignment/core/common/widgets/custom_text_form_field.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/confirm_booking/presentation/viewmodel/confirm_booking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmBookingView extends ConsumerStatefulWidget {
  const ConfirmBookingView({
    super.key,
    required this.id,
    required this.bikeName,
  });
  final String id;
  final String bikeName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmBookingViewState();
}

class _ConfirmBookingViewState extends ConsumerState<ConfirmBookingView> {
  final _formSignupKey = GlobalKey<FormState>();
  final _bikeNameController = TextEditingController();
  final _bikeChasisNumberController = TextEditingController();
  final _bikeNumberController = TextEditingController();
  final _bookingDateController = TextEditingController();
  final _bookingTimeController = TextEditingController();
  final _bookingAddressController = TextEditingController();
  final _bikeDescriptionController = TextEditingController();
  DateTime? pickedDateTime;
  bool _agreeToTerms = false;

  @override
  void initState() {
    _bikeNameController.text = widget.bikeName;
    super.initState();
  }

  @override
  void dispose() {
    _bikeNameController.dispose();
    _bikeChasisNumberController.dispose();
    _bikeNumberController.dispose();
    _bookingDateController.dispose();
    _bookingTimeController.dispose();
    _bookingAddressController.dispose();
    _bikeDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Confirm Booking',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 600;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade50, Colors.white],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 50 : 30,
                      vertical: 50,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formSignupKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Confirm Booking',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            CustomTextFormField(
                              readOnly: true,
                              controller: _bikeNameController,
                              icon: Icons.motorcycle,
                              label: 'Bike Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the bike name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _bikeChasisNumberController,
                              icon: Icons.confirmation_number,
                              label: 'Bike Chasis Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the bike chasis number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _bikeNumberController,
                              icon: Icons.numbers,
                              label: 'Bike Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the bike number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () async {
                                pickedDateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDateTime != null) {
                                  final String formattedDate =
                                      '${pickedDateTime!.day.toString().padLeft(2, '0')}/${pickedDateTime!.month.toString().padLeft(2, '0')}/${pickedDateTime!.year}';
                                  _bookingDateController.text = formattedDate;
                                }
                              },
                              child: IgnorePointer(
                                child: CustomTextFormField(
                                  controller: _bookingDateController,
                                  icon: Icons.calendar_today,
                                  label: 'Booking Date',
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? pickedTime =
                                await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  final String formattedTime =
                                      '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
                                  _bookingTimeController.text = formattedTime;
                                }
                              },
                              child: IgnorePointer(
                                child: CustomTextFormField(
                                  controller: _bookingTimeController,
                                  icon: Icons.access_time,
                                  label: 'Booking Time',
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a time';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _bookingAddressController,
                              icon: Icons.location_on,
                              label: 'Booking Address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the booking address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _bikeDescriptionController,
                              icon: Icons.description,
                              label: 'Bike Description',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the bike description';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: _agreeToTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      _agreeToTerms = value!;
                                    });
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                    'I agree to the terms and conditions',
                                    style: TextStyle(fontSize: 14,color: Colors.black),

                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: _agreeToTerms ? _submitForm : null,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: _agreeToTerms
                                    ? Colors.blue.shade700
                                    : Colors.blue.shade500,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text('Book Now',
                                  style: TextStyle(fontSize: 18)),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formSignupKey.currentState!.validate()) {
      await ref.read(confirmBookingViewModelProvider.notifier).addToBooking(
        ConfirmBookingEntity(
          bikeId: widget.id,
          bikeChasisNumber: _bikeChasisNumberController.text,
          bikeNumber: _bikeNumberController.text,
          bikeDescription: _bikeDescriptionController.text,
          bookingTime: _bookingTimeController.text,
          // ToDo Fix Date Format
          // bookingDate: _bookingDateController.text,
          bookingDate: pickedDateTime ?? DateTime.now(),
          bookingAddress: _bookingAddressController.text,
        ),
      );
//TODO:
      // ref.read(confirmBookingViewModelProvider.notifier).openThankyou();
    }
  }
}
