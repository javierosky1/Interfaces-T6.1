import 'package:flutter/material.dart';
import 'package:t4_1/view/details_page.dart';
import 'package:t4_1/view/home_page.dart';
import 'package:t4_1/viewmodel/pedido_viewmodel.dart';

/// Punto de entrada de la aplicación
void main() {
  final PedidoViewmodel pedidoViewmodel = PedidoViewmodel();
  runApp(MainApp(pedidoViewmodel: pedidoViewmodel));
}

/// Ventana principal de la aplicación
class MainApp extends StatelessWidget {

  final PedidoViewmodel pedidoViewmodel;

  const MainApp({super.key, required this.pedidoViewmodel});

  /// Construye la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AMJ_T4.1",
      routes: {
        // Declaración de la ruta nombrada a la página de detalles
        DetailsPage.routeName: (_) => DetailsPage(),
      },
      home: HomePage(pedidoViewmodel: pedidoViewmodel,),
    );
  }
}
