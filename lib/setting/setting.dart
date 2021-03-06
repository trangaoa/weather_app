import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wemapgl_example/setting/theme_details.dart';
import '../weather_location.dart';
import 'single_theme.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  final int index;
  Setting(this.index);

  @override
  _SettingState createState() => _SettingState();
}

String defaultTemp = '\u2103';
String defaultPress = 'mbar';
String defaultSpeed = 'km/h';
int overcastDays = 3;
int overcastTimes = 24;

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    String bgimg = 'assets/setting.jpeg';
    double resize = MediaQuery.of(context).devicePixelRatio/2.75;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgimg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black87),
            ),
            Container(
                  //height: 700 * resize,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 35 * resize,),
                              Center(
                                child: Text(
                                  'Setting',
                                  style: GoogleFonts.lato(
                                    fontSize: 24 * resize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //SizedBox(height: 200,),
                            Text(
                              'Theme',
                              style: GoogleFonts.lato(
                                fontSize: 24 * resize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8 * resize,),
                      Container(
                        height: 80 * resize,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: themeList.length,
                          itemBuilder: (context, i) => SingleTheme(themeList[i]),
                        ),
                      ),
                      SizedBox(height: 40 * resize,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Temperature',
                                style: GoogleFonts.lato(
                                  fontSize: 24 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white38,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Temperature Unit',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<String>(
                                value: defaultTemp,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24 * resize,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String choice){
                                  setTemperatureState(choice);
                                  print('Temperature unit: ' + choice);
                                },
                                items: <String>['\u2103', '\u2109']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                        value,
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pressure Unit',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<String>(
                                value: defaultPress,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String choice) {
                                  setPressureState(choice);
                                },
                                items: <String>['mbar', 'Pa']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                        value,
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Wind speed unit',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<String>(
                                value: defaultSpeed,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24 * resize,
                                elevation: 16,
                                underline: Container(
                                  height: 2 * resize,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String choice) {
                                  setWindState(choice);
                                },
                                items: <String>['km/h', 'm/s']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 40 * resize,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Overcast',
                                style: GoogleFonts.lato(
                                  fontSize: 24 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white38,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Overcast next days:',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<int>(
                                value: overcastDays,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24 * resize,
                                elevation: 16,
                                underline: Container(
                                  height: 2 * resize,
                                  color: Colors.deepOrangeAccent,
                                ),
                                onChanged: (int choice){
                                  setOvercastDayState(choice);
                                  print('Overcast: ${choice.toString()} days');
                                },
                                items: <int>[1, 2, 3, 4, 5, 6, 7]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Text(
                                'days',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Overcast next hours:',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<int>(
                                value: overcastTimes,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24 * resize,
                                elevation: 16,
                                underline: Container(
                                  height: 2 * resize,
                                  color: Colors.deepOrangeAccent,
                                ),
                                onChanged: (int choice){
                                  setOvercastTimeState(choice);
                                  print('Overcast: ${choice.toString()} times');
                                },
                                items: <int>[10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: GoogleFonts.lato(
                                        fontSize: 14 * resize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Text(
                                'hours',
                                style: GoogleFonts.lato(
                                  fontSize: 14 * resize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 80 * resize),
                        ],
                      ),
                      SizedBox(height: 20 * resize,),
                    ],
                  ),
                )
              ]
        )
      )
    );
  }

  setOvercastDayState(int choice) {
    setState(() {
      overcastDays = choice;
      for (int i = 0; i < locationList.length; i++){
        WeatherLocation wl = locationList[i];
        wl.dayDetailLength = choice;
        wl.formatDayOvercast(choice);
      }
    });
  }

  setOvercastTimeState(int choice) {
    setState(() {
      overcastTimes = choice;

      for (int i = 0; i < locationList.length; i++){
        WeatherLocation wl = locationList[i];
        wl.timeDetailLength = choice;
        wl.formatTimeOvercast(choice);
      }
    });
  }

  setTemperatureState(String choice) {
    setState(() {
      defaultTemp = choice;
      for (int i = 0; i < locationList.length; i++){
        WeatherLocation wl = locationList[i];
        wl.formatTemp(choice);
      }
    });
  }

  setPressureState(String choice) {
    setState(() {
      defaultPress = choice;
      for (int i = 0; i < locationList.length; i++){
        WeatherLocation wl = locationList[i];
        wl.formatPressure(choice);
      }
    });
  }

  setWindState(String choice) {
    setState(() {
      defaultSpeed = choice;
      for (int i = 0; i < locationList.length; i++){
        WeatherLocation wl = locationList[i];
        wl.formatWindSpeed(choice);
      }
    });
  }
}
