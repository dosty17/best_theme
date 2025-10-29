import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/visitor2.dart';

class ModelVisitor extends SimpleElementVisitor2<void> {
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  void visitConstructorElement(ConstructorElement2 element) {
    final String returnType = element.returnType.toString();
    className = returnType.replaceAll("*", "");
  }

  @override
  void visitFieldElement(FieldElement2 element) {
    String elementType = element.type.toString().replaceAll("*", "");
    fields[element.displayName] = elementType;
  }
}
