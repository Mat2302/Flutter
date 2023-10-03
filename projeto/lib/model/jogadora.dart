class Jogadora {
  int _cod = 0;
  String _nome = "";
  String _posicao = "";

  Jogadora(this._cod, this._nome, this._posicao);

  get cod => this._cod;

  set cod(final value) => this._cod = value;

  get nome => this._nome;
  
  set nome(final value) => this._nome = value;

  get posicao => this._posicao;

  set posicao(final value) => this._posicao = value;

  @override
  String toString() => 'Jogadora(_cod: $_cod, _nome: $_nome, _posicao: $_posicao)';
}