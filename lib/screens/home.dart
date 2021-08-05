import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsearch/fsearch.dart';
import 'package:test_project/application/bloc/router_bloc.dart';
import 'package:test_project/screens/second.dart';
import 'package:test_project/widgets/productitem.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = 'Isroiloglu';
  int _selectedIndex = 0;
  int position = 0;
  int position1 = 0;
  List<String> images = ['image1.jpg', 'image2.jpg', 'image3.jpg'];
  List<String> list1 = [
    'Sevimli Taomingizni Toping',
    'Tezda Yetkazib Beramiz',
    'Buyurtmangizni Kuzatib Turing'
  ];
  List<String> list2 = [
    'Mingdan ortiq taomlar ichidan o\'z tanlovingizni amalga oshiring',
    'Uyga ofisga yoki siz xohlagan istalgan manzilga tezkor yetkazib berish bizdan',
    'Dastur ichidan buyurtmangiz holatini kuzatib boring'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return BlocProvider(
      create: (context) => RouterBloc(),
      child: BlocBuilder<RouterBloc, RouterState>(
        builder: (_, state) {
          if (state is PageOpened) {
            Future.delayed(const Duration(milliseconds: 500), () {})
                .then((value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            });
            state = RouterInitial();
          }
          print('STATE IS = ');
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.grey.shade800,
                unselectedItemColor: Colors.grey.shade400,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.house_siding_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.reorder),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              ),
              backgroundColor: Colors.deepOrange,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.03,
                            size.height * 0.05,
                            size.width * 0.03,
                            size.height * 0.01),
                        child: Row(
                          children: [
                            FSearch(
                              height: size.height * 0.06,
                              width: size.width * 0.8,
                              corner: FSearchCorner.all(8.0),
                              backgroundColor: Colors.white.withOpacity(0.5),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.02,
                                  height: 1.2,
                                  color: Colors.white),
                              prefixes: [
                                const SizedBox(width: 6.0),
                                Icon(
                                  Icons.search,
                                  size: size.height * 0.04,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 3.0)
                              ],
                              suffixes: [
                                const SizedBox(width: 6.0),
                              ],
                              hints: [
                                'Xo\'sh nima izlaymiz...',
                                '\n',
                                'Bugun qanday ovqatlar bor ekan...'
                              ],
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.02,
                                  color: Colors.white),
                              hintSwitchEnable: false,
                              onSearch: (value) {
                                setState(() {
                                  print('search pressed');
                                });
                              },
                            ),
                            SizedBox(width: size.width * 0.04),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: size.height * 0.035,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              size.width * 0.05,
                              size.height * 0.05,
                              size.width * 0.05,
                              size.height * 0.05),
                          child: GestureDetector(
                            onTap: () {
                              print('tapped$position');
                              setState(() {
                                if (position < 2) {
                                  position = position + 1;
                                } else {
                                  position = 0;
                                }
                              });
                            },
                            child: Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/${images[position]}',
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            size.width * 0.06,
                                            size.height * 0.06,
                                            size.width * 0.01,
                                            size.height * 0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lorem Ipsum Collection',
                                              style: TextStyle(
                                                fontSize: size.width * 0.05,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              list2[position],
                                              style: TextStyle(
                                                fontSize: size.width * 0.04,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              list1[position],
                                              style: TextStyle(
                                                fontSize: size.width * 0.04,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.0),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: DotsIndicator(
                                              dotsCount: 3,
                                              position: position.toDouble(),
                                              decorator: DotsDecorator(
                                                color: Colors.grey.shade200,
                                                activeColor:
                                                    Colors.grey.shade400,
                                                size: const Size.square(9.0),
                                                activeSize:
                                                    const Size(18.0, 9.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          )),
                      Stack(children: [
                        Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                          color: Colors.white,
                          child: Container(height: size.height * 1.6),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(size.width * 0.035,
                                  0, size.width * 0.035, size.height * 0.02),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.05),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Categories',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: size.width * 0.05),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              color: Colors.deepOrange.shade800,
                                              fontSize: size.width * 0.04),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Container(
                              height: size.height * 0.18,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return BlocBuilder<RouterBloc, RouterState>(
                                    builder: (context, state) {
                                      return GestureDetector(
                                          onTap: () {
                                            context
                                                .bloc<RouterBloc>()
                                                .add(ItemPressed());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              width: size.width * 0.33,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  'assets/topimage.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ));
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(size.width * 0.035,
                                  0, size.width * 0.035, size.height * 0.02),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.05),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'New Products',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: size.width * 0.05),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              color: Colors.deepOrange.shade800,
                                              fontSize: size.width * 0.04),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              height: size.height * 0.33,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return ProductItem(size, 'image');
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    size.width * 0.05,
                                    size.height * 0.05,
                                    size.width * 0.05,
                                    size.height * 0.05),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (position1 < 2) {
                                        position1 = position1 + 1;
                                      } else {
                                        position1 = 0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/${images[position1]}',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  size.width * 0.06,
                                                  size.height * 0.06,
                                                  size.width * 0.01,
                                                  size.height * 0.01),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Lorem Ipsum Collection',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.05,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    list2[position1],
                                                    style: TextStyle(
                                                      fontSize: size.width * 0.04,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    list1[position1],
                                                    style: TextStyle(
                                                      fontSize: size.width * 0.04,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: DotsIndicator(
                                                    dotsCount: 3,
                                                    position:
                                                        position1.toDouble(),
                                                    decorator: DotsDecorator(
                                                      color:
                                                          Colors.grey.shade200,
                                                      activeColor:
                                                          Colors.grey.shade400,
                                                      size: const Size.square(
                                                          9.0),
                                                      activeSize:
                                                          const Size(18.0, 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(size.width * 0.035,
                                  0, size.width * 0.035, size.height * 0.02),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.05),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Trending Products',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: size.width * 0.05),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                              color: Colors.deepOrange.shade800,
                                              fontSize: size.width * 0.04),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              height: size.height * 0.33,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return ProductItem(size, 'image');
                                },
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              width: size.width,
                              height: size.height * 0.1,
                            )
                          ],
                        ),
                      ])
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  _onTap(position) {}
}
