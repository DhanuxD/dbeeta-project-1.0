import '../imports/import_list.dart';

class CustomLabel {
  Text customLabel({
    Color? color,
    FontWeight? fontWeight,
    required String text,
    required double fontSize,
  }) {
    color = color ?? Colors.black;
    fontWeight = fontWeight ?? FontWeight.normal;
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
