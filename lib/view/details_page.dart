import 'package:flutter/material.dart';
import 'package:t4_1/model/pedido.dart';

class DetailsPage extends StatelessWidget {

  static const routeName = "/details"; 

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    Pedido pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    List<Widget> productsList = [];

    pedido.products.forEach((product, amount) {
        productsList.add(Card(
          child: Text("${product.name} x $amount")
        ));
      }
    );
    
    return Scaffold(
      appBar: AppBar(title: Text("Detalles del pedido"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nombre de la mesa: ${pedido.table}"),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return productsList[index];
                }
              )
            ),
            Text("Total: ${pedido.totalPrice}€")
          ],
        ),
      ),
    );
  }
  
}