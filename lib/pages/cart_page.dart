import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/components/my_button.dart';
import 'package:flutter_ecommerce_app1/models/product.dart';
import 'package:flutter_ecommerce_app1/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Set<Product> _selectedItems = {};

  void toggleSelection(Product product) {
    setState(() {
      if (_selectedItems.contains(product)) {
        _selectedItems.remove(product);
      } else {
        _selectedItems.add(product);
      }
    });
  }

  void removeSelectedItems(BuildContext context) {
    if (_selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No items selected to remove!")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 6, 37, 83),
        content: Text(
          "Are you sure you want to remove ${_selectedItems.length} items?",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final shop = context.read<Shop>();
              for (var product in _selectedItems) {
                shop.removeFromCart(product);
              }
              setState(() => _selectedItems.clear());
            },
            child: const Text('Yes', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context, double totalAmount) {
    if (_selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select items to pay for!")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9),
        content: Text(
          "You are about to pay \$${totalAmount.toStringAsFixed(2)} for ${_selectedItems.length} items.\n\n(Connect this app to your payment backend)",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    // Total amount for selected items (quantity considered)
    final totalAmount = _selectedItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9),
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/shop_page'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'My Cart',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Check your cart before paying!',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        actions: [
          if (_selectedItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () => removeSelectedItems(context),
            ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 4, 19, 36),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                      'Your Cart is Empty!',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      final isSelected = _selectedItems.contains(item);

                      return GestureDetector(
                        onTap: () => toggleSelection(item),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.pinkAccent.withOpacity(0.2)
                                : const Color.fromARGB(22, 241, 235, 243)
                                    .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.pinkAccent
                                  : Colors.white.withOpacity(0.6),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isSelected,
                                onChanged: (_) => toggleSelection(item),
                                activeColor: Colors.pinkAccent,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item.imagePath,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (item.quantity > 1) {
                                              setState(() => item.quantity--);
                                            }
                                          },
                                          icon: const Icon(
                                              Icons.remove,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              setState(() => item.quantity++),
                                          icon: const Icon(Icons.add,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Summary + Pay Button
          
          if (cart.isNotEmpty)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Selected Items: ${_selectedItems.length}",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Total: \$${totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  MyButton(
                    onTap: () => payButtonPressed(context, totalAmount),
                    backgroundColor:
                        const Color.fromARGB(255, 182, 113, 161)
                            .withOpacity(0.9),
                    textColor: Colors.white,
                    child: const Text(
                      "PAY NOW!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
