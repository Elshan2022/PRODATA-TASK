import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/dimesdions/dimensions.dart';
import 'package:flutter_prodata_task/presentation/components/custom_chip.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_state.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/view_model/map_page_viewModel.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.viewModel});
  final MapPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceBloc, PlaceState>(
      builder: (context, state) {
        final places = state.places;

        final categories = places!
            .map((element) {
              return element.category;
            })
            .toSet()
            .toList();

        return Container(
          height: 45,
          alignment: Alignment.center,
          width: context.dynamicWidth(0.9),
          margin: const EdgeInsets.only(top: 120, left: 20),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final category = categories.elementAt(index);
              return ValueListenableBuilder(
                valueListenable: viewModel.selectedCategory,
                builder: (context, value, child) {
                  final isSelected = category == value;
                  return CustomChip(
                    label: category,
                    isSelected: isSelected,
                    onPressed: () {
                      viewModel.onCategory(category, places);
                    },
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
          ),
        );
      },
    );
  }
}
