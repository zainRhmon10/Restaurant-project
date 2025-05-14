import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../model/meals.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});
String selectedOption="delivery";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  List<String> eatingOptionsStrings=["delivery","take away","in restaurant"];
  List<Category> categories=[
    Category(name: "meal",    img: "http://i.pinimg.com/736x/3e/c9/fe/3ec9fe32c6217014789b5f42e2343f47.jpg"),
    Category(name: "starter", img: "https://i.pinimg.com/736x/9e/89/83/9e898357752b6c91210b9ced6d864cc9.jpg"),
    Category(name: "dessert", img: "https://i.pinimg.com/736x/7f/52/bf/7f52bf9170a6250ce37a224dd1aa5aa5.jpg"),
    Category(name: "drink",   img: "https://i.pinimg.com/736x/33/47/42/334742476baa145ebc00a8ffeff7f1b8.jpg")];
  List<Meals> mealsList=[Meals( name: "chicken pizza",price: 25,rating: 2),Meals( name: "burger",price: 14,rating: 5),Meals( name: "Shawerma",price: 10,rating: 3)];
@override
void initState() {
  super.initState();
  _controller = VideoPlayerController.networkUrl(Uri.parse(
      'https://media.istockphoto.com/id/2029934651/video/salad-bowl-of-salmon-avocado-broccoli-olives-and-fresh-romaine-lettuce-poke-bowl-salad-stock.mp4?s=mp4-640x640-is&k=20&c=qAtwpNe4fmXLUdWzEIiOsYfz_LCwNAwZHkYa_knsWfs='))
    ..initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
}
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,

        title:InkWell(
          child: Container(

      padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
                color: Colors.white,
           // border: Border.all(color: Theme.of(context).dividerColor)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("choose a location for delivery ",style: TextStyle(color:Colors.grey,),),
                Icon(Icons.pin_drop,color: Colors.red,)
              ],
            )
          ),
        ),

        actions: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
              color: Colors.white,
              // border: Border.all(color: Theme.of(context).dividerColor)
            ),
            padding: const EdgeInsets.all( 8.0),
            margin: const EdgeInsets.all( 8.0),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
       body: SingleChildScrollView(
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: eatingOptionsStrings.map((e)=>
                     GestureDetector(
                       onTap: (){
                         setState(() {
                           //ToDo implement navigating to map
                           widget.selectedOption=e;
                         });

                       },
                       child: Column(
                         children: [
                           Container(
                             margin: EdgeInsets.all(10),
                             padding: EdgeInsets.all(5),
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                 border: widget.selectedOption==e? Border.all(color: Colors.orange,width: 2) : Border.all(color: Colors.white),
                                 boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
                                 color: Theme.of(context).colorScheme.onPrimary),
                             child: Icon(
                               e=="delivery"? Icons.delivery_dining_outlined :e=="take away"? Icons.takeout_dining_outlined: Icons.table_restaurant_outlined
                               , size: 50,),
                           ),
                           Text(e,)
                         ],
                       ),
                     )
                 ).toList(),),
                 SizedBox(height: 10,),
                 _controller.value.isInitialized
                     ? AspectRatio(
                   aspectRatio: _controller.value.aspectRatio,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: VideoPlayer(
                           _controller),
                     ),
                   ),
                 )
                     : Container(),

                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("menu",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                     ),
                   ],
                 ),
                 GridView.count(
                   physics: NeverScrollableScrollPhysics(),
                   padding: EdgeInsets.all(10),
                   mainAxisSpacing: 20,
                   crossAxisSpacing: 20,
                   shrinkWrap: true,
                   childAspectRatio: 1,
                   crossAxisCount: 2,
                  children: category(categories),),

                 SizedBox(height: 10,),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("most purchased",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 300,
                   child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: mealsList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return mealInShort(mealsList[index]);
                     },

                   ),

                 ),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("latest offers",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 200,
                   child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: 4,
                     itemBuilder: (BuildContext context, int index) {
                       return  Container(
                         margin:EdgeInsets.all(5) ,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                           boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
                           color: Colors.white,
                           // border: Border.all(color: Theme.of(context).dividerColor)
                         ),
                         child: ClipRRect(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             child: Image.network("https://www.dominos.co.in/great-deals/online-pizza-coupons/images/story_images/evd/evd-199.jpg")),
                       );
                     },

                   ),

                 ),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("best choices",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 300,
                   child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: mealsList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return  mealInShort(mealsList[index]);
                     },

                   ),

                 ),
                 SizedBox(height: 30,)
               ],
             ),

           ),


    );
  }
List<Widget> category(List<Category> c){
  return  c.map((e)=>
     Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(300)),
              child: Image.network(e.img
                ,fit: BoxFit.cover,),),
          ),
        ),

        Text(e.name,style: TextStyle(fontSize: 24),)
      ],
    )
  ).toList();
}
Widget mealInShort(Meals m){
  return Container(
    margin:EdgeInsets.symmetric(horizontal: 5,vertical: 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
      color: Colors.white,
      // border: Border.all(color: Theme.of(context).dividerColor)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(m.img)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(m.name,style: TextStyle(fontSize: 24),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("${m.price}\$",style: TextStyle(fontSize: 24),),
        ),
        Container(
          height:30,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount:5,
              itemBuilder: (context,i)
              {
                return (i<m.rating)?Icon(Icons.star,color: Colors.yellow,) :
                Icon(Icons.star_border,color: Colors.grey,);

              }),)
      ],
    ),
  );
}

}


