import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/provider/time_provider.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  var timer;
  var savedTime = "";

  @override
  void initState() {
    super.initState();
    timer = Provider.of<TimeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TimeProvider>(
        builder: (context, timeprovider, widget) {
          return Column(
            children: [
              Text(
                '${timer.hour} : ' + '${timer.minute} : ' + '${timer.seconds} ',
                style: const TextStyle(color: Colors.black, fontSize: 40),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (timer.startEnable)
                      ? ElevatedButton(
                          onPressed: timer.startTimer,
                          child: const Text('Start'),
                        )
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text('Start'),
                        ),
                  (timer.stopEnable)
                      ? ElevatedButton(
                          onPressed: timer.stopTimer,
                          child: const Text('Stop'),
                        )
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text('Stop'),
                        ),
                  (timer.continueEnable)
                      ? ElevatedButton(
                          onPressed: timer.continueTimer,
                          child: const Text('Continue'),
                        )
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text('Continue'),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      savedTime = '${timer.hour} : ' +
                          '${timer.minute} : ' +
                          '${timer.seconds} ';
                    },
                    child: const Text('save'),
                  ),
                ],
              ),
              // Displaying saved time
              Text(
                savedTime,
                style: const TextStyle(color: Colors.black, fontSize: 40),
              ),
            ],
          );
        },
      ),
    );
  }
}
