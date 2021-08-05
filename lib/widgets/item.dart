import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Item(Size size, String image, double rating) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.007),
    child: Container(
        width: size.width,
        height: size.height * 0.15,
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: size.width * 0.25,
                height: size.height * 0.12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/topimage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                    child: Text(
                      "Designs for great brochures",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.05, size.height * 0.007, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: size.width * 0.01),
                        Text(
                          '322\$',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.05, size.height * 0.007, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: size.height * 0.025,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: size.height * 0.025,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: size.height * 0.025,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: size.height * 0.025,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: size.height * 0.025,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
  );
}
