import 'package:flutter/material.dart';
import 'moeda_model.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({super.key});

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  late List<MoedaModel> moedas;
  late MoedaModel moedaOrigem;
  late MoedaModel moedaDestino;
  
  TextEditingController valorController = TextEditingController();
  String resultadoVisual = "0.00";

  @override
  void initState() {
    super.initState();
    moedas = MoedaModel.getMoedas();
    moedaOrigem = moedas[1]; 
    moedaDestino = moedas[0]; 
  }

  void converter() {
    String textoDigitado = valorController.text.replaceAll(',', '.');
    double valorInput = double.tryParse(textoDigitado) ?? 0.0;

    double valorEmDolar = valorInput / moedaOrigem.cotacaoDolar;

    double valorFinal = valorEmDolar * moedaDestino.cotacaoDolar;

    setState(() {
      resultadoVisual = valorFinal.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FlexConvert")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor para converter",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => converter(), 
            ),
            const SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<MoedaModel>(
                  value: moedaOrigem,
                  items: moedas.map((MoedaModel moeda) {
                    return DropdownMenuItem(value: moeda, child: Text(moeda.sigla));
                  }).toList(),
                  onChanged: (novaMoeda) {
                    setState(() { moedaOrigem = novaMoeda!; });
                    converter();
                  },
                ),
                
                const Icon(Icons.arrow_forward), 

                DropdownButton<MoedaModel>(
                  value: moedaDestino,
                  items: moedas.map((MoedaModel moeda) {
                    return DropdownMenuItem(value: moeda, child: Text(moeda.sigla));
                  }).toList(),
                  onChanged: (novaMoeda) {
                    setState(() { moedaDestino = novaMoeda!; });
                    converter();
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),

            Text(
              resultadoVisual,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}