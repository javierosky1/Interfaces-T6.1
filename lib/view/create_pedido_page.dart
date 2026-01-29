import 'package:flutter/material.dart';
import 'package:t4_1/model/pedido.dart';
import 'package:t4_1/model/product.dart';
import 'package:t4_1/view/details_page.dart';
import 'package:t4_1/view/products_select_page.dart';

class CreatePedidoPage extends StatefulWidget{

  const CreatePedidoPage({super.key});

  @override
  State<CreatePedidoPage> createState() => _CreatePedidoPageState();
}

class _CreatePedidoPageState extends State<CreatePedidoPage> {

  Map<Product, int> products = {};
  int productsNumber = 0;
  String table = "";
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuevo pedido"),),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mesa / nombre"),
            TextField(
              onChanged: (value) => table = value,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(context, 
                  MaterialPageRoute(builder: (_) => ProductsSelectPage(selectedProducts: products))
                );

                if(!mounted) return;

                if (result != null) {
                  int newProductsNumber = 0;
                  double newTotalPrice = 0.0;

                  result.forEach(
                    (Product key, int value) {
                      newProductsNumber += value;
                      newTotalPrice += key.price * value;
                    }
                  );

                  setState(() {
                    products = result;
                    productsNumber = newProductsNumber;
                    totalPrice = newTotalPrice;
                  });
                }
              },
              child: Text("Elegir productos")
            ),
            SizedBox(height: 20,),
            Text("Número de productos: $productsNumber"),
            Text("Precio total: $totalPrice€"),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Map<Product, int> trimedProducts = {};

                products.forEach((product, amount) {
                  if (amount > 0) {
                    trimedProducts[product] = amount;
                  }
                });

                Navigator.pushNamed(context, DetailsPage.routeName, arguments: Pedido(table: table, trimedProducts, productsNumber, totalPrice));
              },
              child: Text("Ver resumen")
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Map<Product, int> trimedProducts = {};

                    products.forEach((product, amount) {
                      if (amount > 0) {
                        trimedProducts[product] = amount;
                      }
                    });

                    Navigator.pop(context, Pedido(table: table, trimedProducts, productsNumber, totalPrice));
                  }, 
                  child: Text("Guardar")
                ),
                ElevatedButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text("Cancelar")
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}