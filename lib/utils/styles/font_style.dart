import '../imports/import_list.dart';

class CustomLabel {
  Text customLabel({
    Color? color,
    FontWeight? fontWeight,
    required String text,
     double? fontSize,
  }) {
    color = color ?? Colors.black;
    fontWeight = fontWeight ?? FontWeight.normal;
    fontSize = fontSize ?? 16.0;
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
