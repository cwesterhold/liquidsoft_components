# liquidsoft_components

A lightweight but complete component package to get your flutter project off the ground. 

Works with: iOS, Android, Web, macOS and all other flutter platforms

Includes the following;
- HTTP Caller with error handling
    - Get, Post, Delete, Patch
    - Checks for connectivity on timeout (timeout set on init)
        - Throws connectivity error if connected to network but no internet access
        - Throws standard error on else
    - Returns back status code and error code dialog on error
    - if in debug mode throws error and prints out body
- Get Platform Type or Group
    - Group - web, mobile, desktop, or unknown
    - Type - Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, or Unknown
    - Structured to not error on web
- Hex Conversion
    - converts Hex codes to Colors]
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
- Main App Bar
    - Create a Material AppBar or Cupertino Sliver AppBar
- Secondary App Bar
    - Creates a Material or Cupertino appbar
    - Allows for a trailing Widget
- Standard Dialog
    - Opens a cupertino or material dialog
- Approval Dialog
    - Used for standard approvals, like deletions
    - Pass in a successCallback function  
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
    - Provide Text for context
- Toggle Bar
    - Horizontal tab interface capable of handing any number of inputs. 
    - Easily customize colors with an easy to use set of attributes.

Please check out each widgets page for implementation details

## Getting Started

Add liquidsoft_components to your pubspec.yaml

```
   dependencies:
      liquidsoft_components: ^1.0.0

```
 
Import liquidsoft_components to main.dart file

```
import 'package:liquidsoft_components/liquid_components.dart';
```


Initialize liquidsoft_components

```
LiquidSoftComponents _liquidComponents = LiquidSoftComponents();

/// This is the bare minimum initialization
_liquidComponents.initState(
    httpHeaders: {
      "Authorization": "Your Auth Token",
      "Access-Control-Allow-Origin": '*',
      "content-type": "application/json",
    },
    isDebug: false);

```

All Initialization attributes
    bool isDebug - drives the outcome of the http and other error handling
    String logoLocationLight || String logoLocationDark - Logo Location for each theme type
    Map<String, String> httpHeaders - Headers to be passed via http call
    String httpErrorHeader - Dialog header for http errors
    String httpPreErrorMessage - Dialog body text pre error code message
    String httpPostErrorMessage - Dialog body text post error code message
    String connectivityErrorHeader - Dialog header for connectivity errors
    String connectivityErrorMessage - Dialog body text for connectivity errors
 
 ## Documentation
   - Check out the example project on our github site
        -  https://github.com/cwesterhold/liquidsoft_components
   - Each Widget/Service file has up to date documentation 
   - Post issues to our github

 ## Contributors Welcome
    - Want to help out? You're more than welcome! 
    - Fork the repo and send us a PR
 
 ## Change Log
 
 Check out the CHANGELOG.md file updates
 
 ## Authors - LiquidSoft.io
 * **Chris Westerhold** - *Initial work* - (https://github.com/cwesterhold)
 
 
 ## License
 
 This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details



