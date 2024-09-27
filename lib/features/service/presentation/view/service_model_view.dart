import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:final_assignment/features/service/presentation/state/service_state.dart';
import 'package:final_assignment/features/service/presentation/widgets/bike_model_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/service_catergory_viewmodel.dart';

class ServiceModelView extends ConsumerStatefulWidget {
  const ServiceModelView({
    super.key,
    required this.serviceEntity,
  });

  final List<ServiceEntity> serviceEntity;

  @override
  ConsumerState createState() => _ServiceModelViewState();
}

class _ServiceModelViewState extends ConsumerState<ServiceModelView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!ref.read(serviceViewModelProvider).hasReachedMax) {
        ref.read(serviceViewModelProvider.notifier).getBikeByModel();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final serviceState = ref.watch(serviceViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Your Bike Model",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(serviceViewModelProvider.notifier).resetState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 20),
              Expanded(
                child: serviceState.isLoading && serviceState.lstService.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : serviceState.lstService.isEmpty
                        ? _buildEmptyState()
                        : _buildBikeList(serviceState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search bike model...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (value) {
        ref.read(serviceViewModelProvider.notifier).searchBikes(value);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.motorcycle_outlined, size: 100, color: Colors.grey[400]),
          const SizedBox(height: 20),
          Text(
            "No Bike Models Found",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Text(
            "Add a new bike model or try a different search",
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildBikeList(ServiceState serviceState) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemCount: widget.serviceEntity.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.serviceEntity.length) {
          return _buildLoadingIndicator(serviceState);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BikeModelCard(
            serviceEntity: widget.serviceEntity[index],
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator(ServiceState serviceState) {
    return serviceState.isLoading
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : const SizedBox.shrink();
  }
}
