import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'pessoa_model.dart';
import 'pessoa_store.dart';

class Pessoa2Page extends StatefulWidget {
  const Pessoa2Page({super.key});

  @override
  State<Pessoa2Page> createState() => _Pessoa2PageState();
}

class _Pessoa2PageState extends State<Pessoa2Page> {
  late final PessoaStore _pessoaStore;
  late Disposer _disposer;
  late List<PessoaModel> _pessoas = [];

  @override
  void initState() {
    super.initState();
    _pessoaStore = PessoaStore();
    _disposer = _pessoaStore.observer(
        onState: (state) => setState(() {
              _pessoas = state;
            }),
        onLoading: (loading) {
          if (loading) {
            EasyLoading.show(status: 'loading...');
          } else {
            EasyLoading.dismiss();
          }
        },
        onError: (error) {
          EasyLoading.showError('Ocorreu erro ao executar a consulta.');
        });
  }

  @override
  void dispose() {
    super.dispose();
    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2 '),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await _pessoaStore.getPessoasAsync(),
        child: ListView(
          children: _pessoas
              .map(
                (e) => Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    e.nome!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
