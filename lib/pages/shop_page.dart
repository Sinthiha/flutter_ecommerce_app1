import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/components/my_drawer.dart';
import 'package:flutter_ecommerce_app1/components/my_product_title.dart';
import 'package:flutter_ecommerce_app1/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List filteredProducts = [];

  @override
  void initState() {
    super.initState();
    final products = context.read<Shop>().shop;
    filteredProducts = products; // initially show all products
  }

  void _searchProducts(String query) {
    final products = context.read<Shop>().shop;
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products; // reset if empty
      } else {
        filteredProducts = products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _showSearchDialog() async {
    String searchQuery = '';
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 4, 30, 56),
          title: const Text(
            'Search Products',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Type product name...',
              hintStyle: TextStyle(color: Colors.white54),
            ),
            onChanged: (value) {
              searchQuery = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, searchQuery),
              child: const Text('Search', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ''),
              child: const Text('Clear', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );

    if (result != null) {
      _searchProducts(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 30, 56).withOpacity(0.8),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          "Happy Shopping!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 182, 113, 161).withOpacity(0.8),
      body: ListView(
        children: [
          const SizedBox(height: 30),

          // Search Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton.icon(
              onPressed: _showSearchDialog,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color.fromARGB(221, 190, 187, 187)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              ),
              icon: const Icon(Icons.search, color: Colors.grey),
              label: const Text(
                'Search for Products....',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Shop subtitle
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: const Text(
                'Pick from a selected list of Premium Products!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Product list
          SizedBox(
            height: 550,
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found!',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MyProductTitle(product: product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
