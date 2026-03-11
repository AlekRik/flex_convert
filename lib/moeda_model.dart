class MoedaModel {

  final String nome;
  final String sigla;
  final double cotacaoDolar;

  MoedaModel({
    required this.nome,
    required this.sigla,
    required this.cotacaoDolar,
  });

  static List<MoedaModel> getMoedas() {
    return [
      MoedaModel(nome: "Dólar", sigla: "USD", cotacaoDolar: 1.0),
      
      MoedaModel(nome: "Real", sigla: "BRL", cotacaoDolar: 5.0),
      
      MoedaModel(nome: "Euro", sigla: "EUR", cotacaoDolar: 0.92),
      
      MoedaModel(nome: "Bitcoin", sigla: "BTC", cotacaoDolar: 0.000015),
    ];
  }
}