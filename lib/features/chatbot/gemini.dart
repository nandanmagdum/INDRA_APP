import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GEMINI extends StatefulWidget {
  const GEMINI({super.key});

  @override
  State<GEMINI> createState() => _GEMINIState();
}

class _GEMINIState extends State<GEMINI> {
  TextEditingController promt = TextEditingController();
  final model = GenerativeModel(
      model: 'gemini-pro', apiKey: "AIzaSyBAMM6kjOsgQ6fqE7Ls2ShXuvLyFoeogOo");
  bool isLoading = false;
  String answer = "null";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHAT BOT"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              TextFormField(
                controller: promt,
                onChanged: (String? value) {
                  promt.text = value.toString();
                },
                decoration: InputDecoration(
                  hintText: "Enter your prompt",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(answer),
              if (isLoading) CircularProgressIndicator(),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final content = [Content.text(promt.text)];
                  final response = await model.generateContent(content);
                  print(response.text);
                  setState(() {
                    answer = response.text.toString();
                    isLoading = false;
                  });
                },
                child: Text("Ask Question"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
