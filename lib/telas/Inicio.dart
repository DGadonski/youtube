// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:youtube/youtube.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../Api.dart';
import '../model/video.dart';

class Inicio extends StatefulWidget {

  String? pesquisa;

  Inicio(this.pesquisa);


  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  listarVideos(String? pesquisa){

    Future<List<Video>> videos;

    Api api = Api();
    videos = api.pesquisar(pesquisa);    

    return videos;
    
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder<List<Video>>(
      future: listarVideos(widget.pesquisa),
      builder: (context, snapshot){ 
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index){

                  var videos = snapshot.data;
                  Video video = videos![index];

                  return GestureDetector(
                    onTap: (){
                      
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem)
                            ) 
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        )
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (context, index){
                  return Divider(
                    height: 2,
                    color: Colors.grey,
                  );
                }, 
                itemCount: snapshot.data!.length);  
           }else{
            return Center(child: Text('Nenhum dado a ser exibido!'));
           }     
        }
      });
  }
}