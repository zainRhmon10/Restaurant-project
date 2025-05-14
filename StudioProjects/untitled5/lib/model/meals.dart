import 'package:flutter/foundation.dart';

class Meals {
   String img;
   String name;
   int rating;
   double price;
  Meals( {this.img="http://i.pinimg.com/736x/3e/c9/fe/3ec9fe32c6217014789b5f42e2343f47.jpg", this.name="", this.rating=0, this.price=0});

}
class Category{
  String name;
  String img;
  Category({required this.name,required this.img});
}