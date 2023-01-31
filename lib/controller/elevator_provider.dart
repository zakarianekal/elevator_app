import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ElevatorProvider extends ChangeNotifier {
  bool _isRunning = false;
  int _currentFloor = 0; // initial floor position

  int get getCurrentFloor => _currentFloor;
  bool get isRunning => _isRunning;
  int aniamtionValue =
      1; // Just a value to rotate; if 3 goes up,if 1 goes dowwn

  // set setCurrentFloor(int floorNumber) {
  //   _currentFloor = floorNumber;
  // }

  //method to get update value of variable
  updateFloor(int requiredFloor, BuildContext context) async {
    int moveUpValue = requiredFloor - _currentFloor;
    int moveDownValue = _currentFloor - requiredFloor;

    if (_currentFloor == requiredFloor) {
      _showDialog(context);
    } else if (requiredFloor > _currentFloor) {
      aniamtionValue = 3;
      _isRunning = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5));
      _currentFloor += moveUpValue;
    } else {
      aniamtionValue = 1;
      _isRunning = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5));
      _currentFloor -= moveDownValue;
    }
    _isRunning = false;
    print(_currentFloor);
    //method to update the variable value
    notifyListeners();
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text("You are in the same Floor"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget progressLoader() {
    return RotatedBox(
        quarterTurns: aniamtionValue,
        child: const LinearProgressIndicator(
          minHeight: 50,
          color: Colors.blue,
        ));
  }

  // Widget progressLoaderUp() {
  //   return const RotatedBox(
  //       quarterTurns: 3,
  //       child: LinearProgressIndicator(
  //         minHeight: 50,
  //         color: Colors.blue,
  //       ));
  // }
}
