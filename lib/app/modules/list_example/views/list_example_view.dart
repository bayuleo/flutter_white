import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/list_example_controller.dart';

class ListExampleView extends GetView<ListExampleController> {
  const ListExampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListExampleView'),
        centerTitle: true,
      ),
      body: GetBuilder<ListExampleController>(
        builder: (controller) => Column(
          children: [
            ElevatedButton(
              onPressed: controller.onClickAdd,
              child: const Text('Add New'),
            ),
            SingleChildScrollView(
              child: ListView.builder(
                itemCount: controller.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = controller.data[index];
                  return ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('${data.nama}'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.onClickEdit(data.nama);
                            },
                            child: const Text('Edit'),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                            onPressed: () => controller.onDeleteData(data.nama),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
