import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';

class AppleUIDemo extends StatefulWidget {
  final Article appleDemo;
  const AppleUIDemo({super.key, required this.appleDemo});

  @override
  State<AppleUIDemo> createState() => _AppleUIDemoState();
}

class _AppleUIDemoState extends State<AppleUIDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.appleDemo.title),
              Text(widget.appleDemo.url),
              Text(widget.appleDemo.source.toString()),
              Text(widget.appleDemo.author.toString()),
              Text(widget.appleDemo.content),
              Text(widget.appleDemo.description),
              const SizedBox(
                height: 50,
                child: Divider(
                  thickness: 5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
