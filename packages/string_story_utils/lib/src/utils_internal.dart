import 'package:string_story_utils/string_story_utils.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

Map<String, dynamic> makeImportsContext(
    SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final i18n = slangConfig.outputDirectory.withoutFirstDir;
  final stringStory = slangConfig.stringStory.outputDirectory.withoutFirstDir;
  return <String, dynamic>{
    'packageName': pubspecConfig.packageName,
    'stringStory': stringStory,
    'i18n': i18n
  };
}

extension StringsUtils on String {
  String get withoutFirstDir => split("/").sublist(1).join("/");
}

String relativeImport(String fromDir, String toDir, String targetFile) {
  final from = p.normalize(fromDir);
  final to = p.join(toDir, targetFile);
  final relPath = p.relative(to, from: from);

  // Ensure Dart import syntax uses forward slashes
  return relPath.replaceAll('\\', '/');
}
