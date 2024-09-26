import 'package:flutter/material.dart';
import 'package:node_js_project/view/widgets/appbar_widget.dart';
import 'package:node_js_project/view/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: "CREATE",
              onPressed: () {
                Navigator.pushNamed(context, "Create");
              },
            ),
            ButtonWidget(
              text: "READ",
              onPressed: () {
                Navigator.pushNamed(context, "Fetch");
              },
            ),
            ButtonWidget(
              text: "UPDATE",
              onPressed: () {
                Navigator.pushNamed(context, "Update");
              },
            ),
            ButtonWidget(
              text: "DELETE",
              onPressed: () {
                Navigator.pushNamed(context, "Delete");
              },
            ),
          ],
        ),
      ),
    );
  }
}
