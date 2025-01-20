import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/base/base_view/base_view_builder.dart';
import 'package:flutter_prodata_task/presentation/screen/place_details_page/view_model/place_detail_viewModel.dart';

class PlaceDetailPage extends StatefulWidget {
  const PlaceDetailPage({
    super.key,
    required this.name,
    required this.lat,
    required this.long,
    required this.address,
    required this.category,
  });

  final String name;
  final String lat;
  final String long;
  final String address;
  final String category;

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PlaceDetailViewModel>(
      onDispose: (viewModel) {},
      onInit: (viewModel) {
        viewModel!.setContext(context);
      },
      pageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.name)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    infoListTile("Name", widget.name),
                    infoListTile("Category", widget.category),
                    infoListTile("Address", widget.address),
                    infoListTile("Latitude", widget.lat),
                    infoListTile("Longitude", widget.long),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModel: PlaceDetailViewModel(),
    );
  }
}

ListTile infoListTile(String title, String description) {
  return ListTile(
    title: Text(title),
    subtitle: Text(description),
  );
}
