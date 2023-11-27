import 'package:flutter/material.dart';
import 'package:flutter_forge/component_module/view/gist_modal.dart';
import 'package:flutter_forge/components/app_bar/custom_app_bar.dart';
import 'package:flutter_forge/dashboard_module/view/dashboard_view.dart';
import 'package:flutter_forge/theme/app_colors.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

var code = '''main() {
  print("Hello, World!");
}
''';

class GistDisplayWidget extends StatefulWidget {
  final String gistId;

  GistDisplayWidget({required this.gistId});

  @override
  _GistDisplayWidgetState createState() => _GistDisplayWidgetState();
}

class _GistDisplayWidgetState extends State<GistDisplayWidget> {
  late String gistContent;
  GistModal? gistModal;
  @override
  void initState() {
    super.initState();
    fetchGistContent();
  }

  Future<void> fetchGistContent() async {
    final response = await http.get(Uri.parse('https://api.github.com/gists/${widget.gistId}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> gistData = json.decode(response.body);

      final modal = GistModal.fromJson(gistData);
      setState(() {
        gistModal = modal;
      });
    } else {
      throw Exception('Failed to load Gist');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SyntaxView(
      code: '''${gistModal?.files?.first?.content}''', // Code text
      syntax: Syntax.DART, // Language
      syntaxTheme: SyntaxTheme.gravityLight(), // Theme
      fontSize: 12.0, // Font size
      withZoom: true, // Enable/Disable zoom icon controls
      withLinesCount: true, // Enable/Disable line number
      expanded: true, // Enable/Disable container expansion
    );
  }
}

class ComponentDetailView extends StatefulWidget {
  const ComponentDetailView({super.key});

  @override
  State<ComponentDetailView> createState() => _ComponentDetailViewState();
}

class _ComponentDetailViewState extends State<ComponentDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Sizer(
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    text: 'Preview',
                  ),
                  Tab(
                    text: 'Code',
                  ),
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const PhoneFrameWidget(),
                    ),
                    GistDisplayWidget(
                      gistId: 'faac2e2e2f153299d08617bda0b14f40',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneFrameWidget extends StatelessWidget {
  const PhoneFrameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 900,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 40,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("sdf"))
        ],
      ),
    );
  }
}
