import 'dart:convert';
import 'package:apis_practice/model/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_scrn extends StatefulWidget {
  const home_scrn({super.key});

  @override
  State<home_scrn> createState() => _home_scrnState();
}

class _home_scrnState extends State<home_scrn> {
  List<Photos> photoslist = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id'], );
        photoslist.add(photos);
      }
      return photoslist;
    } else {
      return photoslist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('hellow apis'),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
           future: getPhotos(), 
            builder: (context, snapshot) {
            return ListView.builder(
              itemCount: photoslist.length,
              itemBuilder: (context, index) {
              return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                ),
                title: Text(snapshot.data![index].title.toString()),
                subtitle: Text(snapshot.data![index].id.toString()),
              );
            });
          }),
        )
      ]),
    );
  }
}

class Photos {
  String title, url;
  int id ;
  Photos({required this.title, required this.url, required this.id });
}
