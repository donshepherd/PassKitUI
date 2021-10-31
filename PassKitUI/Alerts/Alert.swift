//
//  AlertItem.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//

import Foundation

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

#warning("Update Alert text below with better error messages depending on usage")

struct AlertContext {
   
    static let invalidPass = AlertItem(title: Text("Invalid Pass"),
                                              message: Text("The pass received from the server was invaid."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                              message: Text("The server returned an invalid response."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                              message: Text("Unable to connect to the server."),
                                              dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                              message: Text("Unable to complete your request at this time. Please check you netowrk connection."),
                                              dismissButton: .default(Text("OK")))
}
