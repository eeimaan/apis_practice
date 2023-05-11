import 'dart:convert';

import 'package:apis_practice/model/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<postmodel> postlist = [];

  Future<List<postmodel>> getPostApi() async {
    final resposne =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(resposne.body.toString());
    if (resposne.statusCode == 200) {
      for (Map<String, dynamic>  i in data) {
        postlist.add(postmodel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('hellow APIs')),
      body: Column(
        children: [
         Expanded(
           child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot){
              if (snapshot.hasData){
              return ListView.builder(
                  itemCount: postlist.length,
                  itemBuilder: (context , index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                           Text('Title', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                           Text(postlist[index].title.toString()),
                           SizedBox(height: 5,),
                           Text('Description', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                           Text(postlist[index].body.toString()),
                           
                           
                           
                           ]),
                    ),) ;
                });
              }
              else{
                return const Text('Loading...');}}
           ),
         )
        ],
      ),
    );
  }
}
