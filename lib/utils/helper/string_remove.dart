class StringHelper {
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
        .replaceAll('<p>', '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '')
        .replaceAll('<p>', '');
    // .replaceAll('</p>', '');
  }
}
