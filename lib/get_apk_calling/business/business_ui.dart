import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/get_apk_calling/business/business_ui_2_.dart';
import 'package:news_api/get_apk_calling/business/network_api.dart';
import 'package:news_api/get_apk_calling/tesla_model.dart';

class BusinessUI2 extends StatefulWidget {
  const BusinessUI2({super.key});

  @override
  State<BusinessUI2> createState() => _BusinessUI2State();
}

class _BusinessUI2State extends State<BusinessUI2> {
  Tesla? businessa;
  bool loader = false;
  Future<void> getBusiness() async {
    loader = true;
    businessa = await NetworkBusiness.fachBusiness();
    loader = false;
    setState(() {});
  }

  @override
  void initState() {
    getBusiness();
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
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusinessUIDemo(
                            businessDemoData: businessa!.articles[index]),
                      )),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 300,
                          child: CachedNetworkImage(
                            imageUrl: businessa!.articles[index].urlToImage ==
                                    null
                                ? 'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'
                                : businessa!.articles[index].urlToImage!,
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
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(businessa!.articles[index].title)
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
