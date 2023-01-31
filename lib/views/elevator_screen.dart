import 'package:elevator/controller/elevator_provider.dart';
import 'package:elevator/custom_widgets/elevator_animation.dart';
import 'package:elevator/custom_widgets/elevator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElevatorScreen extends StatelessWidget {
  final String title;
  final double floorNumber = 0;
  const ElevatorScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Consumer<ElevatorProvider>(
          builder: (context, data, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 60, bottom: 20),
                      color: Colors.grey.shade100,
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      width: 80,
                      child: data.isRunning
                          ? data.progressLoader()
                          : Text(
                              data.getCurrentFloor.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.green),
                            )),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(children: [
                        ElevatorButton(
                          buttonTitle: 3,
                          onPressed: () => data.updateFloor(3, context),
                        ),
                        ElevatorButton(
                          buttonTitle: 2,
                          onPressed: () => data.updateFloor(2, context),
                        ),
                        ElevatorButton(
                          buttonTitle: 1,
                          onPressed: () => data.updateFloor(1, context),
                        ),
                        ElevatorButton(
                          buttonTitle: 0,
                          onPressed: () => data.updateFloor(0, context),
                        ),
                        ElevatorButton(
                          buttonTitle: -1,
                          onPressed: () => data.updateFloor(-1, context),
                        ),
                      ]),
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.yellow,
                          child: ElevatorAnimation(),
                        )),
                    const Expanded(flex: 1, child: SizedBox(width: 10))
                  ],
                ),
              ],
            );
          },
        ));
  }
}
