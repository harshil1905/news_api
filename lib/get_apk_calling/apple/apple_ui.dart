import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/apple/apple_ui_2.dart';
import 'package:news_api/get_apk_calling/apple/network_api.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';

class AppleUi2 extends StatefulWidget {
  const AppleUi2({super.key});

  @override
  State<AppleUi2> createState() => _AppleUi2State();
}

class _AppleUi2State extends State<AppleUi2> {
  Tesla? appleData;
  bool loader = false;

  Future<void> getApple() async {
    loader = true;
    appleData = await NetworkApple.fachApple();
    loader = false;
    setState(() {});
  }

  @override
  void initState() {
    getApple();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: appleData!.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppleUIDemo(appleDemo: appleData!.articles[index]),
                      )),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 300,
                          child: CachedNetworkImage(
                            imageUrl: appleData!.articles[index].urlToImage ==
                                    null
                                ? 'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'
                                : appleData!.articles[index].urlToImage!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.colorBurn,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(appleData!.articles[index].title)
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
