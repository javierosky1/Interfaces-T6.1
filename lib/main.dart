import 'package:flutter/material.dart';
import 'package:t4_1/view/details_page.dart';
import 'package:t4_1/view/home_page.dart';
import 'package:t4_1/viewmodel/pedido_viewmodel.dart';

void main() {
  final PedidoViewmodel pedidoViewmodel = PedidoViewmodel();
  runApp(MainApp(pedidoViewmodel: pedidoViewmodel));
}

class MainApp extends StatelessWidget {

  final PedidoViewmodel pedidoViewmodel;

  const MainApp({super.key, required this.pedidoViewmodel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AMJ_T4.1",
      routes: {
        DetailsPage.routeName: (_) => DetailsPage(),
      },
      home: HomePage(pedidoViewmodel: pedidoViewmodel,),
    );
  }
}
