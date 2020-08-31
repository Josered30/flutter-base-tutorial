import 'package:demo/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Details extends StatelessWidget {

  Anime anime;
  Details({this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          anime.name,
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.grey[900],
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Image.network(
                    anime.imageUrl,
                    height: 200.0,
                    width: 200.0,
                ),
                SizedBox(height: 30.0,),
                Text(
                  anime.synopsis,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Episodes: ${anime.episodes.toString()}',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Score: ${anime.score.toString()}',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Release date: ${ DateFormat.yMd().format(anime.releaseDate)}',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20.0,),

              ],
            ),
          ) ,
        ),
      ),
    );

  }
}
