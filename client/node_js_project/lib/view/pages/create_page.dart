import 'package:flutter/material.dart';
import 'package:node_js_project/services/api_services.dart';
import 'package:node_js_project/view/widgets/appbar_widget.dart';
import 'package:node_js_project/view/widgets/textfield_widget.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextfieldWidget(
              text: "Enter Name",
              controller: nameController,
            ),
            TextfieldWidget(
              text: "Enter Price",
              controller: priceController,
            ),
            TextfieldWidget(
              text: "Enter Description",
              controller: descController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var data = {
                  "pname": nameController.text,
                  "pprice": priceController.text,
                  "pdesc": descController.text,
                };
                ApiServices.addproduct(data);
              },
              child: const Text("Create Data"),
            ),
          ],
        ),
      ),
    );
  }
}
