import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: smallbody(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Machine State: ON",
          style: smallbody(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Last location : Vidyanagar, Karad",
          style: smallbody(),
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

  TextStyle smallbody() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);
}
