import 'dart:convert';

import 'package:apis_practice/model/UserModel.dart';
import 'package:apis_practice/model/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class hme_scn extends StatefulWidget {
  const hme_scn({super.key});

  @override
  State<hme_scn> createState() => _hme_scnState();
}

class _hme_scnState extends State<hme_scn> {

  List<UserModel> userlist = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map<String, dynamic>  i in data){
        print(i['name']);
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    }else {
      return userlist;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Apis Practice'),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
          future: getUserApi(),
          builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           
                                ReuseableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                ReuseableRow(title: 'username', value: snapshot.data![index].username.toString()),
                                ReuseableRow(title: 'email', value: snapshot.data![index].email.toString()),
                                 ReuseableRow(title: 'Address',
                                    value: snapshot.data![index].address!.geo!.lat.toString()

                                )
                              ],
                        //children: [
                       //  ReuseableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                       //  ReuseableRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                       //  ReuseableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                        // ReuseableRow(title: 'Address', value: 
                        //  snapshot.data![index].address.toString()
                        // +snapshot.data![index].address!.city.toString()
                        // +snapshot.data![index].address!.suite.toString()
                        // +snapshot.data![index].address!.street.toString()
                        // +snapshot.data![index].address!.geo.toString()
                        // + snapshot.data![index].address!.zipcode.toString()),
                       // ],
                      ),
                    ),
                  );
                },
              );
             
             
            }
             else {
              
              return const CircularProgressIndicator();
             
             }
          },
        ))
      ]),
    );
  }
}

class ReuseableRow extends StatefulWidget {
  String title, value ;
   ReuseableRow({super.key , required this.title, required this.value});

  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Title'),
                            Text('Value'),
                            //Text( snapshot.data![index].name.toString()),
                           ],
                           ),
    );
                        
  }
}