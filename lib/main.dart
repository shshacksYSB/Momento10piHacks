import 'dart:core';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
           decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.cyan,
                    Colors.red,
                  ],
                )),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 200, 20, 100),
              ),
              ElevatedButton(
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Schedule1()),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Beep()));
                },
                child: Text(
                  'Get Recommendation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionListItem {
  int? ans;
  late final String queTitle;

  QuestionListItem(String s) {
    queTitle = s;
  }
}

class Beep extends StatefulWidget {
  Beep({Key? key}) : super(key: key);

  @override
  State<Beep> createState() => _Beep();
}

class _Beep extends State<Beep> {
  List<QuestionListItem> list1 = [
    QuestionListItem('How many hours do you spend studying'),
    QuestionListItem('How many hours do you spend sleeping'),
    QuestionListItem('How many hours do you spend with friends or family'),
    QuestionListItem('How many hours do you spend exercising or on health'),
    QuestionListItem('How many hours do you spend on entertainment'),
  ];
  // Question(), //How many hours do you spend sleeping
  // Question2(), //How many hours do you spend with friends or family
  // Question3(), //How many hours do you spend exercising or on health
  // Question4(), //How many hours do you spend on entertainment

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Quiz Page'),
       centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.cyan,
                    Colors.red,
                  ],
                )),
          child: Column(
            children: [
              ...list1
                  .map((e) => Question(
                        ans: e.ans,
                        title: e.queTitle,
                        onChanged: (int? newValue) {
                          setState(() {
                            e.ans = newValue;
                          });
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 100, 20, 100),
                          );
                        },
                      ))
                  .toList(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Final(questions: list1)));
                },
                child: Text(
                  'Get Recommendation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Final extends StatelessWidget {
  Final({Key? key, required this.questions}) : super(key: key);
  final List<QuestionListItem> questions;

  final int studyHours = 3;
  final int sleepHours = 7;
  final int familyHours = 2;
  final int exerciseHours = 2;
  final int entertainmentHours = 3;

  @override
  Widget build(BuildContext context) {
    List<Widget> suggestions = [];
    if (questions[0].ans! < studyHours) {
      suggestions.add(
          Text(
            'Maybe make some more time for studying for your classes.',
            style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      ),
      );
    } 
    else {
      suggestions.add(Text('A little less studying would be good',
      style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      )
     );
    }
    if (questions[1].ans! < sleepHours) {
      suggestions.add(
          Text('Try to get some more sleep.',
          style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
          ));
    } 
    else {
      suggestions.add(Text('Do not sleep to much as it is bad for you.',
      style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      ));
    }
    if (questions[2].ans! < familyHours) {
      suggestions.add(
          Text('Make sure to spend more time with your family.',
          style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ), 
         ));
    } 
    else {
      suggestions.add(Text('Try to focus on some other aspects of your life',
      style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      ));
    }
    if (questions[3].ans! < exerciseHours) {
      suggestions.add(
          Text('Exercise is good for the body. Try to get more of it.',
          style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
          ));
    } 
    else {
      suggestions.add(Text('Do not over exert your body. Too much exercise is not good for you.',
      style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      ));
    }
    if (questions[4].ans! < entertainmentHours) {
      suggestions.add(
          Text('You are pretty busy, make sure to have some fun.',
          style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
          ));
    } 
    else {
      suggestions.add(Text('Make sure not to go overboard with the enjoyment. Make time for other things as well.',
      style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  
               ),
      ));
    }
    
    


    

    // print(questions.map((e) => e.ans).toList());
    // print(suggestions);

    return Scaffold(
      appBar: AppBar(title: Text('Results'),
      centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.black,
                    Colors.lightBlueAccent,
                  ],
                )),
        child: Column(
          children:  suggestions,
      ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  Question(
      {Key? key,
      required this.ans,
      required this.title,
      required this.onChanged})
      : super(key: key);
  int? ans;
  final String title;
  final void Function(int?) onChanged;

  @override
  State<Question> createState() => _Quizzy();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Quizzy extends State<Question> {
  final List<String> options = [
    'Zero',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Greater than Twelve'
  ];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    int? index = widget.ans;

    return DropdownButton<String>(
      value: (index != null) ? options[index] : null, // dropdownValue,
      hint: Text(widget.title),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          int newNum = options.indexOf(newValue);
          widget.onChanged(newNum);
        } else {
          widget.onChanged(null);
        }
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class Schedule1 extends StatefulWidget {
  @override
  _Schedule2 createState() => _Schedule2();
}

class _Schedule2 extends State<Schedule1> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule"),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime.utc(2021, 5, 30),
              lastDay: DateTime.utc(2030, 3, 14),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
                selectedDayPredicate:
                (DateTime date) {
                  return isSameDay(selectedDay, date);
                };
              },
              eventLoader: _getEventsfromDay,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
            ),
            ..._getEventsfromDay(selectedDay)
                .map((Event event) => ListTile(title: Text(event.title)))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Add Event"),
                    content: TextFormField(
                      controller: _eventController,
                    ),
                    actions: [
                      TextButton(
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context)),
                      TextButton(
                          child: Text("Ok"),
                          onPressed: () {
                            if (_eventController.text.isEmpty) {
                            } else {
                              if (selectedEvents[selectedDay] != null) {
                                selectedEvents[selectedDay]!.add(
                                  Event(title: _eventController.text),
                                );
                              } else {
                                selectedEvents[selectedDay] = [
                                  Event(title: _eventController.text)
                                ];
                              }
                            }
                            Navigator.pop(context);
                            _eventController.clear();
                            setState(() {});
                            return;
                          }),
                    ],
                  )),
          label: Text("Add Event")),
    );
  }
}
