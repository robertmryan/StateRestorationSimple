//
//  AppDelegate.swift
//  StateRestorationSimple
//
//  Created by Robert Ryan on 4/5/23.
//

import UIKit
import os.log

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "AppDelegate")

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        logger.debug(#function)

        return true
    }
}

// MARK: - Enable state restoration

extension AppDelegate {
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        logger.debug(#function)

        return true
    }

    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        logger.debug(#function)

        return true
    }

    // When I tried including the following, they are not called (which is not surprising as they are deprecated)

    // func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
    //     logger.debug(#function)
    //
    //     return true
    // }
    //
    // func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
    //     logger.debug(#function)
    //
    //     return true
    // }
}

// MARK: - Debug state restoration

// These are not essential, but added for debugging purposes

extension AppDelegate {
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        logger.debug(#function)
    }
    
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        logger.debug(#function)
    }
}
