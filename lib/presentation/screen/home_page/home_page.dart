import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/base/base_view/base_view_builder.dart';
import 'package:flutter_prodata_task/core/constants/app_texts.dart';
import 'package:flutter_prodata_task/presentation/components/custom_button.dart';
import 'package:flutter_prodata_task/presentation/screen/home_page/view_model/home_page_viewModel.dart';
import 'package:flutter_prodata_task/presentation/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      viewModel: HomePageViewModel(),
      pageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _appBar,
          body: SafeArea(child: _button),
        );
      },
      onInit: (viewModel) {
        _viewModel = viewModel!;
        viewModel.init();
        viewModel.setContext(context);
      },
      onDispose: (viewModel) {
        viewModel!.dispose();
      },
    );
  }

  Center get _button {
    return Center(
      child: CustomButton(
        onPressed: () async {
          await _viewModel.navigateMap();
        },
        child: const Text(AppTexts.navigateMapPage),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      backgroundColor: AppColors.purple,
      centerTitle: true,
      title: const Text(
        AppTexts.homeTitle,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
