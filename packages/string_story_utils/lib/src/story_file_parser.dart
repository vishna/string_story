// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';

List<StringStoryDefinition> parseForStory(File file) {
  final output = <StringStoryDefinition>[];
  final fileContent = file.readAsStringSync();

  // Parse the file into a CompilationUnit (AST root)
  final parseResult = parseString(content: fileContent);
  final unit = parseResult.unit;

  for (var declaration in unit.declarations) {
    if (declaration is FunctionDeclaration) {
      final name = declaration.name.lexeme;
      final returnType = declaration.returnType?.toSource() ?? 'dynamic';

      // we're only interested in public methods
      if (!name.isPublic) {
        continue;
      }

      // we assume no parameters, compiler will check it
      // final parameters = declaration.functionExpression.parameters;
      // final hasNoParameters =
      //     parameters == null || parameters.parameters.isEmpty;

      // if (!hasNoParameters) {
      //   continue;
      // }

      if (returnType == 'StringStory') {
        output.add(StringStoryDefinition(
            file: file, functionName: name, isArray: false));
      } else if (returnType == 'List<StringStory>') {
        output.add(StringStoryDefinition(
            file: file, functionName: name, isArray: true));
      }
    }
  }

  return output;
}

class StringStoryDefinition {
  final File file;
  final String functionName;
  final bool isArray;

  const StringStoryDefinition({
    required this.file,
    required this.functionName,
    required this.isArray,
  });
}

extension on String {
  bool get isPublic => !startsWith("_");
}
