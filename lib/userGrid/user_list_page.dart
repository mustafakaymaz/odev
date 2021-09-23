import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_app/services/api.dart';
import 'package:odev_app/userGrid/grid_detail.dart';
import 'package:odev_app/userGrid/grid_hucre.dart';
import '../model/user.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
  }
  gridView(AsyncSnapshot<List<User>> snapshot){
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        children: snapshot.data.map((user) {
          return GestureDetector(
            child: GridTile(
              child: UserHucre(user),
            ),
            onTap: (){
              goDetailPage(context, user);
            },
          );
        }).toList(),
      ),
    );
  }
  goDetailPage(BuildContext context, User user ){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => UserDetails(user: user)));
  }
  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<User>>(
                future: UsersApi.getUsers(),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text('error ${snapshot.error}');

                  }else if(snapshot.hasData){
                    return gridView(snapshot);
                  }
                  return circularProgress();
                },
              ),
          ),
        ],
      )
    );
  }
}


