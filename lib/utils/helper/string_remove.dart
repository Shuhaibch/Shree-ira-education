import 'package:html/parser.dart';

class StringHelper {
  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  static String removeFromString(String text) {
    return text
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('\r\n', '')
        .replaceAll('<strong>', '')
        .replaceAll('</strong>', '')
        .replaceAll('&nbsp;', '')
        .replaceAll(
            '<div data-purpose="safely-set-inner-html:description:description">',
            '')
        .replaceAll('', '')
        .replaceAll('</div', '')
        .replaceAll(':', '')
        .replaceAll('<li>', '\n')
        .replaceAll('</li>', '')
        .replaceAll('<ul>', '')
        .replaceAll('</ul>', '')
        .replaceAll('&amp;', ' ')
        .replaceAll(
            '<div id=\"ac1\" class=\"panel-collapse collapse in show\">\r\n<div class=\"panel-body\">\r\n<p>"<div id=\"ac1\" class=\"panel-collapse collapse in show\">\r\n<div class=\"panel-body\">\r\n<p>',
            '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '');
    // .replaceAll('</p>', '');
  }
}
