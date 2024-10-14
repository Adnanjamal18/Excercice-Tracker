import 'dart:async';
import 'package:crud_app/excercisemodal/modal.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExcerciseItem extends StatefulWidget {
  const ExcerciseItem({super.key,});

  @override
  State<ExcerciseItem> createState() => _ExcerciseItemState();
}

class _ExcerciseItemState extends State<ExcerciseItem> {   

final List <Excercise>excercises=[
  Excercise(
   categories:Category.Aerobic,
   goaltime: 22,
   excercisename: 'side rases',
   ),
  Excercise(
  goaltime: 22,
  categories: Category.cardio,
  excercisename: 'crunches',
   )
  ];

  late List<bool> excerciseStarted = List<bool>.filled(excercises.length, false,);
  // late  List<bool> habitStarted;
  //  @override
  // void initState() {
  //   super.initState();
  //   // Initialize the list with false for each exercise
  //   habitStarted = List<bool>.filled(excercises.length, false);
  // }
  late List<Timer?> timers =
      List<Timer?>.filled(excercises.length, null);  // Track timers for each exercise
  
  late List<Duration> durations =
      List<Duration>.filled(excercises.length, Duration.zero);  // Track time spent for each exercise
  
  late List<DateTime?> startTimes =
      List<DateTime?>.filled(excercises.length, null);  // Track start times for each exercise

   // Define a progress goal for each exercise (e.g., 60 seconds)
 final List<Duration> progressGoals = [
    Duration(seconds: 60),
    Duration(seconds: 60),
  ];
  

   @override
  void initState() {
    super.initState();
    // Initialize the timers for each exercise
    for (int i = 0; i < excercises.length; i++) {
      timers[i] = Timer.periodic(Duration(seconds: 1), (_) {
        if (excerciseStarted[i]) {
          setState(() {
            durations[i] += Duration(seconds: 1);
          });
        }
      });
    }
  }


  @override
  void dispose() {
    // Cancel all timers when the widget is disposed
    for (var timer in timers) {
      timer?.cancel();
    }
    super.dispose();
  }


   void onSettingsOpened(int index,){
    showDialog(
      context: context,
     builder: (context) {
      return AlertDialog(
        title: Text('this is setting for ' + excercises[index].excercisename),
        );
       },
      );
     }


   void toggleTimer(int index) {
    setState(() {
      if (excerciseStarted[index]) {
        // Pause the timer
        timers[index]?.cancel();
        durations[index] += DateTime.now().difference(startTimes[index]!);  // Update duration
        startTimes[index] = null;
      } else {
        // Start the timer
        startTimes[index] = DateTime.now();
        timers[index] = Timer.periodic(Duration(seconds: 1), (_) {
          setState(() {
            // Update the UI every second
          });
        });
      }
      excerciseStarted[index] = !excerciseStarted[index];
    }
    );
  }


  @override
  Widget build(BuildContext context) {
     // final int timespent;
    // final int timegoal;  
   return ListView.builder(
    itemCount: excercises.length,
    itemBuilder: (context, index) =>  ListTile(
      contentPadding: EdgeInsets.all(13),
    minTileHeight: 60,
    title: Text(excercises[index].excercisename,
    style: TextStyle(fontSize: 18,
    fontWeight: FontWeight.bold),
    ),
    leading: 
    Stack(
      children: [
        // Container(
        //   height: 40,
        //   width: 40,
        //   color: Colors.amber,
        // ),
        Positioned(
          bottom: 3,
          left: 4,
          right: 5,
          top: 6,
          child: CircularPercentIndicator(
            radius: 18,
            percent: durations[index].inSeconds /
             progressGoals[index].inSeconds,
           backgroundColor: Colors.black,
           progressColor: Colors.teal,
          //   center: Text(
          //  "${(durations[index].inSeconds / progressGoals[index].inSeconds * 100).toStringAsFixed(0)}%",  // Show progress in percentage
          //  style: TextStyle(fontSize: 10, color: Colors.white),
          //   ),
        ),
    ),


    IconButton(onPressed: (){
      setState(() {
      toggleTimer(index); //excerciseStarted[index]=!excerciseStarted[index];//The excerciseStarted variable toggles between true and false each time the button is pressed. The setState method is used to update the UI with the new icon.
      });
    }, 
    icon: excerciseStarted[index]
     ? Icon(Icons.pause)
     :Icon(Icons.play_arrow),
     ),
    ],
    ),  
      trailing: Row(
          mainAxisSize: MainAxisSize.min,  // This ensures the Row only takes up the necessary space
          children: [
            IconButton(
              onPressed: () {
               onSettingsOpened(index);
              },
              icon: Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                // Handle delete button press
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        subtitle: Text(
          'Time spent: ${durations[index].inMinutes}:${(durations[index].inSeconds % 60).toString().padLeft(2, '0')} '
            " ${(durations[index].inSeconds / progressGoals[index].inSeconds * 100).toStringAsFixed(0)}%",  // Show progress in percentage
            style: TextStyle(fontSize: 10, color: Colors.white),
        ),
     ),
    );
  }
}