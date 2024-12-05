import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Products"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('No favorites added.'));
          } else {
            final favorites = snapshot.data!;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  leading: Image.network(favorite["imageUrl"]),
                  title: Text(favorite["productName"]),
                  subtitle: Text("\$${favorite["price"]}"),
                );
              },
            );
          }
        },
      ),
    );
  }

  // دالة لتحميل المفضلات من SharedPreferences
  Future<List<Map<String, dynamic>>> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList('favorites') ?? [];

    // تحويل كل عنصر من القائمة من JSON إلى Map<String, dynamic>
    return favoritesList.map((item) {
      return Map<String, dynamic>.from(json.decode(item));
    }).toList();
  }
}
