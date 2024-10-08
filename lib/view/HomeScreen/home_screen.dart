import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/view/DetailScreen/detail_screen.dart';

class homeScreen extends StatelessWidget {
  static const routeName = '/home';
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildRestaurantItem(context, restaurants[index]);
              },
            );
          },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.city),
          Text(restaurant.rating.toString())
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, detailScreen.routeName,
          arguments: restaurant);
      },
    );
  }
}


