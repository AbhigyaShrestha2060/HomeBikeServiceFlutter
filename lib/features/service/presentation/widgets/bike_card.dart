import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:final_assignment/features/service/presentation/viewmodel/service_catergory_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BikeCard extends ConsumerWidget {
  const BikeCard({
    super.key,
    required this.bikeListEntity,
  });

  final BikeListEntity bikeListEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                ApiEndPoints.getBikeImage + bikeListEntity.bikeImage,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bikeListEntity.bikeName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                ref
                    .read(serviceViewModelProvider.notifier)
                    .openServiceModelView(
                      serviceEntity: bikeListEntity.data,
                    );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
