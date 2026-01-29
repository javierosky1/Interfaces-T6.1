import 'package:flutter/material.dart';

class PedidoCard extends StatelessWidget {
  final String table;
  final int numProducts;
  final double totalPrice;

  const PedidoCard({
    super.key,
    required this.table,
    required this.numProducts,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Text("Mesa: $table"),
                Text("Número de productos: $numProducts"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Precio total: $totalPrice€")],
            ),
          ),
        ],
      ),
    );
  }
}
