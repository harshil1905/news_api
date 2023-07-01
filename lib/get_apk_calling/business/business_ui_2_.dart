import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';

class BusinessUIDemo extends StatefulWidget {
  final Article businessDemoData;
  const BusinessUIDemo({super.key, required this.businessDemoData});

  @override
  State<BusinessUIDemo> createState() => _BusinessUIDemoState();
}

class _BusinessUIDemoState extends State<BusinessUIDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.businessDemoData.title),
              Text(widget.businessDemoData.url),
              Text(widget.businessDemoData.source.toString()),
              Text(widget.businessDemoData.author.toString()),
              Text(widget.businessDemoData.content),
              Text(widget.businessDemoData.description),
              const SizedBox(
                height: 50,
                child: Divider(
                  thickness: 5,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
