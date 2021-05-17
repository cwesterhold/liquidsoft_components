# liquidsoft_components

---Currently in beta testing---

A lightweight but complete component package to get your flutter project off the ground.  Provides an HTTP Caller, Global Error Handling, large set of useful methods, along with dynamic Cupertino/Material widgets based on device platform.

Works with: iOS, Android, Web, macOS and all other flutter platforms

The images below show one of the main widgets, LiquidScaffold.

LiquidScaffold - Creates the Bottom Navigation Bar, the top AppBar, and the action buttons based on platform.  The same code created both of the below layouts, one for iOS and the other for Android.  A user of your app will expect native layouts and actions, the LiquidSoft Component library makes this easy.

![Screenshot_1615594687](https://liquidsoft.io/wp-content/uploads/2021/05/Screenshot_1621106171-142x300.png)
![Screenshot_1615594689](https://liquidsoft.io/wp-content/uploads/2021/05/Simulator-Screen-Shot-iPhone-12-Pro-Max-2021-05-15-at-15.05.53-139x300.png)

Documentation: Find a complete set of documentation on our website - https://liquidsoft.io/flutter-components/

## Features
- HTTP Caller with error handling
    - Get, Post, Delete, Patch
    - Checks for connectivity on timeout (timeout set on init)
        - Throws connectivity error if connected to network but no internet access
        - Throws standard error on else
    - Returns back status code and error code dialog on error
    - if in debug mode throws error and prints out body
- HTTP Error Handling
    - HTTP Errors
    - Connectivity Errors
- Global Errors Handling
    - Debug prints error to console
    - Production 
        - Catches errors and prints error out to  dialog
        - Emails error to a given email address
- Get Platform Type or Group
    - Group - web, mobile, desktop, or unknown
    - Type - Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, or Unknown
    - Structured to not error on web
- Hex Conversion
    - converts Hex codes to Colors
- Dollar Formatting
    - easily format a number into a dollar string
    - 534223.45 => $534,223.45
- Number Formatting
    - format a number into a format
    - optional format and local inputs
    - Standard format = "###.0#"
    - Standard locale = 'en_US'
    - 123.9847736274 => 123.98
- Page Routing
    - Material or Cupertino Page Route based on Platform
    - Web defaults to Material
- SnackBar
    - Easily call snackBar from anywhere in the app
    - requires context and Scaffold.of
- Scaffold 
    - Create a Material or Cupertino Scaffold
    - Optional Material AppBar or Cupertino Sliver AppBar
        - Uses LiquidLogo() to add logo to the left side of the appBar
    - Optional Material or Cupertino Bottom Nav Bar
    - Creates Floating action button or Cupertino action sheet
    - Pass in NavBarItems list and it will create the appBar, NavBar,actions buttons, and body for you :-)
- App Bar
    - Creates a Material or Cupertino appbar
    - Uses LiquidLogo() to add logo to the left side of the appBar
    - Allows for a trailing Widget
    - Pass in the screen body
- Standard Dialog
    - Opens a cupertino or material dialog
    - Standard dialog with an OK button
- Approval Dialog
    - Opens a cupertino or material dialog
    - Used for standard approvals, like deletions
    - Approve or Deny 
    - Pass in a approveCallback function  
- Buttons
    - Cupertino or Material button
    - adjust width, height,font size, and background color
- DatePicker
    - Cupertino Date Wheel or Material Date Picker
- Dropdown
    - Cupertino Picker or Material Dropdown
- Header
    - Simple Header color, font sizes attributes
- Logo
    - Returns logo based on dark or light theme
- Multi-Text Field
    - Multiple line text field 
    - Keyboard types, maxLines, editable, validation,focusNodes and more
- Text Field
    - Single line text field
    - Suffix and Prefix Icons
    - Keyboard types, focusNodes, validation and more
- Spinner
    - Cupertino or Material Spinner
    - Provide Text for loading context
- Toggle Bar
    - Horizontal tab interface capable of handing any number of inputs. 
    - Easily customize colors with an easy to use set of attributes.
- Switch - Coming soon
    - Cupertino or Material Switch
    - customize colors and size
- Search Bar - Coming Soon
    

Please check out each widgets page for implementation details

## Getting Started

Add liquidsoft_components to your pubspec.yaml

```
   dependencies:
      liquidsoft_components: ^1.0.0

```
 
Import liquidsoft_components to main.dart file

```
// This file exports all of the components
    import 'package:liquidsoft_components/liquid_components.dart';

// You can also import each widget or service directly
    import 'package:liquidsoft_components/services/liquidServices.dart';
    import 'package:liquidsoft_components/services/platformInfo.dart';
    import 'package:liquidsoft_components/widgets/liquidApproveDialog.dart';
    import 'package:liquidsoft_components/widgets/liquidButton.dart';
    import 'package:liquidsoft_components/widgets/liquidDate.dart';
    import 'package:liquidsoft_components/widgets/liquidDropdown.dart';
    import 'package:liquidsoft_components/widgets/liquidHeader.dart';
    import 'package:liquidsoft_components/widgets/liquidLogo.dart';
    import 'package:liquidsoft_components/widgets/liquidMultiText.dart';
    import 'package:liquidsoft_components/widgets/liquidScaffold.dart';
    import 'package:liquidsoft_components/widgets/liquidSecondaryAppBar.dart';
    import 'package:liquidsoft_components/widgets/liquidSmallButton.dart';
    import 'package:liquidsoft_components/widgets/liquidSpinner.dart';
    import 'package:liquidsoft_components/widgets/liquidText.dart';
    import 'package:liquidsoft_components/widgets/liquidToggleBar.dart';

```


Initialize liquidsoft_components
- this should be done as soon as possible in the app init process
- If you are using the HTTP Caller, then it must be initialized before any calls are made

```
  /// This is a basic implementation - see all attributtes below
  LiquidSoftComponents(
    rootWidget: ExampleApp(),
    httpHeaders: {
      "Access-Control-Allow-Origin": '*',
      "accept": "application/json",
      "content-type": "application/json",
    },
    errorAdminEmail: 'chris@liquidsoft.io',
    isDebug: isDebug,
    logoLocationLight: 'assets/lightLogo.png',
    logoLocationDark: 'assets/darkLogo.png',
  );

```

All Initialization attributes
- bool isDebug 
    - drives the outcome of the http and other error handling
- String logoLocationLight || String logoLocationDark 
    - Logo Location for each theme type
    - Used by the LiquidLogo widget
    - Used by the LiquidScaffold
- Map<String, String> httpHeaders 
    - Headers to be passed via http call
- String generalErrorHeader 
    - Dialog header for general errors
- String generalPreErrorMessage 
    - Dialog body text pre error code message
- String generalPostErrorMessage 
    - Dialog body text post error code message
- String httpErrorHeader 
    - Dialog header for http errors
- String httpPreErrorMessage 
    - Dialog body text pre error code message
- String httpPostErrorMessage 
    - Dialog body text post error code message
- String connectivityErrorHeader 
    - Dialog header for connectivity errors
- String connectivityErrorMessage 
    - Dialog body text for connectivity errors
 
 ## Documentation
   - Complete set of documentation
        - https://liquidsoft.io/flutter-components/
   - Check out the example project on our github site
        -  https://github.com/cwesterhold/liquidsoft_components
 
 *** Services ***
 - HTTP Caller with error handling
     - Get, Post, Delete, Patch
     - Checks for connectivity on timeout (timeout set on init)
         - Throws connectivity error if connected to network but no internet access
         - Throws standard error on else
     - Returns back status code and error code dialog on error
     - if in debug mode throws error and prints out body
     
     Basic implementation of the http caller
 ```
     LiquidHTTPCaller _httpCaller = LiquidHTTPCaller();
 
     // Get
       Future<List<Accounts>> getAccounts() async {
         var url = 'https://someAPI.com/accountsModel/';
         var data = await _httpCaller.getData(url);
         var obj = accountsFromJson(data);
         return obj;
       }
     // Post
     createUserLog(userId, platform, logInDate) async {
         var url = 'https://someAPI.com/userLogModel/';
         await _httpCaller.postData(url, {
           "userId": userId,
           "platform": platform,
           "loginDate": logInDate,
         });
       }
     // Patch
     updateUserReview(String reviewStatus) async {
         var url = 'https://someAPI.com/userModel/updateUserReview';
     
         var data = await _httpCaller.postData(url, {
           "userId": userId,
           "userReviewStatus": reviewStatus,
         });
       }
     // Delete
      void deleteIncome(Income income) async {
         var url = 'https://someAPI.com/incomeModel/' + income.incomeId.toString();
         var data = await _httpCaller.deleteData(url);
       }
 ```    
 - Error Handling
 ```
LiquidSoftService _liquidService = LiquidSoftService();

// Use the catchError method in try/catch blocks or anywhere you want to catch an error
// This will print to the console in debug and show a dialog/send and email in production

_liquidService.catchError(details.exception.toString());

```
 - Get Platform Type or Group
     - Group - web, mobile, desktop, or unknown
     - Type - Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, or Unknown
     - Structured to not error on web
  
   Each getter will return one of two enums
    - enum PlatformType { Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, Unknown }
    - enum PlatformGroup { web, mobile, desktop, unknown }
  
```
  LiquidSoftService _liquidService = LiquidSoftService();

   _liquidservice.getPlatformGroup == PlatformGroup.web;
   
   _liquidService.getPlatformType == PlatformType.iOS; 

```   
     
 - Hex Conversion
     - converts Hex codes to Colors    
```
    // To use, just instantiate the HexColor Class
    
    ThemeData light = ThemeData(
           brightness: Brightness.light,
           primaryColor: HexColor('#FFCD38'),
          primaryColorDark: HexColor('#AE7849'),
           primaryColorLight: Colors.black12,
         );
```
     
 - Dollar Formatting
     - easily format a number into a dollar string
     - 534223.45 => $534,223.45
```
    //make sure to instantiate the service
    LiquidSoftService _liquidService = LiquidSoftService();

    Text(
      '${_liquidService.getDollarFormat(235223.00)}',
      style: TextStyle(fontSize: 16),
    )

    // output $234,223.00

```     
     
 - Number Formatting
     - format a number into a format
     - optional format and local inputs
     - Standard format = "###.0#"
     - Standard locale = 'en_US'
     - 123.9847736274 => 123.98
```
    //make sure to instantiate the service
    LiquidSoftService _liquidService = LiquidSoftService();

    Text(
      '${_liquidService.numberFormat(123.132232323)}',
      style: TextStyle(fontSize: 16),
    )

    //output 123.13

``` 

 - Page Routing
     - Material or Cupertino Page Route based on Platform
     - Web defaults to Material
  ```
      //make sure to instantiate the service
      LiquidSoftService _liquidService = LiquidSoftService();
  
      _liquidService.routePage(context,
                        TheNewScreenToRouteToo(),
                      );
  ```    
     
 - SnackBar
     - Easily call snackBar from anywhere in the app
  ```
      //make sure to instantiate the service
      LiquidSoftService _liquidService = LiquidSoftService();
  
      _liquidService.showSnackBar(context, 'Refreshing transactions is complete');
  ```  

*** Widgets ***
  Find complete examples of each in our example project or on our website - https://liquidsoft.io/flutter-components/
 
 - Scaffold 
     - Create a Material or Cupertino Scaffold
     - Optional Material AppBar or Cupertino Sliver AppBar
         - Uses LiquidLogo() to add logo to the left side of the appBar
     - Optional Material or Cupertino Bottom Nav Bar
     - Creates Floating action button or Cupertino action sheet
     - Pass in NavBarItems list and it will create the appBar, NavBar,actions buttons, and body for you :-)
 - App Bar
     - Creates a Material or Cupertino appbar
     - Uses LiquidLogo() to add logo to the left side of the appBar
     - Allows for a trailing Widget
     - Pass in the screen body
 - Standard Dialog
     - Opens a cupertino or material dialog
     - Standard dialog with an OK button
 - Approval Dialog
     - Opens a cupertino or material dialog
     - Used for standard approvals, like deletions
     - Approve or Deny 
     - Pass in a approveCallback function  
 - Buttons
     - Cupertino or Material button
     - adjust width, height,font size, and background color
 - DatePicker
     - Cupertino Date Wheel or Material Date Picker
 - Dropdown
     - Cupertino Picker or Material Dropdown
 - Header
     - Simple Header color, font sizes attributes
 - Logo
     - Returns logo based on dark or light theme
 - Multi-Text Field
     - Multiple line text field 
     - Keyboard types, maxLines, editable, validation,focusNodes and more
 - Text Field
     - Single line text field
     - Suffix and Prefix Icons
     - Keyboard types, focusNodes, validation and more
 - Spinner
     - Cupertino or Material Spinner
     - Provide Text for loading context
 - Toggle Bar
     - Horizontal tab interface capable of handing any number of inputs. 
     - Easily customize colors with an easy to use set of attributes.
 - Switch - Coming soon
     - Cupertino or Material Switch
     - customize colors and size
 - Search Bar - Coming Soon


 ## Contributors Welcome
   - Want to help out? You're more than welcome! 
   - Fork the repo and send us a PR
   - Or if you want join as a contributor/maintainer, reach out to chris@liquidsoft.io
 
 ## Change Log

 Check out the CHANGELOG.md file updates
 
 ## Authors - LiquidSoft.io
 * **Chris Westerhold** - *Initial work* - (https://github.com/cwesterhold)
 
 
 ## License
 
 This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details



