import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // الحصول على مسار مجلد التطبيق

  runApp(
    EcommerceApp(),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, dynamic>> products = [];
  String? selectedBrandName;
  RangeValues? selectedPriceRange;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final jsonString = await rootBundle.loadString('assets/task.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      final List<Map<String, dynamic>> data = [];
      for (var item in jsonData) {
        data.add({
          "brandName": item["Brand Name"] ?? "Unknown",
          "productName": item["Product Name"] ?? "Unknown",
          "price":
              double.tryParse(item["Price"]?.replaceAll("\$", "") ?? '0') ?? 0,
          "imageUrl": item["Image URL"] ?? "",
        });
      }

      setState(() {
        products = data;
      });
    } catch (e) {
      debugPrint("Error loading JSON file: $e");
    }
  }

  // دالة لحفظ المنتج في المفضلة
  Future<void> addToFavorites(Map<String, dynamic> product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList('favorites') ?? [];

    // تحويل المنتج إلى JSON وإضافته
    String productJson = json.encode(product);
    favoritesList.add(productJson);

    // حفظ البيانات في SharedPreferences
    await prefs.setStringList('favorites', favoritesList);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product["productName"]} added to favorites')),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProducts = products.where((product) {
      final matchesBrand = selectedBrandName == null ||
          product["brandName"]
              .toString()
              .toLowerCase()
              .contains(selectedBrandName!.toLowerCase());
      final matchesPrice = selectedPriceRange == null ||
          (product["price"] >= selectedPriceRange!.start &&
              product["price"] <= selectedPriceRange!.end);
      return matchesBrand && matchesPrice;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          DropdownButton<String>(
            hint: const Text(
              "Filter by Brand",
              style: TextStyle(color: Colors.black),
            ),
            dropdownColor: Colors.white,
            icon: const Icon(Icons.filter_list, color: Colors.black),
            value: selectedBrandName,
            onChanged: (value) {
              setState(() {
                selectedBrandName = value;
              });
            },
            items: products
                .map((product) => product["brandName"].toString())
                .toSet() // إزالة التكرار في أسماء العلامات التجارية
                .map((brand) => DropdownMenuItem<String>(
                      value: brand,
                      child: Text(brand),
                    ))
                .toList(),
          ),
          DropdownButton<RangeValues>(
            hint: const Text(
              "Filter by Price",
              style: TextStyle(color: Colors.black),
            ),
            dropdownColor: Colors.white,
            icon: const Icon(Icons.monetization_on, color: Colors.black),
            value: selectedPriceRange,
            onChanged: (value) {
              setState(() {
                selectedPriceRange = value;
              });
            },
            items: [
              const RangeValues(0, 50),
              const RangeValues(50, 100),
              const RangeValues(100, 200),
              const RangeValues(200, 500),
            ]
                .map((range) => DropdownMenuItem<RangeValues>(
                      value: range,
                      child:
                          Text("${range.start.toInt()} - ${range.end.toInt()}"),
                    ))
                .toList(),
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Image.network(
                          product["imageUrl"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(product["productName"],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () async {
                              await addToFavorites(product);
                            },
                          ),
                          Text(
                            product["brandName"],
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        "\$${product["price"]}",
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
