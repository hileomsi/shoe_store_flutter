import 'package:flutter/material.dart';
import 'package:shoe_store_flutter/components/fade.dart';

class ShoeScreen extends StatefulWidget {
  final String image;
  final String tag;
  final String name;
  final String brand;
  final String price;

  ShoeScreen({
    this.image,
    this.tag,
    this.name,
    this.brand,
    this.price,
  });

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Fade(
            delay: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
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
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Fade(
                            delay: 1.3,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
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
                          SizedBox(height: 15),
                          Fade(
                            delay: 1.4,
                            child: Text(
                              "Size",
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
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              buildItem('38', 1.42),
                              buildItem('40', 1.44),
                              buildItem('42', 1.46),
                              buildItem('44', 1.48),
                            ],
                          ),
                          SizedBox(height: 50),
                          Fade(
                            delay: 1.5,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String size, double delay) {
    return Fade(
      delay: delay,
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            size,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
