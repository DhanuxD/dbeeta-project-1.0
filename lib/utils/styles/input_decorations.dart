import '../imports/import_list.dart';
class InputDec{
  static InputDecoration inputDec({required String label}){
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }
}