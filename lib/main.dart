import 'package:flightapp/CustomShapeClipper.dart';
import 'package:flightapp/CustomAppBar.dart';
import 'package:flightapp/flight_list.dart';

import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  title: "FlightApp",
  debugShowCheckedModeBanner: false,
  home: HomeScr(),
  theme: appTheme,
));

var homeScrBottomContainer = Column(children: <Widget>[
  Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    child: Row (
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Text("Current City"),
    Spacer(),
    Text("See all(10)"),
  ],),),
  Container(
    height: 210,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: cityCards,
    ),)
  
],);

List<CityCard> cityCards = [
  CityCard('assets/images/lasvegas.jpg', 'Las Vegas', 'Feb 2019', '40', '3229', '2199'),
  CityCard('assets/images/athens.jpg', 'Athens', 'Mar 2019', '30', '5229', '499'),
  CityCard('assets/images/sydney.jpg', 'Sydney', 'May 2019', '25', '3229', '2599'),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount, this.oldPrice, this.newPrice);
  TextStyle txtCardBold = TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle txtCard = TextStyle(fontSize: 12.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 150.0,
              height: 200.0,
              child: Image.asset(imagePath, fit: BoxFit.cover,),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              width: 150.0,
              height: 60.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(.8), Colors.black.withOpacity(.1)]
                  )
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(cityName, style: txtCardBold,),
                      Text(monthYear, style: txtCard,),
                    ],),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Text("$discount%", style: TextStyle(fontSize: 14.0, color: Colors.black),),
                  )
                  
                ],
              ),
            ),

          ],
        ),
      )
      
     );
    
  }
}

class HomeScr extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeScrTopContainer(),
          homeScrBottomContainer,
        ],
      ),
    );
  }
}

Color firstColor = Color(0xFEF47F15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

List<String> locations = ['Hanoi(HAN)', 'Paris(PAR)', 'London(LOD)'];

const TextStyle dropdownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropdownMenuStyle = TextStyle(color: Colors.white, fontSize: 26.0);


class HomeScrTopContainer extends StatefulWidget {
  @override
  _HomeScrTopContainerState createState() => _HomeScrTopContainerState();
}

class _HomeScrTopContainerState extends State<HomeScrTopContainer> {
  var isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child:  Container(height: 350.0, 
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            firstColor,
            secondColor
          ],),),
         
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Padding (
                padding: EdgeInsets.all(16.0),
                child: Row (children: <Widget>[
                  Icon(Icons.location_on, color: Colors.white,),
                  SizedBox(width: 16.0),
                  PopupMenuButton(
                    child: Row(children: <Widget>[
                      Text(locations[0], style: dropdownLabelStyle),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                    ],),
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      PopupMenuItem(
                        child: Text(locations[0]),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: Text(locations[1]),
                        value: 1,
                      )
                    ]
                  ),
                  Spacer(),
                  Icon(Icons.settings, color: Colors.white,)

              ],),),
              SizedBox(height: 30.0,),
              // Text(
              //   'No, we need bold strokes. We need this plan.',
              //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              // )
              Text('Where would\n you want to go?', style: dropdownMenuStyle, textAlign: TextAlign.center,),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                    controller: TextEditingController(text: locations[1]),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 13.0),
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: InkWell(
                          child: Icon(Icons.search,color: Colors.black,),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlightListingScreen()));
                          },
                        ) 
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                          isFlightSelected = true;
                      });
                    },
                    child: ChoiceChip(icon: Icons.flight, text: 'Flight', isSelected: isFlightSelected),

                  ),
                  SizedBox(width: 20.0,),
                  InkWell(
                    child: ChoiceChip(icon: Icons.hotel, text: 'Hotel', isSelected:!isFlightSelected),
                    onTap: () {
                      setState(() {
                          isFlightSelected = false;                     
                      });
                    }
,
                  )
              ],)
              

            ],
          )
          
          ,)
            
          
        )
      
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isSelected;
  

  ChoiceChip({this.icon, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:12.0, vertical: 4.0),
      decoration: widget.isSelected ? BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.all(Radius.circular(20.0))): null,
      child: Row( 
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon, size: 20.0, color: Colors.white,),
          SizedBox(width: 8.0,),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14.0))
        ],
      )
      
    );
  }
}



// var homeScrBottomContainer = Column(
//   children: <Widget>[
//     Row(children: <Widget>[
      
//     ],)
//   ],
// );