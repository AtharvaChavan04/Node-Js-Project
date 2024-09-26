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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                text: "Enter Name",
                controller: nameController,
              ),
              const SizedBox(height: 10),
              TextfieldWidget(
                text: "Enter Price",
                controller: priceController,
              ),
              const SizedBox(height: 10),
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
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      const Color.fromARGB(255, 30, 29, 29), // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("Create Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
