import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/widgets/item.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

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
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width * 0.03, size.height * 0.05,
                size.width * 0.03, size.height * 0.01),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.west),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      color: Colors.grey,
                    ),
                    FSearch(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      corner: FSearchCorner.all(8.0),
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                          height: 1.2,
                          color: Colors.grey.shade200),
                      prefixes: [
                        const SizedBox(width: 6.0),
                        Icon(
                          Icons.search,
                          size: size.height * 0.04,
                          color: Colors.grey,
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
                          color: Colors.grey.shade400),
                      hintSwitchEnable: false,
                      onSearch: (value) {
                        setState(() {
                          print('search pressed');
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Products',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: size.width * 0.05),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: size.width * 0.25),
                      Icon(
                        Icons.sort,
                        size: size.height * 0.04,
                        color: Colors.grey,
                      ),
                      SizedBox(width: size.width * 0.01),
                      Icon(
                        Icons.reorder,
                        size: size.height * 0.04,
                        color: Colors.grey,
                      ),
                      SizedBox(width: size.width * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04),
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Item(size, 'rest$index', 4.9);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
