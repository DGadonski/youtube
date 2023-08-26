// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        }, 
        icon: const Icon(
          Icons.clear  
        )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return 
      IconButton(
        onPressed: (){
          close(context, "");
        }, 
        icon: const Icon(
          Icons.arrow_back  
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // print('resultado: pesquisa realizada.');
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    List<String> lista = [];

    if (query.isNotEmpty) {

    //Poderia ser consultada uma api para ter essa lista.
      lista = [
        "Android", "Android navegação", "iOS", "Jogos"
      ].where((texto) => texto.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(lista[index]),
          onTap: () {
            close(context, lista[index]);

          },
        );
      });

    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
  
  }

  

}