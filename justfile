set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

hello:
    just -l

# runs all necessary generation commands in this repo
generate:
    just assetify
    just freezed
    just generate-app

# generates data classes of string_story library
freezed:
    #!/usr/bin/env sh
    cd packages/string_story
    dart run build_runner build --delete-conflicting-outputs
    cd ../..
    mkdir -p packages/string_story_utils/lib/src/models
    cp packages/string_story/lib/src/models/slang_base_state.dart packages/string_story_utils/lib/src/models/slang_base_state.dart
    cp packages/string_story/lib/src/models/slang_base_state.freezed.dart packages/string_story_utils/lib/src/models/slang_base_state.freezed.dart
    cp packages/string_story/lib/src/models/slang_base_state.g.dart packages/string_story_utils/lib/src/models/slang_base_state.g.dart

# budles *.mustache files as a single dart file
assetify:
    #!/usr/bin/env sh
    cd packages/string_story_utils
    dart run tool/assetify.dart

# runs slang and then string_story
generate-app:
    #!/usr/bin/env sh
    cd packages/string_story/example
    dart run slang
    dart format .
    dart run string_story_utils:generate
    flutter pub get

# align - takes care of the strings (sort, translate, remove removed)
align:
    #!/usr/bin/env sh
    cd packages/string_story/example
    dart run string_story_utils:align
    dart run slang
    dart format .
    dart run string_story_utils:generate --stories-only
    flutter pub get

# run doctor script against example folder
doctor:
    #!/usr/bin/env sh
    cd packages/string_story/example
    dart run string_story_utils:doctor

# format all the files
format:
    dart format .

# only generate stories n keys
stories:
    #!/usr/bin/env sh
    cd packages/string_story/example
    dart run string_story_utils:generate --stories-only

bs:
    #!/usr/bin/env sh
    cd packages/string_story_utils
    flutter clean && flutter pub get
    cd ../string_story
    flutter clean && flutter pub get
    cd example
    flutter clean && flutter pub get