import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';

class TeslaUI2 extends StatefulWidget {
  final Article details;
  const TeslaUI2({super.key, required this.details});

  @override
  State<TeslaUI2> createState() => _TeslaUI2State();
}

class _TeslaUI2State extends State<TeslaUI2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.title),
            Text(widget.details.url),
            Text(widget.details.source.toString()),
            Text(widget.details.author!),
            Text(widget.details.description),
            Text(widget.details.content),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 5,
              height: 3,
            )
          ],
        );
      },
    ));
  }
}
