import 'package:flutter/material.dart';
import 'package:node_js_project/model/product_model.dart';
import 'package:node_js_project/services/api_services.dart';
import 'package:node_js_project/view/pages/edit_page.dart';
import 'package:node_js_project/view/widgets/appbar_widget.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: FutureBuilder(
        future: ApiServices.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<ProductModel> pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].desc}"),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(data: pdata[index]),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
