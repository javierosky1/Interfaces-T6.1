import 'package:flutter/material.dart';
import 'package:t4_1/model/product.dart';

class ProductCard extends StatefulWidget {
  
  final Product product;
  final int initialAmount;

  final ValueChanged<int>? onChanged;


  const ProductCard({super.key, required this.product, this.initialAmount = 0, this.onChanged});

  @override
  State<ProductCard> createState() => _ProductCardState();

}

class _ProductCardState extends State<ProductCard> {

  late final Product product;
  late int amount;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    amount = widget.initialAmount;
  }

  void _sum() {
    setState(() => amount++);
    widget.onChanged?.call(amount);
  }

  void _substract() {
    setState(() => amount--);
    widget.onChanged?.call(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Text(product.name),
          Text("${product.price}€"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _substract(), 
                child: Text("-")
              ),
              SizedBox(width: 10,),
              Text("$amount"),
              SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () => _sum(), 
                child: Text("+"))
            ],
          )
        ],
      ),
    );
  }
}