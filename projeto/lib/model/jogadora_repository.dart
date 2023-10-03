import 'jogadora.dart';

class JogadoraRepository {
  static List<Jogadora> _listaJogadoras = [];
  static get get => _listaJogadoras;
  set set(value) => _listaJogadoras = value;

  JogadoraRepository();

  void adiciona(Jogadora jgr) {
    _listaJogadoras.add(jgr);
  }

  static void remover(Jogadora jgr) {
    _listaJogadoras.remove(jgr);
  }

  void imprimir() {
    for(var jogadora in _listaJogadoras) {
      print(jogadora.toString());
    }
  }
}