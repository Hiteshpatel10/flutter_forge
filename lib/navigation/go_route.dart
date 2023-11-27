import 'package:flutter_forge/component_module/view/component_detail_view.dart';
import 'package:flutter_forge/component_module/view/components_view.dart';
import 'package:flutter_forge/dashboard_module/view/dashboard_view.dart';
import 'package:flutter_forge/navigation/go_paths.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: GoPaths.home,
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: GoPaths.componentsView,
      builder: (context, state) => const ComponentsView(),
    ),
    GoRoute(
      path: GoPaths.componentDetail(),
      builder: (context, state) => const ComponentDetailView(),
    ),
  ],
);
