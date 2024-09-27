import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, this.entity});

  final ServiceEntity? entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: .05,
            ),
          ],
        ),
        child: SizedBox(
          child: Card(
            child: Column(
              children: [
                // Image.network(
                //   '${ApiEndPoints.petImage}${entity.petImage}',
                //   fit: BoxFit.cover,
                //   height: 150,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  entity!.bikeName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  entity!.bikeModel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  entity!.bikePrice.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
