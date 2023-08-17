// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Emalta.dart';
import 'package:youtube/telas/Inscricoes.dart';
import 'package:youtube/telas/Biblioteca.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int indiceAtual = 0;

  List<Widget> telas = [
    Inicio(),
    Emalta(),
    Inscricoes(),
    Biblioteca(),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1 // Usar valor entre 0...1
        ),
        backgroundColor: Colors.white,
        title: Image.asset('images/youtube.png',
        width: 98,
        height: 22,
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.videocam)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.account_circle)
          ),
        ],
      ),
      body: telas[indiceAtual] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        onTap: (indice) {
          setState(() {
          indiceAtual = indice;                                
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange, //Usado quando BottomNavigationBarType.shifting
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red, //Usado quando BottomNavigationBarType.shifting
            icon: Icon(Icons.whatshot),
            label: 'Em alta'
          ),          
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue, //Usado quando BottomNavigationBarType.shifting
            icon: Icon(Icons.subscriptions),
            label: 'Inscrições'
          ),          
          BottomNavigationBarItem(
            // backgroundColor: Colors.green, //Usado quando BottomNavigationBarType.shifting
            icon: Icon(Icons.folder),
            label: 'Biblioteca'
          ),          
        ]
      ),
      
    );
  }
}