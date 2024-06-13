import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/view/outgoing_course/bloc/outgoingcource/outgoingcource_bloc.dart';

class FilterDrawerWidget extends StatefulWidget {
  const FilterDrawerWidget(
      {super.key, required this.subCategory, required this.category});
  final SubCategory subCategory;
  final Category category;

  @override
  State<FilterDrawerWidget> createState() => _FilterDrawerWidgetState();
}

class _FilterDrawerWidgetState extends State<FilterDrawerWidget> {
  final Map<String, dynamic> filtersSortBy = {
    "question": "Sort by",
    "options": ["Recent", "Price (Low - High)", "Price (High - Low)"],
    'value': ['recent', 'price_asc', 'price_desc']
  };

  // {
  //   "question": "Levels",
  //   "options": ["Beginner", "Intermediate", "Advanced"],
  // },

  final Map<String, dynamic> filtersPrice =
      // {
      //   "question": "Sort by",
      //   "options": ["Ratings", "Price (Low - High)", "Price (High - Low)"],
      // },

      {
    "question": "Price",
    "options": ["Paid", "Free", "Both"],
    "value": ["Paid", "Free", "Both"],
  };

  List<String?> selectedOptions = [];
  String sortBy = '';
  String sortByValue = '';
  String priceType = '';
  String priceTypeValue = '';

  @override
  void initState() {
    super.initState();
    selectedOptions = List<String?>.filled(filtersSortBy.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filters",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    priceType = '';
                    sortBy = '';
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: redColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const KHeight(size: 0.03),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: filters.length,
        //     itemBuilder: (context, index) {
        //       final question = filters[index];
        //       return
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filtersSortBy['question'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ...filtersSortBy['options'].map<Widget>((option) {
                    return RadioListTile<String>(
                      title: Text(
                        option,
                        style: TextStyle(
                          color: sortBy == option ? redColor : blackColor,
                        ),
                      ),
                      value: option,
                      groupValue: sortBy,
                      activeColor: redColor,
                      onChanged: (value) {
                        //                       "options": ["Recent", "Price (Low - High)", "Price (High - Low)"],
                        // 'value': ['recent', 'price_asc', 'price_desc']
                        if (value == 'Recent') {
                          sortByValue = 'recent';
                        } else if (value == 'Price (Low - High)') {
                          sortByValue = 'price_asc';
                        } else if (value == 'Price (High - Low)') {
                          sortByValue = 'price_desc';
                        }
                        setState(() {
                          sortBy = value!;
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filtersPrice['question'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ...filtersPrice['options'].map<Widget>((option) {
                    return RadioListTile<String>(
                      title: Text(
                        option,
                        style: TextStyle(
                          color: priceType == option ? redColor : blackColor,
                        ),
                      ),
                      value: option,
                      groupValue: priceType,
                      activeColor: redColor,
                      onChanged: (value) {
                        //                      "question": "Price",
                        // "options": ["Paid", "Free", "Both"],
                        if (value == 'Paid') {
                          priceTypeValue = 'paid';
                        } else if (value == 'Free') {
                          priceTypeValue = 'free';
                        } else if (value == 'Both') {
                          priceTypeValue = 'both';
                        }
                        setState(() {
                          priceType = value!;
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              log(sortByValue);
              log(priceTypeValue);
              context.read<OutgoingcourceBloc>().add(GetFilterCourcesEvent(
                    subCategoryId: widget.subCategory.id.toString(),
                    categoryId: widget.category.id.toString(),
                    sortBy: sortByValue,
                    priceType: priceTypeValue,
                  ));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
            ),
            child: const Text(
              "Apply Filters",
              style: TextStyle(
                color: whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
