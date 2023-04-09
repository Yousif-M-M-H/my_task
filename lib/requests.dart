import 'package:flutter/material.dart';

class CourierRequest {
  final String name;
  final String pickupCity;
  final String destinationCity;
  final double weight;
  final int quantity;

  const CourierRequest({
    required this.name,
    required this.pickupCity,
    required this.destinationCity,
    required this.weight,
    required this.quantity,
  });
}

final List<CourierRequest> requests = [
  CourierRequest(
    name: 'Yosif Mohamedain',
    pickupCity: 'Magusa',
    destinationCity: 'Los Angeles',
    weight: 2.5,
    quantity: 1,
  ),
  CourierRequest(
    name: 'Ahmed Mohamedain',
    pickupCity: 'Lefoksa',
    destinationCity: 'Seattle',
    weight: 1.8,
    quantity: 3,
  ),
  CourierRequest(
    name: 'Khalid Mohamedain',
    pickupCity: 'Hiati',
    destinationCity: 'Chicago',
    weight: 5.2,
    quantity: 2,
  ),
];
