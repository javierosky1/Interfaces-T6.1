
import 'package:t4_1/model/product.dart';

class Pedido {
  
  final String table;
  final Map<Product, int> products;
  final int countProducts;
  final double totalPrice;

  Pedido(this.products, this.countProducts, this.totalPrice, {this.table = "Mesa sin nombre"});
}