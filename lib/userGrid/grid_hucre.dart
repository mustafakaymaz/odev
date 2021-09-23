import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_app/model/user.dart';
class UserHucre extends StatelessWidget {

  @required
  final User user;
  const UserHucre(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "images${user.id}",
                  child: FadeInImage.assetNetwork(
                      placeholder: "images/no_image.png",
                      image: user.profilePhoto,
                      width: 100,
                    height: 100,
                  ),
                ),
              )
              ),
              Padding(
                padding:  EdgeInsets.all(10),
                child: Text(
                  user.fullName,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
