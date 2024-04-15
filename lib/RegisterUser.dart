

import 'package:flutter/material.dart';

import '../DatabaseHelper.dart';
import 'dart:convert';

class UserData {
  final String name;
  final String contact;
  final String email;

  UserData({
    required this.name,
    required this.contact,
    required this.email,
  });
}
class RegisterUser  extends StatefulWidget {
  @override
  _DatabaseListViewState createState() =>  _DatabaseListViewState();
}

class _MyHomePageState extends State< RegisterUser > {
  late  List<UserData> _items;

  @override
  void initState() {
    super.initState();
    //_fetchItems() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: _items[index]);
        },
      ),
    );
  }


}
class _DatabaseListViewState extends State<RegisterUser> {
  List<UserData>? _items;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    List<UserData>  studentData=await DatabaseHelper.instance.getallUser();
    setState(() {
      _items = studentData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database ListView'),
      ),
      body: ListView.builder(
        itemCount: _items!.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: _items![index]);
        },
      ),
    );
  }




}
class ItemWidget extends StatelessWidget {
  final  UserData item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' Name: ${item.name}'),
            Text('Contact: ${item.contact}'),
            Text('Email: ${item.email}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.send),
          onPressed: () async {

          },
        ),
      ),
    );
  }
}