#  StateRestorationSimple

This is a simple implementation of state restoration as outlined in [Preserving your app’s UI across launches](https://developer.apple.com/documentation/uikit/view_controllers/preserving_your_app_s_ui_across_launches).

Cross referencing to the sections in that document, I have:

 1. “Enable state preservation and restoration for your app”

    I have defined `application(_:shouldSaveSecureApplicationState:)` and `application(_:shouldRestoreSecureApplicationState:)` to both return `true`.
        
 2. “Assign restoration identifiers to your view controllers”
 
    I have set the restoration ID in the storyboard for the view controller.

 3. “Encode and decode custom information for your app”
 
    The docs say:
    
    > During the preservation process, UIKit calls the `encodeRestorableState(with:)` method of each preserved view and view controller.
 
    I have implemented `encodeRestorableState(with:)` (making sure to call `super` renditions) and `application(_:willEncodeRestorableStateWith:)`.
    
 4. “Create view controllers when asked”
 
    I don’t manually create any view controllers, as the docs say:
    
    > UIKit uses your app’s storyboards to recreate your view controllers.
    
    It also says:
    
    > UIKit calls each view controller’s `decodeRestorableState(with:)` method to restore its state information.
    
**Note:** It is very important to *not* use `UIScene` related objects/methods. The above only works in non-scene based codebases.

In terms of my testing process, I do not force-quit the app. The steps I follow are:

 * launch the app from Xcode;
 * type some text in text field;
 * leave the app (without terminating it) … `application(_:shouldSaveSecureApplicationState:)` is called, but `encodeRestorableState(with:)` is not;
 * only after I am at the home screen do I hit “stop” button in Xcode; and
 * relaunch the app from Xcode … `application(_:shouldRestoreSecureApplicationState:)` is called, but `decodeRestorableState(with:)` is not.
