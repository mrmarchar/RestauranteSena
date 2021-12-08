import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurante/models/recipe.dart';

import '../home.dart';

class CategCard extends StatelessWidget {
  final String? description; //title;
  final String? id; //rating;
  final String? nombre; //cookTime;
  final String? thumbnailUrl;
  CategCard({
    @required this.description,
    @required this.nombre,
    @required this.id,
    @required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Container clicked");
        Navigator.pushNamed(context, HomePage.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(thumbnailUrl!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  description!,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // child: Row(
                    //   children: [
                    //     Icon(
                    //       Icons.attach_money,
                    //       color: Colors.yellow,
                    //       size: 18,
                    //     ),
                    //     SizedBox(width: 7),
                    //     Text(precio!),
                    //   ],
                    // ),
                  ),
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.food_bank,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  SizedBox(width: 50),
                  Text(
                    nombre!,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
