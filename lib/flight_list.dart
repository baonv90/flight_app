import 'package:flutter/material.dart';
import 'package:flightapp/CustomShapeClipper.dart';


Color firstColor = Color(0xFEF47F15);
Color secondColor = Color(0xFFEF772C);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results',),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ) 
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListTopContainer(),
            FlightListBottomContainer(),
            
            ],
          ),
      ) 
            
      );
    }
  }
          


class FlightListTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child:  Container(height: 120.0, 
            decoration: BoxDecoration(gradient: LinearGradient(colors: [
            firstColor,
            secondColor  
          ],),),),),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 10.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 5,
                
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hanoi(HAN)', style: TextStyle(fontSize: 14.0),),
                        Divider(color: Colors.grey, height: 20.0,),
                        Text('Paris(PAR)', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                ),
                Spacer(),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.import_export, color: Colors.black),

                )
              ],
            ),
          ),
        )
        ,],);     
  }
}

class FlightListBottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text('Search results', style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            height: 400,
            child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              flightCard(),
              flightCard(),
              flightCard(),
            ],
          ),
          )
          
        ],
      ),
      
    );
  }
}

List<flightCard> flightCards = [flightCard(),flightCard(),flightCard()];

class flightCard extends StatelessWidget {

  flightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 2.0,
        child: Container(
          height: 90.0,
          width: 200,  
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),    
      ),
     
    );
  }
}