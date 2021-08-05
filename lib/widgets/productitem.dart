import 'package:flutter/material.dart';

Widget ProductItem(Size size, String image) {
  return Padding(
    padding:  EdgeInsets.only(right: size.width * 0.02),
    child: Container(
        width: size.width * 0.4,
        height: size.height * 0.18,
        child: GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/topimage.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Catalog design",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.04),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "322\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.04),
                  ),
                ),
              ],
            ),
          ),
        )),
  );
}
