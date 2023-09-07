class Aluno {
  int _ra = 0;
  String _senha = '';

  Aluno(this._ra, this._senha);

  get ra => this._ra;

  set ra(final value) => this._ra = value;

  get senha => this._senha;

  set senha(final value) => this._senha = value;
}