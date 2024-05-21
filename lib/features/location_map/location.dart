import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location Tracking",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "Current Location : Patan , Karad",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Machine State: ON",
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Last location : Vidyanagar, Karad",
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Image.asset(
            'assets/map.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
