import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/tesla/network_api.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';
import 'package:news_api/get_apk_calling/tesla/tesla_ui_2.dart';

class TeslaUIDemo extends StatefulWidget {
  const TeslaUIDemo({super.key});

  @override
  State<TeslaUIDemo> createState() => _TeslaUIDemoState();
}

class _TeslaUIDemoState extends State<TeslaUIDemo> {
  // List<Tesla> teslaData = [];

  Tesla? teslaData;
  bool loader = false;
  Future<void> getTesla() async {
    loader = true;
    teslaData = await NetWorkTesla.fachTesla();
    loader = false;
    setState(() {});
  }

  @override
  void initState() {
    getTesla();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loader
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: teslaData!.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TeslaUI2(details: teslaData!.articles[index]),
                        ));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 300,
                          child: CachedNetworkImage(
                            imageUrl: teslaData!.articles[index].urlToImage ==
                                    null
                                ? 'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'
                                : teslaData!.articles[index].urlToImage!,
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

                        // CachedNetworkImage(
                        //     height: 100,
                        //     width: MediaQuery.of(context).size.width,
                        //     imageUrl: teslaData!.articles[index].url ?? "djsj"),
                        Text(teslaData!.articles[index].title),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
