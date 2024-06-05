import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';

class FilterDrawerWidget extends StatefulWidget {
  const FilterDrawerWidget({super.key});

  @override
  State<FilterDrawerWidget> createState() => _FilterDrawerWidgetState();
}

class _FilterDrawerWidgetState extends State<FilterDrawerWidget> {
  final List<Map<String, dynamic>> filters = [
    {
      "question": "Sort by",
      "options": ["Ratings", "Price", "Recent"],
    },
    {
      "question": "Price",
      "options": ["Paid", "Free", "Both"],
    },
    {
      "question": "Levels",
      "options": ["Beginner", "Intermediate", "Advanced"],
    },
  ];

  List<String?> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    selectedOptions = List<String?>.filled(filters.length, null);
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
                    selectedOptions = List<String?>.filled(filters.length, null);
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
        Expanded(
          child: ListView.builder(
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final question = filters[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: SizedBox(
                    width: double.infinity,
                    // height: ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ...question['options'].map<Widget>((option) {
                          return RadioListTile<String>(
                            title: Text(
                              option,
                              style: TextStyle(
                                color: selectedOptions[index] == option ? redColor : blackColor,
                              ),
                            ),
                            value: option,
                            groupValue: selectedOptions[index],
                            activeColor: redColor,
                            onChanged: (value) {
                              setState(() {
                                selectedOptions[index] = value;
                              });
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
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
