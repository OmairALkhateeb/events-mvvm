import 'package:events_mvc/model/order_model.dart';
import 'package:events_mvc/view/components/app_bar.dart';
import 'package:events_mvc/view/components/order_design.dart';
import 'package:events_mvc/view_model/archive_view_model.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatelessWidget {
  ArchivePage({super.key});
  final ArchiveViewModel viewModel = ArchiveViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      drawer: const Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [],
        floatHeaderSlivers: true,
        body: FutureBuilder<List<Order>>(
          future: viewModel.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Order> allOrder = snapshot.data!;
              return GridView.builder(
                itemCount: allOrder.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  return OrderDesign(
                    order: allOrder[index],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
