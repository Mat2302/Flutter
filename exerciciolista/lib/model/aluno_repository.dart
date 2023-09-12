import 'aluno.dart';

class AlunoRepository {
  static List<Aluno> _listaAlunos = [];
  static get get => _listaAlunos;
  set set(value) => _listaAlunos = value;

  AlunoRepository();

  void adc(Aluno al) {
    _listaAlunos.add(al);
  }

  static void del(Aluno al) {
    _listaAlunos.remove(al);
  }

  void imp() {
    for(var aluno in _listaAlunos) {
      print(aluno.toString());
    }
  }
}
