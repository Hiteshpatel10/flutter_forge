import 'package:flutter/material.dart';
import 'package:flutter_forge/constatns/asset_paths.dart';
import 'package:flutter_forge/dashboard_module/view/dashboard_view.dart';
import 'package:flutter_forge/navigation/go_paths.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: AppBar(
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: Image.asset(AssetPaths.logoPNG),
          title: Text(
            "Flutter Forge",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          actions: [
            Text(
              'Home',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                context.go(GoPaths.componentsView);
              },
              child: Text(
                'Components',
                style:
                    Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Contact us',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66);
}
