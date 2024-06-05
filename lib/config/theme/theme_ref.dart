// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// ThemeData darkMode = ThemeData(
//   // App-wide settings
//   primaryColor: Colors.green,

//   // Set the brightness to dark for dark mode
//   brightness: Brightness.dark,

//   // Define the color scheme for the app in dark mode
 

//   // Scaffold and AppBar styles

//   // Set the background color for the scaffold
//   scaffoldBackgroundColor: Colors.grey.shade900,

//   // Customize the app bar styles
//   appBarTheme: AppBarTheme(
//     centerTitle: true,
//     backgroundColor: Colors.cyan.shade800,
//     foregroundColor: Colors.white,
//     elevation: 1,
//   ),
//   // Bottom Navigation Bar styles
//   // Define styles for the bottom navigation bar
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     unselectedItemColor: Colors.grey.shade400.withOpacity(0.8),
//     selectedItemColor: Colors.cyan.shade200,
//     selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//     selectedIconTheme: IconThemeData(size: 25),
//     unselectedIconTheme: IconThemeData(size: 20),
//     backgroundColor: Colors.cyan.shade800,
//   ),

//   // Card and Shadow styles

//   // Define the card theme with a specific color for dark mode
//   cardTheme: CardTheme(color: Colors.black12),

//   // Define the shadow color for various elements
//   shadowColor: Colors.black,

//   //styles for the chips
//   chipTheme: ChipThemeData(
//     backgroundColor: Colors.green,
//   ),

//   // Drawer and Dialog styles

//   // Customize the drawer theme
//   drawerTheme: DrawerThemeData(backgroundColor: Colors.black87),

//   // Customize the dialog theme, including background color and shape
//   dialogTheme: DialogTheme(
//     backgroundColor: Colors.grey.shade800.withOpacity(0.9),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//   ),

//   actionIconTheme: ActionIconThemeData(),

//   applyElevationOverlayColor: true,

//   badgeTheme: BadgeThemeData(),

//   // Elevated Button and Icon styles
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.indigo,
//     ),
//   ),
//   iconTheme: IconThemeData(
//     color: Colors.indigo,
//   ),

//   // Slider and Progress Indicator styles
//   sliderTheme: SliderThemeData(
//     activeTrackColor: Colors.indigo,
//     inactiveTrackColor: Colors.grey[700],
//     thumbColor: Colors.indigo,
//   ),
//   progressIndicatorTheme: ProgressIndicatorThemeData(
//     color: Colors.indigo,
//   ),

//   // Radio and Switch styles
//   radioTheme: RadioThemeData(
//     fillColor: MaterialStateProperty.resolveWith((states) => Colors.indigo),
//   ),
//   switchTheme: SwitchThemeData(
//     thumbColor: MaterialStateProperty.resolveWith((states) => Colors.indigo),
//     trackColor: MaterialStateProperty.resolveWith(
//         (states) => Colors.indigo.withOpacity(0.5)),
//   ),
//   cupertinoOverrideTheme: NoDefaultCupertinoThemeData(),
//   extensions:
//       null, // You may specify your Iterable<ThemeExtension<dynamic>> here
//   inputDecorationTheme: InputDecorationTheme(),
//   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//   pageTransitionsTheme: PageTransitionsTheme(),
//   platform: TargetPlatform.iOS,
//   scrollbarTheme: ScrollbarThemeData(),
//   //splashFactory: InteractiveInkFeatureFactory() ,
//   useMaterial3: false,
//   visualDensity: VisualDensity.standard,
//   canvasColor: Colors.white,
//   cardColor: Colors.white,
//   colorSchemeSeed: Colors.white,
//   dialogBackgroundColor: Colors.white,
//   disabledColor: Colors.grey,
//   dividerColor: Colors.grey,
//   focusColor: Colors.blue,
//   highlightColor: Colors.transparent,

//   hintColor: Colors.grey,
//   hoverColor: Colors.blue.withOpacity(0.1),
//   indicatorColor: Colors.blue,
//   primaryColorDark: Colors.blue.shade700,
//   primaryColorLight: Colors.blue.shade200,
//   primarySwatch: Colors.blue,
//   secondaryHeaderColor: Colors.grey,
//   splashColor: Colors.blue.withOpacity(0.2),
//   unselectedWidgetColor: Colors.grey,
//   fontFamily: 'Roboto',
//   fontFamilyFallback: ['Helvetica'],
//   package: 'your_package_name',
//   primaryIconTheme: IconThemeData(color: Colors.blue),
//   primaryTextTheme: TextTheme(),
//   textTheme: TextTheme(),

//   bannerTheme: MaterialBannerThemeData(
//     backgroundColor: Colors.yellow,
//     contentTextStyle: TextStyle(color: Colors.black),
//   ),
//   bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue),

//   bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
//   buttonBarTheme: ButtonBarThemeData(
//     buttonTextTheme: ButtonTextTheme.accent,
//     buttonMinWidth: 50,
//   ),
//   buttonTheme: ButtonThemeData(
//     buttonColor: Colors.blue,
//     textTheme: ButtonTextTheme.primary,
//   ),

//   checkboxTheme: CheckboxThemeData(
//     fillColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
//   ),

//   dataTableTheme: DataTableThemeData(
//     dataTextStyle: TextStyle(color: Colors.black),
//   ),
//   datePickerTheme: DatePickerThemeData(
//     backgroundColor: Colors.white,
//   ),

//   dividerTheme: DividerThemeData(
//     color: Colors.grey,
//     space: 1,
//   ),

//   dropdownMenuTheme: DropdownMenuThemeData(),

//   expansionTileTheme: ExpansionTileThemeData(
//     textColor: Colors.black,
//     iconColor: Colors.grey,
//   ),
//   filledButtonTheme: FilledButtonThemeData(),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: Colors.blue,
//     foregroundColor: Colors.white,
//   ),
//   iconButtonTheme: IconButtonThemeData(),
//   listTileTheme: ListTileThemeData(
//     tileColor: Colors.grey.shade200,
//   ),
//   menuBarTheme: MenuBarThemeData(),
//   menuButtonTheme: MenuButtonThemeData(),
//   menuTheme: MenuThemeData(),
//   navigationBarTheme: NavigationBarThemeData(
//     backgroundColor: Colors.blue,
//   ),
//   navigationDrawerTheme: NavigationDrawerThemeData(
//     backgroundColor: Colors.white,
//   ),
//   navigationRailTheme: NavigationRailThemeData(
//     backgroundColor: Colors.blue,
//     selectedIconTheme: IconThemeData(color: Colors.white),
//     unselectedIconTheme: IconThemeData(color: Colors.grey),
//   ),
//   outlinedButtonTheme: OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(),
//   ),
//   popupMenuTheme: PopupMenuThemeData(
//     color: Colors.white,
//   ),

//   searchBarTheme: SearchBarThemeData(),
//   searchViewTheme: SearchViewThemeData(),
//   segmentedButtonTheme: SegmentedButtonThemeData(),

//   snackBarTheme: SnackBarThemeData(
//     backgroundColor: Colors.grey.shade800.withOpacity(0.9),
//     contentTextStyle: TextStyle(color: Colors.white),
//   ),

//   tabBarTheme: TabBarTheme(
//     labelColor: Colors.blue,
//     unselectedLabelColor: Colors.grey,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(),
//   ),
//   textSelectionTheme: TextSelectionThemeData(
//     cursorColor: Colors.blue,
//     selectionColor: Colors.blue.withOpacity(0.3),
//     selectionHandleColor: Colors.blue,
//   ),
//   timePickerTheme: TimePickerThemeData(
//     backgroundColor: Colors.white,
//     dialHandColor: Colors.blue,
//     dialTextColor: Colors.black,
//   ),
//   toggleButtonsTheme: ToggleButtonsThemeData(
//     color: Colors.grey,
//     selectedColor: Colors.blue,
//     fillColor: Colors.blue.withOpacity(0.1),
//     borderColor: Colors.blue,
//   ),
//   tooltipTheme: TooltipThemeData(
//     decoration: BoxDecoration(
//       color: Colors.black87,
//       borderRadius: BorderRadius.circular(8),
//     ),
//     textStyle: TextStyle(color: Colors.white),
//   ),

// );
