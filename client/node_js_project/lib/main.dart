import 'package:flutter/material.dart';
import 'package:node_js_project/view/pages/create_page.dart';
import 'package:node_js_project/view/pages/delete_page.dart';
import 'package:node_js_project/view/pages/fetch_page.dart';
import 'package:node_js_project/view/pages/home_page.dart';
import 'package:node_js_project/view/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "Home",
      routes: {
        "Home": (context) => const HomePage(),
        "Create": (context) => const CreatePage(),
        "Fetch": (context) => const FetchPage(),
        "Update": (context) => const UpdatePage(),
        "Delete": (context) => const DeletePage(),
      },
    );
  }
}
