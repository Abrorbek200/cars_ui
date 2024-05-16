import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  List<TabModel> carsColor = [
    TabModel("All"),
    TabModel("Red"),
    TabModel("Blue"),
    TabModel("Green"),
    TabModel("Grey"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cars",
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(Icons.notifications_none, color: Colors.red,)),
            IconButton(onPressed: () {},
                icon: Icon(Icons.shopping_cart, color: Colors.red,))

          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(int i = 0; i < carsColor.length; i++)
                        singTab(i == selectedTabIndex, carsColor[i].text)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                makeCarsIter("assets/img.jpg"),
                makeCarsIter("assets/img_1.jpg"),
                makeCarsIter("assets/img_2.jpg"),
                makeCarsIter("assets/img_3.jpg"),
                makeCarsIter("assets/img.jpg"),

              ],
            ),
          ),
        )
    );
  }

  Widget singTab(bool type, String text) {
    return AspectRatio(
      aspectRatio: 2.2 / 1,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTabIndex = carsColor.indexWhere((tab) => tab.text == text);
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: type ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text(
              text, style: TextStyle(
                fontSize: type ? 20 : 17,
                fontWeight: FontWeight.bold,
                color: type ? Colors.white : Colors.black
            ),
            ),
          ),

        ),
      ),
    );
  }

  Widget makeCarsIter(String image) {
    return Container(
        height: 250,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]

        ),
        child: Container(
        padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
    begin: Alignment.bottomRight,
    colors: [
    Colors.black.withOpacity(0.9),
    Colors.black.withOpacity(0.6),
    Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.1),

    ]
    )
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,


    children:[
      Text(
        "Electric Car",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),

      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Electric",
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),

      ),

    ],
    )

    ),
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child: InkWell(
          onTap: (){},
          child: Center(
            child: Icon(Icons.favorite_border,color: Colors.red,size: 30,),

          ),
        ),
      ),
    ],
    ),
      Text("100 \$",style: TextStyle(
          color: Colors.white,fontSize: 25,
          fontWeight: FontWeight.bold
      ),),

    ],
    ),
        ),

    );

  }
}
class TabModel{
  String text;
  TabModel(this.text);
}
