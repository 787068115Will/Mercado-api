import 'package:desafioum/pessoa_detalhe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'pessoa_model.dart';
import 'pessoa_store.dart';

class Pessoa1Page extends StatefulWidget {
  const Pessoa1Page({super.key});

  @override
  State<Pessoa1Page> createState() => _Pessoa1PageState();
}

class _Pessoa1PageState extends State<Pessoa1Page> {
  late final PessoaStore _pessoaStore;

  @override
  void initState() {
    super.initState();
    _pessoaStore = PessoaStore();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await _pessoaStore.getPessoasAsync(),
        child: TripleBuilder<PessoaStore, List<PessoaModel>>(
          store: _pessoaStore,
          builder: (context, store) => ListView(
            children: store.state
                .map(
                  (e) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PessoaDetalhePage(id: e.id)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        e.nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
