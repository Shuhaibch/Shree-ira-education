import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class OnlineExamScreen extends StatefulWidget {
  const OnlineExamScreen({super.key});

  @override
  _OnlineExamScreenState createState() => _OnlineExamScreenState();
}

class _OnlineExamScreenState extends State<OnlineExamScreen> {
  final List<Map<String, dynamic>> questionsAndAnswers = [
    {
      "question": "How can you render HTML content in a Flutter application?",
      "options": ["Using the flutter_html package", "Using the flutter_markdown package", "By embedding a WebView directly", "By using the flutter_webview_plugin package"],
      "answer": "Using the flutter_html package"
    },
    {
      "question": "Which package allows you to use a WebView in Flutter?",
      "options": ["flutter_html", "webview_flutter", "flutter_markdown", "html_renderer"],
      "answer": "webview_flutter"
    },
    {
      "question": "What is the primary purpose of the flutter_html package?",
      "options": ["Rendering Markdown content", "Rendering HTML content", "Creating custom widgets", "Accessing native device features"],
      "answer": "Rendering HTML content"
    },
    {
      "question": "Which package can be used to render both HTML and CSS in Flutter?",
      "options": ["flutter_html", "flutter_css", "flutter_webview_plugin", "webview_flutter"],
      "answer": "flutter_html"
    },
    {
      "question": "What is the main use of the webview_flutter package?",
      "options": ["Rendering Markdown content", "Rendering HTML as a String", "Embedding a web page within the Flutter app", "Styling Flutter widgets"],
      "answer": "Embedding a web page within the Flutter app"
    }
  ];

  final Map<int, String?> selectedOptions = {};
  int currentQuestionIndex = 0;

  void _nextQuestion() {
    if (currentQuestionIndex < questionsAndAnswers.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _finishQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Finished'),
        content: const Text('You have finished the quiz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final question = questionsAndAnswers[currentQuestionIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColor,
          title: const CustomText(text: "HTML Exam"),
          leading: IconButton.filled(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: themeColor,
              height: size.height * 0.08,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(redColor),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: CustomText(
                        text: "Question : ${currentQuestionIndex + 1}/${questionsAndAnswers.length}",
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: whiteColor,
                        ),
                        KWidth(size: 0.01),
                        CustomText(
                          text: "25min remaining",
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: size.height * 0.4,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: question['question'],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children: question['options'].map<Widget>((option) {
                              bool isSelected = selectedOptions[currentQuestionIndex] == option;
                              return RadioListTile<String>(
                                activeColor: Colors.red,
                                title: Text(
                                  option,
                                  style: TextStyle(
                                    color: isSelected ? Colors.red : null,
                                  ),
                                ),
                                value: option,
                                groupValue: selectedOptions[currentQuestionIndex],
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptions[currentQuestionIndex] = value;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionIndex > 0)
                    SizedBox(
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: themeColor),
                          ),
                        ),
                        onPressed: _previousQuestion,
                        child: const CustomText(
                          text: "Previous",
                          color: themeColor,
                        ),
                      ),
                    ),
                  if (currentQuestionIndex > 0) const Spacer(),
                  if (currentQuestionIndex < questionsAndAnswers.length - 1)
                    SizedBox(
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: _nextQuestion,
                        child: const CustomText(text: "Next"),
                      ),
                    ),
                  if (currentQuestionIndex == questionsAndAnswers.length - 1)
                    SizedBox(
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: _finishQuiz,
                        child: const CustomText(text: "Finish"),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
