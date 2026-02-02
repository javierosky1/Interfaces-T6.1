import 'package:flutter/material.dart';
import 'package:t4_1/data/products_data.dart';
import 'package:t4_1/model/product.dart';
import 'package:t4_1/view/components/product_card.dart';

/// Página de selección de productos. Muestra todos los productos listados 
/// en la clase [ProductsData] y permite añadir o quitar productos de uno en uno
class ProductsSelectPage extends StatefulWidget {

  final Map<Product, int> selectedProducts;

  const ProductsSelectPage({super.key, required this.selectedProducts});

  /// Crea un [_ProductsSelectPageState] para este Widget
  @override
  State<ProductsSelectPage> createState() => _ProductsSelectPageState();
}

/// Estado de [ProductsSelectPage]. Guarda los productos seleccionados y la cantidad de cada uno
class _ProductsSelectPageState extends State<ProductsSelectPage> {

  late Map<Product, int> selectedProducts = {};
  late List<ProductCard> productCards = [];

  /// Se ejecuta al crear el estado. Obtiene todos los productos y crea un [ProductCard] 
  /// para cada uno mostrando la cantidad seleccionada de cada producto
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

  /// Construye la interfaz gráfica. Muestra todos los [ProductCard] obtenidos. 
  /// Tiene dos botónes para confirmar o cancelar la selección
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

