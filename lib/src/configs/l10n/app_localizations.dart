
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('th')
  ];

  /// No description provided for @createTaskHomeBar.
  ///
  /// In en, this message translates to:
  /// **'Create Task'**
  String get createTaskHomeBar;

  /// No description provided for @appBarTaskGet.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get appBarTaskGet;

  /// No description provided for @createBottomMenu.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createBottomMenu;

  /// No description provided for @listBottomMenu.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get listBottomMenu;

  /// No description provided for @updateBottomMenu.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateBottomMenu;

  /// No description provided for @updateTaskAppBar.
  ///
  /// In en, this message translates to:
  /// **'Update Task'**
  String get updateTaskAppBar;

  /// No description provided for @saveUpdateTaskBtn.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveUpdateTaskBtn;

  /// No description provided for @noUpdateImage.
  ///
  /// In en, this message translates to:
  /// **'No Image'**
  String get noUpdateImage;

  /// No description provided for @notFoundPage.
  ///
  /// In en, this message translates to:
  /// **'404 Not Found'**
  String get notFoundPage;

  /// No description provided for @selectImageFail.
  ///
  /// In en, this message translates to:
  /// **'Fail to select image'**
  String get selectImageFail;

  /// No description provided for @failToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Fail to update'**
  String get failToUpdate;

  /// No description provided for @failToNavigate.
  ///
  /// In en, this message translates to:
  /// **'Fail to Navigate'**
  String get failToNavigate;

  /// No description provided for @oopsErrorEnv.
  ///
  /// In en, this message translates to:
  /// **'Oops! configuration went wrong'**
  String get oopsErrorEnv;

  /// No description provided for @oopsErrorTaskGet.
  ///
  /// In en, this message translates to:
  /// **'Oops!, cannot get task'**
  String get oopsErrorTaskGet;

  /// No description provided for @dataEmptyTaskGet.
  ///
  /// In en, this message translates to:
  /// **'Data is Empty'**
  String get dataEmptyTaskGet;

  /// No description provided for @loadDataTaskGet.
  ///
  /// In en, this message translates to:
  /// **'Load data'**
  String get loadDataTaskGet;

  /// No description provided for @appBarTaskCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Task'**
  String get appBarTaskCreate;

  /// No description provided for @textFieldPlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Enter your some text'**
  String get textFieldPlaceHolder;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select Image'**
  String get selectImage;

  /// No description provided for @successSnackBar.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successSnackBar;

  /// No description provided for @failureSnackBar.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get failureSnackBar;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'th': return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
