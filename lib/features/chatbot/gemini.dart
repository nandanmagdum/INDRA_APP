import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/chatbot/chat_service.dart';

class GEMINI extends StatefulWidget {
  const GEMINI({super.key});

  @override
  State<GEMINI> createState() => _GEMINIState();
}

class _GEMINIState extends State<GEMINI> {
  TextEditingController prompt = TextEditingController();
  final model = GenerativeModel(
      model: 'gemini-pro', apiKey: "AIzaSyBAMM6kjOsgQ6fqE7Ls2ShXuvLyFoeogOo");
  bool isLoading = false;
  String answer = "null";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("CHAT BOT"),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(12.0),
    //       child: Column(
    //         children: [
    //           SizedBox(width: MediaQuery.of(context).size.width),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.03,
    //           ),
    //           Text(answer),
    //           if (isLoading) CircularProgressIndicator(),
    //           ElevatedButton(
    //             onPressed: () async {
    //               setState(() {
    //                 isLoading = true;
    //               });
    //               final content = [Content.text(prompt.text)];
    //               final response = await model.generateContent(content);
    //               print(response.text);
    /////////call api
    //               setState(() {
    //                 answer = response.text.toString();
    //                 isLoading = false;
    //               });
    //             },
    //             child: Text("Ask Question"),
    //           ),
    //           TextFormField(
    //             controller: prompt,
    //             onChanged: (String? value) {
    //               prompt.text = value.toString();
    //             },
    //             decoration: const InputDecoration(
    //               hintText: "Enter your prompt",
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(15)),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String s = prefs.getString("jwt")!;
          print(s);
          ChatService().getChats();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height * .7,
              child: FutureBuilder(
                  future: ChatService().getChats(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("index : $index"),
                        );
                      },
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  TextFormField(
                      controller: prompt,
                      onChanged: (String? value) {
                        prompt.text = value.toString();
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your prompt",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final content = [Content.text(prompt.text)];
                        final response = await model.generateContent(content);
                        print(response.text);
                        // call api
                        if (!prompt.text.isEmpty) {
                          await ChatService()
                              .addChat(prompt.text.trim(), response.text!);
                        }
                        setState(() {
                          answer = response.text.toString();
                          isLoading = false;
                        });
                      },
                      child: const Icon(Icons.send)),
                  Text(answer)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
