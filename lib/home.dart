import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      print('nulo');
      _resultado = "Valor inválido, (obs: utilize ponto ao invés de vírgula)";
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        _resultado = "Melhor abastecer com gasolina";
      } else {
        _resultado = "Melhor abastecer com álcool";
      }
    }

    _controllerAlcool.text = "";
    _controllerGasolina.text = "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool ou gasolina?"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                // botao ocupa toda largura da tela
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Image.asset("images/logo.png")),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "Saiba a melhor opção de combustível para abastecer seu carro",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  TextField(
                    controller: _controllerAlcool,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Preço do álcool, ex: R\$ 1.59"),
                    style: TextStyle(fontSize: 22),
                  ),
                  TextField(
                    controller: _controllerGasolina,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Preço da gasolina, ex: R\$ 1.59"),
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text("Calcular", style: TextStyle(fontSize: 30)),
                      onPressed: _calcular,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _resultado,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ));
  }
}
