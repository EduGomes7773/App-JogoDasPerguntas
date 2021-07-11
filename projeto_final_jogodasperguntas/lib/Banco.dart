import 'perguntas.dart';

class Banco{
  int _numeroDaQuestaoAtual = 0;
  List<Perguntas> _bancoDePerguntas =  [
    //Conhecimentos gerais
    Perguntas('A famosa frase “Penso, logo existo” foi dita pelo Filósofo Platão.', false ),
    Perguntas('A invenção do chuveiro elétrico surgiu do Brasil', true ),
    Perguntas('O maior país do mundo em extenção territorial é a Russia.', true ),
    Perguntas('O número mínimo de jogadores numa partida de futebol são 9 jogadores.', false ),
    Perguntas('A montanha mais alta do Brasil se chama Pico Paraná', false ),
    Perguntas('O nome do presidente do Brasil que ficou conhecido como Jango foi João Goulart', true ),
    Perguntas('A luz do Sol demora 20 minutos para chegar à Terra.', false ),
    Perguntas('O idioma Oficial de Macau na Ásia é o Português.', true),
    Perguntas('A Russia não é um país transcontinental', false),
    Perguntas('O nome verdadeiro do escultor Aleijadinho era Francisco Antônio Lisboa.', false),
    Perguntas('O primeiro homem a pisar na Lua em 1969 foi Neil Armstrong.', true),
    Perguntas('O processo de pasteurização e a vacina contra a raiva foi descoberto por Louis Pasteur. ', true),
    Perguntas('Os cromossomos X determinam o sexo masculino.', false),
    Perguntas('O país com a maior população carcerária do mundo é o Brasil.', false)
  ];

  void proximaPergunta(){
    if(_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1){
      _numeroDaQuestaoAtual++;
    }
    print(_numeroDaQuestaoAtual);
    print(_bancoDePerguntas.length);
  }

  String obterQuestao(){
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  bool obterRespostaCorreta(){
    return _bancoDePerguntas[_numeroDaQuestaoAtual].respostaDaQuestao;
  }

  confereFimDaExecucao() {
    if (_numeroDaQuestaoAtual >= _bancoDePerguntas.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  resetarQuiz() {
    _numeroDaQuestaoAtual = 0;
  }


}

