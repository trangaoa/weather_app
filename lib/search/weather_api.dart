import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wemapgl_example/full_map.dart';
import 'package:wemapgl_example/weather_app.dart';
import 'weather_location.dart';

// ignore: must_be_immutable
class WeatherApi extends StatelessWidget {
  WeatherLocation weatherLocation = WeatherLocation();
  WeatherApi(this.weatherLocation);

  @override
  Widget build(BuildContext context) {
    double resize = MediaQuery.of(context).devicePixelRatio/2.75;

    weatherLocation.bgimg = 'assets/bgimg/default/brokenclouds.jpg';
    var description = weatherLocation.description.toString().replaceAll(' ', '');
    if (weatherLocation.status == 'night'){
      weatherLocation.bgimg = 'assets/bgimg/${weatherLocation.theme}/${weatherLocation.weatherType}night.jpeg';
    } else {
      weatherLocation.bgimg = 'assets/bgimg/${weatherLocation.theme}/$description.jpeg';
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullMapPage()),
              );
              print("Go back Full Map");
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30 * resize,
              color: Colors.white,
            ),
          ),
          actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 15 * resize, 0),
            child: IconButton(
              onPressed: () {
                var j = 0;
                String notify;
                for (var i = 0; i < locationList.length; i++){
                  if (locationList[i].city == weatherLocation.city){
                    j++;
                  }
                }
                if (j == 0) {
                  locationList.insert(0, weatherLocation);
                  notify = 'Add ${weatherLocation.city} successful!';
                }
                else {
                  notify = '${weatherLocation.city} is existed!';
                }
                close(context, notify);
              },
              icon: Icon(
                Icons.add,
                size: 30 * resize,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
          child: Stack(
              children: [Image.asset(
                weatherLocation.bgimg,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
                Container(
                  decoration: BoxDecoration(color: Colors.black38),
                ),
                Container(padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 150 * resize,),
                                Text(
                                  '${weatherLocation.city}',
                                  style: GoogleFonts.lato(
                                    fontSize: 35 * resize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5 * resize,),
                                Text(
                                    '${weatherLocation.dateTime}',
                                    style: GoogleFonts.lato(
                                      fontSize: 14 * resize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 120 * resize,),
                                Text(
                                  '${weatherLocation.temperature}',
                                  style: GoogleFonts.lato(
                                    fontSize: 85 * resize,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      '${weatherLocation.iconUrl}',
                                      width: 34 * resize,
                                      height: 34 * resize,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10 * resize,),
                                    Text('${weatherLocation.description}', style: GoogleFonts.lato(
                                      fontSize: 25 * resize,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 40 * resize),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Wind',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        '${weatherLocation.wind}',
                                        style: GoogleFonts.lato(
                                          fontSize: 24 * resize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      'km/h',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5 * resize,
                                          width: 50 * resize,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5 * resize,
                                          width: 5 * resize,
                                          color: Colors.greenAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Rain',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                        '${weatherLocation.rain.toString()}',
                                        style: GoogleFonts.lato(
                                          fontSize: 24 * resize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      '%',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5 * resize,
                                          width: 50 * resize,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5,
                                          width: weatherLocation.rain.toDouble() * resize/2,
                                          color: Colors.redAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Humidity',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                        '${weatherLocation.humidity.toString()}',
                                        style: GoogleFonts.lato(
                                          fontSize: 24 * resize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      '%',
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5 * resize,
                                          width: 50 * resize,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5 * resize,
                                          width: weatherLocation.humidity.toDouble() * resize/2,
                                          color: Colors.redAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )]
          ),
        ),
    );
  }

  void close(BuildContext context, var notify) async {

  // Save the bottomsheet in a variable

  var bottomSheet = showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
            height: 60,
            child: ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text('$notify'),
              onTap: (){}
        ),
        );
      }
  );

  await bottomSheet.then((onValue) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WeatherApp()),
    );
  },);
  }
  // showModalBottomSheet(BuildContext context, var notify) {
  //       Timer timer = Timer(Duration(milliseconds: 2000), (){
  //         Navigator.of(context, rootNavigator: true).pop();
  //       });
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => WeatherApp()),
  //       );
  //     //},
  //   //);
  //
  //   // Create AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Simple Alert"),
  //     content: Text("$notify"),
  //     // actions: [
  //     //   okButton,
  //     // ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     }
  //   );
  // }
}