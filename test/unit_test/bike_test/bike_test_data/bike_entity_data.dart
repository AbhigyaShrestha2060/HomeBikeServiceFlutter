import 'package:final_assignment/features/service/domain/entity/service_entity.dart';

class BikeTestData {
  BikeTestData._();
  static List<ServiceEntity> getBikeTestData() {
    List<ServiceEntity> lstService = [
      const ServiceEntity(
        id: "667f90573911d9beef3c43ba",
        bikeName: "Yamaha",
        bikePrice: "25000",
        bikeImage: "1719636055065-yamaha.jpeg",
        bikeModel: "Mt-15",
      ),
      const ServiceEntity(
        id: "667f90773911d9beef3c43bc",
        bikeName: "Ducati",
        bikePrice: "25000",
        bikeImage: "1719636087221-ducatti.PNG",
        bikeModel: "Monster 797",
      ),
      const ServiceEntity(
        id: "667f90873911d9beef3c43be",
        bikeName: "Beneli",
        bikePrice: "25000",
        bikeImage: "1719636103357-beneli.png",
        bikeModel: "302r",
      ),
      const ServiceEntity(
        id: "667f909c3911d9beef3c43c0",
        bikeName: "CrossFire",
        bikePrice: "25000",
        bikeImage: "1719636124319-crossfire.png",
        bikeModel: "HJ 250",
      ),
      const ServiceEntity(
        id: "667f90b03911d9beef3c43c2",
        bikeName: "Hero Honda",
        bikePrice: "25000",
        bikeImage: "1719636144709-hero.png",
        bikeModel: "X-Pulse 200",
      ),
      const ServiceEntity(
        id: "667f90c53911d9beef3c43c4",
        bikeName: "TVS",
        bikePrice: "25000",
        bikeImage: "1719636165714-tvs.png",
        bikeModel: "Apache RTR 200",
      ),
      const ServiceEntity(
        id: "667f90d03911d9beef3c43c6",
        bikeName: "Bajaj",
        bikePrice: "25000",
        bikeImage: "1719636176695-bajaj.png",
        bikeModel: "Ns 200",
      ),
    ];
    return lstService;
  }
}
