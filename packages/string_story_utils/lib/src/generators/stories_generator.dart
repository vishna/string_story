import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import 'package:string_story_utils/src/story_file_parser.dart';
import 'package:string_story_utils/src/utils_internal.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitStories(SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final directory = Directory(slangConfig.stringStory.inputDirectory);
  final stringStoryDefinitions = <StringStoryDefinition>[];

  if (directory.existsSync()) {
    final files = directory.listSync(recursive: false, followLinks: false);

    for (var entity in files) {
      if (entity is File) {
        stringStoryDefinitions.addAll(parseForStory(entity));
        // log('File: ${entity.path}');
      } else if (entity is Directory) {
        // log('Directory: ${entity.path}');
      }
    }
  } else {
    // log('Directory does not exist');
  }

  // file to id map

  final files = stringStoryDefinitions.map((it) => it.file).toSet().toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final code = StringBuffer();
  final lookup = <File, String>{};

  code.writeln("import 'string_story.dart';");

  var index = 0;
  for (final file in files) {
    final relativeImportPath = relativeImport(
      slangConfig.stringStory.outputDirectory,
      file.parent.path,
      path.basename(file.path),
    );
    final importId = "i$index";
    lookup[file] = importId;

    code.writeln("import '$relativeImportPath' as $importId;");
    index++;
  }

  code.writeln("");

  code.writeln("List<StringStory> stringStories() => [");
  for (final story in stringStoryDefinitions) {
    if (story.isArray) {
      code.write("...");
    }
    code
      ..write(lookup[story.file])
      ..write(".")
      ..write(story.functionName)
      ..write("(),");
  }
  code.writeln("];");

  BarrelFile.stories.emit(
    config: slangConfig,
    content: code.toString(),
  );
}
