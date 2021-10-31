//
//  ContentView.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//

import SwiftUI
import UIKit
import PassKit

struct AddToWalletView: View {
    
    @State var pass: PKPass?
    @State var alertItem: AlertItem?
    
    var body: some View {
        
        ZStack {
            
            if PKAddPassesViewController.canAddPasses() {
                 AddToWalletButton()
                    .onTapGesture {
                        getPass()
                }.frame(width: 300, height: 50)
            }
            
            if pass != nil {
                PassKitView(pass: $pass)
            }
            
        }.alert(item: $alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
    
    func getPass() {
        
        NetworkManager.shared.getPass(completed:  { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let newPass):
                    self.pass = newPass
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidPass:
                        alertItem = AlertContext.invalidPass
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        })
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddToWalletView()
    }
}
