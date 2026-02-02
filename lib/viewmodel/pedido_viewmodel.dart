import 'package:flutter/material.dart';
import 'package:t4_1/data/products_data.dart';
import 'package:t4_1/model/pedido.dart';
import 'package:t4_1/model/pedidos.dart';

/// Viewmodel que maneja los [Pedido] ya creados. Permite añadir nuevos [Pedido]
class PedidoViewmodel extends ChangeNotifier{

  Pedidos _pedidos = Pedidos(_getInitialValues());

  Pedidos get pedidos => _pedidos;

  /// Añade un nuevo [Pedido] a la lista de pedidos.
  void addPedido(Pedido p) {
    List<Pedido> newPedidos = List.filled(_pedidos.pedidosList.length + 1, _pedidos.pedidosList[0]);

    for (var i = 0; i < _pedidos.pedidosList.length; i++) {
      newPedidos[i] = _pedidos.pedidosList[i];
    }

    newPedidos[newPedidos.length - 1] = p;

    _pedidos = Pedidos(newPedidos);
  }

  /// Obtiene los valores iniciales hardcodeados de pedidos
  static List<Pedido> _getInitialValues() {
    List<Pedido> pedidos = List.filled(3, Pedido(table: "Mesa 1", Map.of({ProductsData.products[0]: 2}),2, 5.0));
    pedidos[1] = Pedido(table: "Mesa 2", Map.of({ProductsData.products[1]: 1}), 1, 2.5);
    pedidos[2] = Pedido(table: "Pedro", Map.of({ProductsData.products[2]: 1, ProductsData.products[4]: 1}), 2, 3.5);

    return pedidos;
  }
}