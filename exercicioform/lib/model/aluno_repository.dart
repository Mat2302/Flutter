import 'aluno.dart';

class AlunoRepository {
  List<Aluno> alunos = [];

  AlunoRepository() {
    alunos = [];
    alunos.add(Aluno(201282, "1234"));
    alunos.add(Aluno(201286, '12345'));
  }

  bool verificaAluno(int ra, String senha) {
    for (var aluno in alunos) {
      if (aluno.ra == ra && aluno.senha == senha) {
        return true;
      }
    }
    return false;
  }
}
