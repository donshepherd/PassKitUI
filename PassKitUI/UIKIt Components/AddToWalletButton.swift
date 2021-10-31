//
//  AddToWalletButton.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//  Example of using a UIViewRepresentable to Display the Add to Wallet button
//

import SwiftUI
import PassKit

struct AddToWalletButton: UIViewRepresentable {
    func makeUIView(context: Context) -> PKAddPassButton {
        return PKAddPassButton()
    }
    
    func updateUIView(_ uiView: PKAddPassButton, context: Context) {
    
    }
}

struct AddToWalletButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToWalletButton()
    }
}
