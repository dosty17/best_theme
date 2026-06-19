import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/visitor2.dart';

class ModelVisitor extends SimpleElementVisitor2<void> {
  String className = '';
  // Store fields mapped to their actual element types for better analysis later
  Map<String, FieldElement2> fields = {};

  @override
  void visitClassElement(ClassElement2 element) {
    className = element.displayName;
    // Safely super-visit down to the class children (fields, methods, etc.)
    super.visitClassElement(element);
  }

  @override
  void visitFieldElement(FieldElement2 element) {
    // Only capture static const fields (like your theme colors)
    if (element.isStatic && element.isConst) {
      fields[element.displayName] = element;
    }
  }
}
// import 'package:analyzer/dart/element/element2.dart';
// import 'package:analyzer/dart/element/visitor2.dart';

// class ModelVisitor extends SimpleElementVisitor2<void> {
//   String className = '';
//   Map<String, dynamic> fields = {};

//   @override
//   void visitConstructorElement(ConstructorElement2 element) {
//     final String returnType = element.returnType.toString();
//     className = returnType.replaceAll("*", "");
//   }

//   @override
//   void visitFieldElement(FieldElement2 element) {
//     String elementType = element.type.toString().replaceAll("*", "");
//     fields[element.displayName] = elementType;
//   }
// }
