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
    print('resultado: digitado ' + query);
    return Container();
  }

  

}