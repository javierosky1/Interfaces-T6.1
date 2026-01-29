import 'package:flutter/material.dart';
import 'package:t4_1/data/products_data.dart';
import 'package:t4_1/model/product.dart';
import 'package:t4_1/view/components/product_card.dart';

class ProductsSelectPage extends StatefulWidget {

  final Map<Product, int> selectedProducts;

  const ProductsSelectPage({super.key, required this.selectedProducts});

  @override
  State<ProductsSelectPage> createState() => _ProductsSelectPageState();
}

class _ProductsSelectPageState extends State<ProductsSelectPage> {

  late Map<Product, int> selectedProducts = {};
  late List<ProductCard> productCards = [];

  @override
  void initState() {
    super.initState();
    selectedProducts = widget.selectedProducts;
    for (var product in ProductsData.products) {
      bool selected = false;

      for (var selectedProduct in selectedProducts.keys) {
        if (product.name == selectedProduct.name) {
          productCards.add(
            ProductCard(product: product, initialAmount: selectedProducts[selectedProduct]!, 
              onChanged: (value) {setState( () => selectedProducts[selectedProduct] = value);},
            )
          );
          selected = true;
          break;
        }
      }

      if (!selected) {
        productCards.add(ProductCard(product: product, onChanged: (value) {setState( () => selectedProducts[product] = value);}));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:  Column( //Peta. Mirar ChatGPT
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productCards.length,
                itemBuilder: (context, index) {
                  return productCards[index];
                }
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, selectedProducts),
                  child: Text("Confirmar elección")
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

