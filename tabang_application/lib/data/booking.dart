import 'package:flutter/material.dart';

class Booking{
final String service;
final String providerID;
final String provider;
final String clientID;
final String client;
final String rates;
final String coverUrl;
final int booked;
final int stars; 
final String desc;
final List<Review> review;

Booking({
  required this.service,
  required this.providerID,
  required this.provider,
  required this.clientID,
  required this.client,
  required this.rates,
  required this.coverUrl,
  required this.booked,
  required this.stars,
  required this.desc,
  required this.review,
});
}

class TaskCategories{
  final Icon icon;
  final String task;

  TaskCategories({
    required this.icon,
    required this.task
  });
}

class BookingOption{
  final String service;
  final String providerID;
  final String provider;
  final int rates;
  final String coverUrl;
  final int booked;
  final int stars; 
  final String desc;
  final List<Review> review;


  BookingOption({
  required this.service,
  required this.providerID,
  required this.provider,
  required this.rates,
  required this.coverUrl,
  required this.booked,
  required this.stars,
  required this.desc,
  required this.review,

});
}

class Review{
  final String clientID;
  final String client;
  final String review;
  final int stars;

  Review({
    required this.clientID,
    required this.client,
    required this.review,
    required this.stars,
  });
}