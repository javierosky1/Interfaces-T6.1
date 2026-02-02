import 'package:flutter/material.dart';
import 'package:t4_1/model/pedido.dart';
import 'package:t4_1/view/components/pedido_card.dart';
import 'package:t4_1/view/create_pedido_page.dart';
import 'package:t4_1/viewmodel/pedido_viewmodel.dart';

/// Página principal de la aplicación donde se muestran
/// las mesas y el botón de creación de mesas.
class HomePage extends StatefulWidget {
  final PedidoViewmodel pedidoViewmodel;

  const HomePage({super.key, required this.pedidoViewmodel});

  /// Crea un [_HomePageState] para este Widget
  @override
  State<HomePage> createState() => _HomePageState();
}

/// Estado de [HomePage]. Muestra las mesas guardadas en el [PedidoViewmodel]
/// y permite crear nuevos pedidos
class _HomePageState extends State<HomePage>{

  late PedidoViewmodel pedidoViewmodel;

  /// Se ejecuta al iniciar el estado. Obtiene el viewmodel del [HomePage] que crea el estado
  @override
  void initState() {
    super.initState();
    pedidoViewmodel = widget.pedidoViewmodel;
  }

  /// Crea la interfaz gráfica donde se muestran los pedidos y un botón que navegará a la vista [CreatePedidoPage]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AMJ T4.1")),
      body: Stack(
        children: [
          Center(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: pedidoViewmodel.pedidos.pedidosList.length,
              itemBuilder: (context, int index) {
                return PedidoCard(
                  table: pedidoViewmodel.pedidos.pedidosList[index].table,
                  numProducts:
                      pedidoViewmodel.pedidos.pedidosList[index].countProducts,
                  totalPrice:
                      pedidoViewmodel.pedidos.pedidosList[index].totalPrice,
                );
              },
            ),
          ),
          FloatingActionButton(
            child: Padding(padding: EdgeInsets.all(5), child: Text("Nuevo pedido")),
            onPressed: () async {
              final result = await Navigator.push<Pedido>(context, 
                MaterialPageRoute(builder: (_) => CreatePedidoPage())
              );
              if(!mounted) return;
              
              if (result != null) {
                setState(() => pedidoViewmodel.addPedido(result));
              }
            }
          ),
        ],
      )
    );
  }
}