import 'package:string_story/string_story.dart';

StringStoryInternalStrings get packageStrings =>
    StringStoryService.instance.inAppEditorConfig.strings;
StringStoryInternalStrings get stringStoryPackageStrings =>
    StringStoryService.instance.inAppEditorConfig.strings;

class StringStoryInternalStrings {
  const StringStoryInternalStrings();
  String get search => "Search";
  String get reset => "Reset";
  String get approve => "Approve";
  String get invalidEmailAddress => "Invalide e-mail address";
  String get nameCannotBeEmpty => "Name cannot be empty";
  String totalWords(int count) => "Total Words: ${count}";
  String missingStories(int count, String missing) =>
      "Missing stories: $count ($missing)";
  String corrected(int count) => "Corrected: $count";
  String approved(int count) => "Approved: $count";
  String get viewMyChanges => "View My Changes";
  String get submitMyChanges => "Submit My Changes";
  String get myChanges => "My Changes";
  String get noChangesYet => "No changes yet.";
  String get yourContactData => "Your contact data";
  String get contactDataRationale =>
      "We'll only use your contact info if we have questions about your translation or to share updates related to the project — no spam, no marketing.\n\nYour name (or nickname) may also appear in the *Hall of Fame* section of the app. If you provide a social media handle or website, we may link to it.";
  String get nameOrNickName => "Name or Nickname";
  String get emailAddress => "Email address";
  String get websiteOrSocialAddress => "Twitter/Instagram/Mastadon etc.";
  String get next => "Next";
  String get agreement => "Agreement";
  String get agreementContent =>
      "By submitting translations, you grant us a worldwide, royalty-free, perpetual, irrevocable, non-exclusive license to use, modify, and distribute your contributions as part of the app. Your translations may be included in current and future versions.\n\nAs a thank you, if we use your contribution, your name (or chosen nickname) will appear in the contributors section of the app";
  String get agreeAndSubmit => "Agree and Submit";
  String get sendingData => "Sending Data";
  String get tryAgain => "Try Again";
  String get translationsAreUploaded =>
      "Your translations are being uploaded to the server. Please wait.";
  String get allDone => "All Done";
  String get allDoneExclamation => "All Done!";
  String get thankYouHeadline => "🙇🙏";
  String get thankYouSecondLine => "Thank you. You're awesome!";
  String get howtoTranslateTitle => "*HOWTO Translate*";
  String get howtoTranslateMessage =>
      "Review translations on the left side one by one\n  - Approve those that look ok\n  - Update those that are not ok\nYou will see live changes inside the \"simulator\".\n\nFinally, hit the *Submit* button in the top right corner";
  String noStoryFor(String stringStoryKey) =>
      "No story added for the key *${stringStoryKey}*";
  String get tryTheApp => "Try the App";
  String percentCompleted(String percentValue) => "${percentValue}% completed";
  String get submit => "Submit";
}
