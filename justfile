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

# Bumps version
bump part:
    #!/usr/bin/env sh
    dart pub global activate cider > /dev/null
    
    # 1. Bump utils and log the change
    cd packages/string_story_utils
    cider bump {{part}}
    
    # 2. Get the new version to sync the second package
    NEW_VERSION=$(grep 'version:' pubspec.yaml | awk '{print $2}')
    
    # 3. Sync string_story to the exact same version and log
    cd ../string_story
    cider version $NEW_VERSION
    
    echo "✅ Both packages bumped to $NEW_VERSION"

    # Trigger the changelog update automatically
    just update-changelog $NEW_VERSION

# Updates root CHANGELOG.md with new version and recent commit titles
update-changelog version:
    #!/usr/bin/env sh
    LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || git rev-list --max-parents=0 HEAD)
    COMMITS=$(git log ${LAST_TAG}..HEAD --oneline --format="- %s")
    
    # Create the new entry
    NEW_ENTRY="## {{version}}\n\n${COMMITS}\n"
    
    # Prepend the new entry to the top of the file
    printf "${NEW_ENTRY}\n$(cat CHANGELOG.md 2>/dev/null)" > CHANGELOG.md
    
    echo "📝 Root CHANGELOG.md updated."
    just sync-changelog

# Syncs root changelog to subfolders that are pushed to pubspec
sync-changelog:
    cp CHANGELOG.md packages/string_story/CHANGELOG.md
    cp CHANGELOG.md packages/string_story_utils/CHANGELOG.md
# TODO action to dry run publish
# TODO action to really run publish