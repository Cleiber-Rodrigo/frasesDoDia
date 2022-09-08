
import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  //O método runApp é usada para rodar o App.  O widget MaterialApp fornece um layout orientado ao 'material design', que é uma linguagem de design
  runApp(MaterialApp( 
    //Especificado qual será a primeira tela a ser exibida no App
    home: Home(),
    //Colocamos false para esconder o banner de debug
    debugShowCheckedModeBanner: false, 
  ));
}
//Home é a nossa classe principal.   Statefulwidget é um widget que possui um estado mutável.
class Home extends StatefulWidget {
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
    //Crio o esqueleto do App
    return Scaffold( 
      //Crio a barra superior
      appBar: AppBar( 
        //Define a cor da barra superior
        backgroundColor: Colors.green, 
        //Cria o Título que fica na barra superior e abaixo temos algumas formatações nesse título
      title: Text( 
        "Frases do dia",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      //Aqui temos o corpo do App
      body: Center( 
        child: Container( 
          //Espaçamento interno do container
          padding: EdgeInsets.all(20),
          //Column é um widget usado para colocar ítens um abaixo do outro
          child: Column( 
            //Alinhamento no eixo Y no caso do Column 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             //Alinhamento no eixo X no caso da Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Inserindo imagens
              Image.asset("imagens/logo.png"), 
              Text(
                "$frase",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              //Inserindo um botão
              RaisedButton( 
                color: Colors.lightGreen,
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                //Definimos que ao pressionar esse botão, vamos chamar o método _gerarFrases
                  onPressed: _gerarFrases, 
              ),
            ],
          ),
        ),
      ),

    );
  }
}
