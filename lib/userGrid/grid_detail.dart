import 'package:flutter/material.dart';

import '../model/user.dart';
class UserDetails extends StatefulWidget {

  final User user;
  UserDetails({@required this.user});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: "images${widget.user.id}",
                child: FadeInImage.assetNetwork(
                    placeholder: "images/no_image.png",
                    image: widget.user.profilePhoto),
            ),
            SizedBox(height:30 ,),
            OutlineButton(
                child: Icon(Icons.close),
                onPressed:()=> Navigator.of(context).pop()),
          ],
        ),
      ),
    );
  }
}
