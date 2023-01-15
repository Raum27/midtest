import 'package:flutter/material.dart';
// import 'package:midterm_630710673/pages/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  var plot_index = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  var index = 0;
  var month = <Widget>[];
  var day = ['S', 'M', 'T', 'W', 'Th', 'F', 'S'];
  var number_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  var month_name = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  var month_name_tahi = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม ',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];
  var detail_month = <Widget>[];
  var detail_month_day = <Widget>[];
  @override
  Widget build(BuildContext context) {
    /**crate box for press */
    for (var i = 0; i < 12; ++i) {
      month.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              detail_month_day = [];
              index = plot_index[i];
            });
          },
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 100,
                height: 25,
                // color: Colors.amber,
                child: Text(
                  '${month_name[i]}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ));
    }
    /**crate detail month */
    for (var i = 0; i < 12; ++i) {
      detail_month.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 580,
            height: 90,
            color: Color.fromARGB(232, 244, 244, 242),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${month_name_tahi[i]}\n2566',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    Text('${i + 1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                    Text(
                      '${month_name[i]}\n2023',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    }
    for (var j = 0; j < 7; ++j) {
      if (j == 0) {
        detail_month_day.add(Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${day[j]}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 41, 27)))
            ],
          ),
        ));
      } else {
        detail_month_day.add(Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${day[j]}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
            ],
          ),
        ));
      }
    }
    var Day_detail = <Widget>[];
    //create day
    for (var i = 0; i < number_day[index]; ++i) {
      Day_detail.add(Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${i + 1}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('CALENDAR 2023'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Row(children: month.sublist(0, 3)),
                Row(children: month.sublist(3, 6)),
                Row(children: month.sublist(6, 9)),
                Row(children: month.sublist(9, 12)),
              ]),
            ],
          ),
          Column(
            children: [
              Container(
                width: 580,
                height: 420,
                color: Color.fromARGB(232, 244, 244, 242),
                child: Column(
                  children: [
                    Row(
                      children: [
                        detail_month[index]
                      ], //เสร็จแล้วส่วนหนึ่งส่วนบน
                    ),
                    Row(
                        //ส่านล่างของวันที่
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: detail_month_day),
                    Row(
                        //ส่านล่างของวันที่
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: Day_detail)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
