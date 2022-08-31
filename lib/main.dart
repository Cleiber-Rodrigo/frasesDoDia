
import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  //O método runApp é usada para rodar o App
  runApp(MaterialApp( //O widget MaterialApp fornece um layout orientado ao 'material design', que é uma linguagem de design
    home: Home(), //Especificado qual será a primeira tela a ser exibida no App
    debugShowCheckedModeBanner: false, //Colocamos false para esconder a mensagem de debug
  ));
}
//Home é a nossa classe principal
class Home extends StatefulWidget { //Statefulwidget é um widget que possui um estado mutável.
  const Home({Key? key}) : super(key: key);

  @override 
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Criamos um Array
  var _frases = [
    "Saber encontrar a alegria na alegria dos outros é o segredo da felicidade.",
    "A alegria de fazer o bem é a única felicidade verdadeira",
    "Ser feliz sem motivo é a mais autêntica forma de felicidade",
    "A alegria não está nas coisas, está em nós"
  ];
  var frase = "Clique abaixo para gerar frases";
//Método que gera frases aleatórias
  void _gerarFrases(){
    var _numAleatorio = new Random().nextInt(_frases.length);

    setState(() {
      frase = _frases[_numAleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Crio o esqueleto do App
      appBar: AppBar( //Crio a barra superior
        backgroundColor: Colors.green, //Define a cor da barra superior
      title: Text( //Cria o Título que fica na barra superior e abaixo temos algumas formatações nesse título
        "Frases do dia",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      body: Center( //Aqui temos o corpo do App
        child: Container( 
          padding: EdgeInsets.all(20), //Espaçamento interno do container
          child: Column( //Column é um widget usado para colocar ítens um abaixo do outro
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Alinhamento no eixo Y no caso do Column
            crossAxisAlignment: CrossAxisAlignment.center, //Alinhamento no eixo X no caso da Column
            children: [
              Image.asset("imagens/logo.png"), //Inserindo imagens
              Text(
                "$frase",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              RaisedButton( //Inserindo um botão
                color: Colors.lightGreen,
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                  onPressed: _gerarFrases, //Definimos que ao pressionar esse botão, vamos chamar o método _gerarFrases
              ),
            ],
          ),
        ),
      ),

    );
  }
}
