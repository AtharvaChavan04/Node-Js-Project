import 'package:flutter/material.dart';
import 'package:node_js_project/model/product_model.dart';
import 'package:node_js_project/services/api_services.dart';
import 'package:node_js_project/view/widgets/appbar_widget.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
                    onPressed: () async {
                      String productId = pdata[index].id ?? '';
                      await ApiServices.deleteProduct(productId);
                      pdata.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
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
