import 'package:flutter/material.dart';

class CourierReq {
  final String name;
  final int stars;
  final double rides;
  final double pickup;
  final double price;

  const CourierReq({
    required this.name,
    required this.stars,
    required this.rides,
    required this.pickup,
    required this.price,
  });
}

final List<CourierReq> requests = [
  CourierReq(
    name: 'Yosif Mohamedainn',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
  CourierReq(
    name: 'Hatim Mustafa',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
  CourierReq(
    name: 'Ibrahim Ali',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
];
