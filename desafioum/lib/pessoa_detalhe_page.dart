import 'package:flutter/material.dart';

class PessoaDetalhePage extends StatefulWidget {
  final String id;

  const PessoaDetalhePage({super.key, required this.id});

  @override
  State<PessoaDetalhePage> createState() => _PessoaDetalhePagetate();
}

class _PessoaDetalhePagetate extends State<PessoaDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalhe ${widget.id}'),
        ),
        body: SizedBox.shrink());
  }
}
