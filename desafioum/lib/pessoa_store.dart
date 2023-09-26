import 'package:desafioum/pessoa_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'pessoa_repository.dart';

class PessoaStore extends Store<List<PessoaModel>> {
  late final PessoaRepository _pessoaRepository;

  PessoaStore() : super([]);

  @override
  void initStore() {
    super.initStore();
    _pessoaRepository = PessoaRepository();
    getPessoasAsync().then((value) => {});
  }

  Future getPessoasAsync() async {
    await execute(() async => _pessoaRepository.getPessoasAsync());
  }
}
