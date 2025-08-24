/// DTO class for string_story.yaml part
class StringStoryConfig {
  final int versionCode;
  final String inputDirectory;
  final String outputDirectory;
  final String hashDirectory;
  final String? translationProvider;
  final String? translationModel;
  final String envFile;

  StringStoryConfig({
    required this.versionCode,
    required this.inputDirectory,
    required this.outputDirectory,
    required this.hashDirectory,
    this.translationProvider,
    this.translationModel,
    required this.envFile,
  });

  factory StringStoryConfig.fromYaml(Map? yaml) {
    if (yaml == null) {
      return StringStoryConfig(
          inputDirectory: '',
          outputDirectory: '',
          hashDirectory: '',
          envFile: '.env',
          versionCode: 0);
    }
    return StringStoryConfig(
      versionCode: yaml['version_code'] ?? 0,
      hashDirectory: yaml['hash_directory'] ?? '',
      inputDirectory: yaml['input_directory'] ?? '',
      outputDirectory: yaml['output_directory'] ?? '',
      translationProvider: yaml['translation_provider'],
      translationModel: yaml['translation_model'],
      envFile: yaml['env_file'] ?? '.env',
    );
  }

  @override
  String toString() {
    return '''
StringStoryConfig(
  inputDirectory: $inputDirectory,
  outputDirectory: $outputDirectory,
  hashDirectory: $hashDirectory,
  versionCode: $versionCode,
  translationProvider: $translationProvider,
  translationModel: $translationModel
)
''';
  }
}

/// DTO class for slang.yaml
class SlangConfig {
  final String baseLocale;
  final String inputDirectory;
  final String outputDirectory;
  final bool translationOverrides;
  final bool localeHandling;
  final bool timestamp;
  final String translationClassVisibility;
  final StringStoryConfig stringStory;

  SlangConfig({
    required this.baseLocale,
    required this.inputDirectory,
    required this.outputDirectory,
    required this.translationOverrides,
    required this.localeHandling,
    required this.timestamp,
    required this.translationClassVisibility,
    required this.stringStory,
  });

  factory SlangConfig.fromYaml(Map yaml) {
    return SlangConfig(
      baseLocale: yaml['base_locale'] ?? '',
      inputDirectory: yaml['input_directory'] ?? '',
      outputDirectory: yaml['output_directory'] ?? '',
      translationOverrides: yaml['translation_overrides'] ?? false,
      localeHandling: yaml['locale_handling'] ?? false,
      timestamp: yaml['timestamp'] ?? false,
      translationClassVisibility:
          yaml['translation_class_visibility'] ?? 'public',
      stringStory: StringStoryConfig.fromYaml(yaml['string_story']),
    );
  }

  @override
  String toString() {
    return '''
SlangConfig(
  baseLocale: $baseLocale,
  inputDirectory: $inputDirectory,
  outputDirectory: $outputDirectory,
  translationOverrides: $translationOverrides,
  localeHandling: $localeHandling,
  timestamp: $timestamp,
  translationClassVisibility: $translationClassVisibility,
  stringStory: $stringStory
)
''';
  }
}

/// DTO class for pubspec-like yaml
class PubspecConfig {
  final String packageName;
  final List<String> dependencies;
  final List<String> devDependencies;

  PubspecConfig({
    required this.packageName,
    required this.dependencies,
    required this.devDependencies,
  });

  factory PubspecConfig.fromYaml(Map yaml) {
    return PubspecConfig(
      packageName: yaml['name'] ?? '',
      dependencies: (yaml['dependencies'] as Map? ?? {})
          .keys
          .map((e) => e.toString())
          .toList(),
      devDependencies: (yaml['dev_dependencies'] as Map? ?? {})
          .keys
          .map((e) => e.toString())
          .toList(),
    );
  }

  @override
  String toString() {
    return '''
PubspecConfig(
  packageName: $packageName,
  dependencies: $dependencies,
  devDependencies: $devDependencies
)
''';
  }
}
