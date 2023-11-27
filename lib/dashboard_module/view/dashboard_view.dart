import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forge/components/app_bar/custom_app_bar.dart';
import 'package:flutter_forge/theme/app_box_decoration.dart';
import 'package:flutter_forge/theme/app_colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CachedNetworkImage(
                  imageUrl: "https://i.imgur.com/XbQUZlP.jpg",
                  height: 700, // Specify a fixed height or use another appropriate value
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Elevate Your Flutter Apps with FlutterForge",
                  style:
                      Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discover a curated collection of ready-to-use Flutter components.\nAccelerate your development process and build stunning apps effortlessly.\nWelcome to FlutterForge, where efficiency meets innovation.",
                  style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.boulder),
                ),
              ),
              Center(
                child: Text(
                  "Features",
                  style:
                      Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 24,
                spacing: 24,
                children: List.generate(
                  6,
                  (index) {
                    return Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: AppBoxDecoration.getBoxDecoration(),
                      child: Column(
                        children: [
                          const Icon(Icons.access_alarm_rounded, size: 34),
                          const SizedBox(height: 8),
                          Text(
                            "Customizable Widget",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Tailor FlutterForge components to match your app's brand and style effortlessly.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.boulder),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: 1600,
            child: child,
          ),
        );
      },
    );
  }
}
