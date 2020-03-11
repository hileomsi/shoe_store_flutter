import 'package:flutter/material.dart';
import 'package:shoe_store_flutter/components/fade.dart';
import 'package:shoe_store_flutter/screens/shoe_screen.dart';

class ShoesScreen extends StatefulWidget {
  @override
  _ShoesScreenState createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: null,
      title: Text(
        'Shoes',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_none),
          color: Colors.black,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            buildCategories(),
            SizedBox(height: 20),
            buildCard(
              tag: 'one',
              name: 'Sneakers',
              brand: 'Nike',
              price: '150R\$',
              backgroundImagePath: 'images/one.jpg',
              delay: 1.5,
            ),
            buildCard(
              tag: 'two',
              name: 'Sneakers',
              brand: 'Nike',
              price: '150R\$',
              backgroundImagePath: 'images/two.jpg',
              delay: 1.6,
            ),
            buildCard(
              tag: 'three',
              name: 'Sneakers',
              brand: 'Nike',
              price: '150R\$',
              backgroundImagePath: 'images/three.jpg',
              delay: 1.7,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildCategoryItem(title: 'All', delay: 1.0),
          buildCategoryItem(title: 'Sneakers', delay: 1.1),
          buildCategoryItem(title: 'Football', delay: 1.2),
          buildCategoryItem(title: 'Soccer', delay: 1.3),
          buildCategoryItem(title: 'Golf', delay: 1.4),
        ],
      ),
    );
  }

  Widget buildCategoryItem({
    @required String title,
    @required double delay,
  }) {
    return GestureDetector(
      onTap: () => print('onTap'),
      child: Fade(
        delay: delay,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    @required String tag,
    @required String name,
    @required String brand,
    @required String price,
    @required String backgroundImagePath,
    @required double delay,
  }) {
    return Fade(
      delay: delay,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShoeScreen(
              tag: tag,
              name: name,
              brand: brand,
              price: price,
              image: backgroundImagePath,
            ),
          ),
        ),
        child: Hero(
          tag: tag,
          child: Container(
            height: 250,
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Fade(
                            delay: 1.0,
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: Colors.grey[700],
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Fade(
                            delay: 1.1,
                            child: Text(
                              brand,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                shadows: [
                                  Shadow(
                                    blurRadius: 15,
                                    color: Colors.grey[700],
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Fade(
                  delay: 1.3,
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 15,
                          color: Colors.grey[700],
                          offset: Offset(0, 2),
                        ),
                      ],
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
