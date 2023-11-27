import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forge/components/app_bar/custom_app_bar.dart';
import 'package:flutter_forge/dashboard_module/view/dashboard_view.dart';
import 'package:flutter_forge/navigation/go_paths.dart';
import 'package:flutter_forge/theme/app_box_decoration.dart';
import 'package:go_router/go_router.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Sizer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderCard(
                        title: "App Bar",
                        image: "https://i.imgur.com/XbQUZlP.jpg",
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Wrap(
                              runSpacing: 16,
                              spacing: 16,
                              children: List.generate(
                                5,
                                (index) {
                                  return const ComponentCard(
                                    title: "App Bar",
                                    image:
                                        "https://d3unf4s5rp9dfh.cloudfront.net/ONEUI/components_appbar_img-01.png",
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          height: 200,
          width: 400,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}

class ComponentCard extends StatelessWidget {
  const ComponentCard({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(GoPaths.componentDetail(id: 'app_bar'));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        constraints: const BoxConstraints(maxWidth: 360),
        decoration: AppBoxDecoration.getBoxDecoration(),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 200,
              width: 400,
            ),
            const Divider(
              indent: 0,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
