import 'package:demo/models/anime.dart';
import 'package:demo/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  String username;
  Home({this.username});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  List<Anime> animes = List<Anime>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            title: Text(
              'Home',
              style: TextStyle(),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.logout),
            backgroundColor: Colors.grey[900],
          ),
          body: Column(
            children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0,0,0,0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        hintText: 'Search',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                      ),
                      controller: controller,

                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      if (controller.text.isNotEmpty) {
                        animes = await getData(controller.text);
                        setState(() {});
                      }
                    },
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                  child: Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, '/details', arguments: {
                          'anime':animes[index]
                        });
                      },
                      title: Text(
                        animes[index].name,
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                          ),
                          child: Image.network(animes[index].imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: animes.length,
            ),
          ])),
    );
  }
}
