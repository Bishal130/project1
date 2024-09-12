import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, John',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Banepa 45210, Nepal',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryChip(label: 'Fast food', isSelected: true),
                CategoryChip(label: 'Vegetarian'),
                CategoryChip(label: 'Cafe'),
                CategoryChip(label: 'Buffet'),
                CategoryChip(label: 'Pub'),
              ],
            ),
          ),
          // Recommended Section
          Expanded(
            child: ListView(
              children: [
                SectionTitle(title: 'Recommended'),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RestaurantCard(
                          imageUrl:
                              'https://media.istockphoto.com/id/1133151212/photo/japanese-dumplings-gyoza-with-pork-meat-and-vegetables.jpg?s=612x612&w=0&k=20&c=vC6GTUDGK6dD5_QHvY1V7fVUdPx-z4TG73DUACR_L5s=', // Replace with actual URL
                          name: 'Sandar Momo',
                          distance: '0.5 km',
                          rating: '4.9'),
                      RestaurantCard(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnz7ZLHbhmZnI0754qgGXz7o49DKj5vCUi5A&s', // Replace with actual URL
                          name: 'Bajeko Sekuwa',
                          distance: '1.5 km',
                          rating: '4.8'),
                      RestaurantCard(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWgM1FM_j8g0-Jimra7WSH7A7F1biyxOLr8Q&s', // Replace with actual URL
                          name: 'Subway',
                          distance: '2.0 km',
                          rating: '4.7'),
                    ],
                  ),
                ),
                SectionTitle(title: 'Popular'),
                PopularRestaurantCard(
                    name: 'McDonald\'s',
                    rating: '4.4',
                    category: 'Burger',
                    deliveryTime: '20 mins',
                    distance: '1 km',
                    deliveryFee: 'Free delivery'),
                PopularRestaurantCard(
                    name: 'Burger house & Crunchy fried C...',
                    rating: '4.0',
                    category: 'Burger & Fast food',
                    deliveryTime: '20 mins',
                    distance: '1 km',
                    deliveryFee: 'Free delivery'),
                PopularRestaurantCard(
                    name: 'The Bakery Cafe',
                    rating: '3.9',
                    category: 'Bakery & Cake',
                    deliveryTime: '15 mins',
                    distance: '0.5 km',
                    deliveryFee: 'Free delivery'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.black,
        ),
      ),
      backgroundColor: isSelected ? Colors.orange.shade100 : Colors.grey.shade200,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String distance;
  final String rating;

  RestaurantCard(
      {required this.imageUrl,
      required this.name,
      required this.distance,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                distance,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 8),
              Icon(Icons.star, size: 14, color: Colors.orange),
              Text(
                rating,
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularRestaurantCard extends StatelessWidget {
  final String name;
  final String rating;
  final String category;
  final String deliveryTime;
  final String distance;
  final String deliveryFee;

  PopularRestaurantCard(
      {required this.name,
      required this.rating,
      required this.category,
      required this.deliveryTime,
      required this.distance,
      required this.deliveryFee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange.shade100,
            child: Text(name[0], style: TextStyle(fontSize: 24)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$rating ★ • $category',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('$deliveryTime • $distance'),
              ],
            ),
          ),
          Text(
            deliveryFee,
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
