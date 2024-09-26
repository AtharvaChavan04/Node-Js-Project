import 'package:flutter/material.dart';
import 'package:node_js_project/model/product_model.dart';
import 'package:node_js_project/services/api_services.dart';
import 'package:node_js_project/view/widgets/textfield_widget.dart';

class EditPage extends StatefulWidget {
  final ProductModel data;
  const EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                ApiServices.updateProduct(
                  widget.data.id,
                  {
                    "pname": nameController.text,
                    "pprice": priceController.text,
                    "pdesc": descController.text,
                    "id": widget.data.id,
                  },
                );
              },
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
