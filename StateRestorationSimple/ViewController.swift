//
//  ViewController.swift
//  StateRestorationSimple
//
//  Created by Robert Ryan on 4/5/23.
//

import UIKit
import os.log

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ViewController")

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    override func encodeRestorableState(with coder: NSCoder) {
        logger.debug(#function)

        super.encodeRestorableState(with: coder)

        if let text = textField?.text {
            coder.encode(text, forKey: #keyPath(textField))
            coder.encode(textField.isFirstResponder, forKey: #keyPath(textField) + ".isFirstResponder")
        }
    }

    override func decodeRestorableState(with coder: NSCoder) {
        logger.debug(#function)

        super.decodeRestorableState(with: coder)

        textField.text = coder.decodeObject(forKey: #keyPath(textField)) as? String
        if coder.decodeBool(forKey: #keyPath(textField) + ".isFirstResponder") {
            logger.debug("\(#function) becomeFirstResponder")
            textField.becomeFirstResponder()
        }
    }
}
