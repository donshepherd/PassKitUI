//
//  PassKitView.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//  Example of using UIViewControllerRepresentable and a coordinator.
//


import PassKit
import SwiftUI

struct PassKitView: UIViewControllerRepresentable {
    
    @Binding var pass: PKPass?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        let passvc = PKAddPassesViewController(pass: self.pass!)
        passvc?.delegate = context.coordinator
        return passvc!
    }
    
    func updateUIViewController(_ uiViewController: PKAddPassesViewController, context: Context) {
        
    }
    
}

//  Coorinator will set to Pass back to nil once the PassKit view has either added the Pass to Wallet,
//  or the user cancels out of the view
final class Coordinator: NSObject, PKAddPassesViewControllerDelegate {
    
    private var passKitView: PassKitView
    
    init(_ passkitView: PassKitView) {
        self.passKitView = passkitView
    }
    
    func addPassesViewControllerDidFinish(_ controller: PKAddPassesViewController) {
        self.passKitView.pass = nil
    }
}
