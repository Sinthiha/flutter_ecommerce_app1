import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/models/product.dart';
import 'package:flutter_ecommerce_app1/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTitle extends StatelessWidget {
  final Product product;
  
  const MyProductTitle({
    super.key,
    required this.product,
    });

    // add to cart button pressed
    void addToCart(BuildContext context){
      // show a dialog box to ask user to add to cart
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: Text("Are you sure you want to add this item to your cart?"),
          actions: [
            // cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
              ),
            
            // yes button
             MaterialButton(
             onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().addToCart(product);
             },
             child: Text('Yes'),

              ),
          ],

        ),
        );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              Column(
                children: [

               // product image
                AspectRatio(
                aspectRatio: 1,
                 child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,  
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                 ),
               ),
                
                const SizedBox(height: 25),
                
                  // product name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  
                
                  const SizedBox(height: 10),
                
                  // product descripion
                   Text(
                    product.description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    ),
                
                   const SizedBox(height: 25),
                
                  // product price + add to cart button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // product price
                      // ignore: prefer_interpolation_to_compose_strings
                      Text('\$'+product.price.toStringAsFixed(2)),

                      // add to cart button
                      Container(
                        decoration: BoxDecoration(
                           color: Theme.of(context).colorScheme.secondary,  
                           borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () => addToCart(context),
                           icon: const Icon(Icons.add),
                           ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
      );


  }
}