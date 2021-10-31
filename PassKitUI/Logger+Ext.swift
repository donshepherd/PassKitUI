//
//  Logger+Ext.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/31/21.
//

import Foundation
import os.log

extension Logger {
    
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let passApiFailure = Logger(subsystem: subsystem, category: "passApiFaliure")
}
