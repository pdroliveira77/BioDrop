//
//  TextEmail.swift
//  BioDrop
//
//  Created by Pedro Oliveira on 28/05/26.
//

import SwiftUI

struct TextEmail: View
{
    @Binding var email: String
    
    var body: some View
    {
        Text("E-MAIL")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(.secondary)

        HStack
        {
            Image(systemName: "envelope")
                .foregroundStyle(.secondary)

            TextField(
                "Digite seu e-mail",
                text: $email
            )
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
        }
        .padding()
        .frame(height: 56)
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview
{
    TextEmail(email: .constant("pedro@email.com"))
}
