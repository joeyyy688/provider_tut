import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'cartmodel.dart';
import 'item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, cart,child){
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${NumberFormat.simpleCurrency(
                    decimalDigits: 2,

                  ).format(item.price)}'),
                  Expanded(
                    child: Center(
                      child: Text(item.name),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite,
                          color: Provider.of<CartModel>(context, listen: false).isItemInCart(item) ? Colors.orange : Colors.grey,),
                        onPressed: () {
                          if(cart.isItemInCart(item)){
                            cart.removeFromCart(item);
                          } else {
                            cart.addToCart(item);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
