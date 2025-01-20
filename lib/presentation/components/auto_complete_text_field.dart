import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/constants/app_texts.dart';
import 'package:flutter_prodata_task/core/dimesdions/dimensions.dart';
import 'package:flutter_prodata_task/presentation/theme/app_colors.dart';

class CustomAutoComplete extends StatefulWidget {
  const CustomAutoComplete({
    super.key,
    required this.suggestion,
    required this.onSelected,
  });

  final List<String> suggestion;
  final Function(String option) onSelected;

  @override
  State<CustomAutoComplete> createState() => _CustomAutoCompleteState();
}

class _CustomAutoCompleteState extends State<CustomAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }

        return widget.suggestion.where((option) =>
            option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            labelText: AppTexts.searchPlace,
            border: OutlineInputBorder(),
          ),
          onFieldSubmitted: (value) {},
        );
      },
      onSelected: (option) {},
      optionsViewBuilder: (context, onAutoCompleteSelect, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: AppColors.white,
            elevation: 4.0,
            child: SizedBox(
              width: context.width - 60,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                separatorBuilder: (context, i) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  final item = options.elementAt(index);
                  return InkWell(
                    onTap: () {
                      widget.onSelected(item);
                    },
                    child: Text(item),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
