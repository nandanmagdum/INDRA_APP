import 'package:flutter/material.dart';
import 'package:version1/features/auth/services/authFunctions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => AuthFunctions().logOut(context: context),
                icon: const Icon(Icons.logout_rounded)),
          )
        ],
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: screenWidth * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tukaram Gavade",
                        style: TextStyle(fontSize: screenWidth * 0.06)),
                  ],
                )
              ],
            ),
            SizedBox(height: screenWidth * 0.02),
            const Divider(color: Colors.black, thickness: 2),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text("Address :  ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text("Karad, Maharashtra", style: TextStyle(fontSize: 15))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Phone no. :  ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text("+91 9247385610", style: TextStyle(fontSize: 15))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Vehicle Name :  ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text("John Deere", style: TextStyle(fontSize: 15))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Vehicle ID :  ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text("155238", style: TextStyle(fontSize: 15))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Phone no. :  ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text("+91 9247385610", style: TextStyle(fontSize: 15))
              ],
            )
          ],
        ),
      ),
    );
  }
}
