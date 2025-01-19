import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/base/base_view/base_view_builder.dart';
import 'package:flutter_prodata_task/core/constants/app_texts.dart';
import 'package:flutter_prodata_task/presentation/components/auto_complete_text_field.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/view_model/map_page_viewModel.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/widgets/category_widget.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/widgets/map_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MapPageViewModel>(
      viewModel: MapPageViewModel(),
      onDispose: (viewModel) {},
      onInit: (viewModel) {
        viewModel!.setContext(context);
        viewModel.init();
      },
      pageBuilder: (context, viewModel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                // GOOGLE MAP
                MapWidget(viewModel: viewModel!),
                //BACK BUTTON AND TEXTFIELD
                _backButtonAndSearchField(viewModel),
                //CATEGORIES
                CategoryWidget(viewModel: viewModel),
              ],
            ),
          ),
          floatingActionButton: _refreshButton,
        );
      },
    );
  }

  Padding _backButtonAndSearchField(MapPageViewModel? viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                viewModel!.pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Expanded(
            flex: 12,
            child: CustomAutoComplete(
              places: viewModel!.places,
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton get _refreshButton {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text(AppTexts.refresh),
      icon: const Icon(Icons.refresh),
    );
  }
}
