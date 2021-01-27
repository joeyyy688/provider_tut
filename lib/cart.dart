import 'package:catalog/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context,cart, child){
          return ListView.builder(itemCount : cart.getNoOfItems(),
              itemBuilder: (context, i){
            return Column(
              children: [
                ListTile(
                  title: Text(cart.getItem(i).name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever, color: Colors.red,),
                    onPressed: (){
                      cart.removeFromCartByIndex(i);
                    },
                  ),
                ),
                Divider(),
              ],
            );
              });
        },
      ),
    );
  }
}
