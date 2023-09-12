class Aluno {
  int _ra = 0;
  String _nome = '';

  Aluno(this._ra, this._nome);

  get ra => this._ra;

  set ra(final value) => this._ra = value;

  get nome => this._nome;

  set nome(final value) => this._nome = value;

  @override
  String toString() => 'Aluno(_ra: $_ra, _nome: $_nome)';
}