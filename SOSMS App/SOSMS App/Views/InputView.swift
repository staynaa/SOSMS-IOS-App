//
//  InputView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/17/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(title).fontWeight(.semibold)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size:14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size:14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""),title: "Enter Email Address",placeholder: "name@example.com")
}
