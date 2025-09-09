import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              // drawer header logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color:  Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                ),
              
                const SizedBox(height: 25),
              
                //  shop title
                  
                  MyListTitle(
                    text: "Shop",
                    icon: Icons.home,
                    onTap: () => Navigator.pop(context),
                    ),
                  
              
                // cart title
              
                 MyListTitle(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      // pop drawer first
                      Navigator.pop(context);
              
                      // go to cart page
                      Navigator.pushNamed(context, '/cart_page');
                    },
                    ),
              
                
                 // settings title
                 
                  MyListTitle(
                  text: "Settings",
                  icon: Icons.settings,
                  onTap: () {
                  Navigator.pop(context); 
                  Navigator.pushNamed(context, '/settings_page');
                   },
                   ),

              

                // my profile title

                 MyListTitle(
                    text: "My Profile",
                    icon: Icons.account_circle,
                   onTap: () {
                   Navigator.pop(context); 
                   Navigator.pushNamed(context, '/profile_page');
                   },
                    ),
            ],
          ),


            // exit shop title

             Padding(
               padding: const EdgeInsets.only(bottom: 25),
               child: MyListTitle(
                  text: "Exit",
                  icon: Icons.logout,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/splash_screen', (route)=> false),
               ),
             ),

            ],
          ),
          
        
      );
    
  }
}