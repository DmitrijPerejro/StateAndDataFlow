//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack {
                HStack {
                    TextField("Enter your name", text: $loginViewVM.user.name)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            login()
                         }
                    
                    Text(loginViewVM.name.count.formatted())
                        .foregroundStyle(
                            loginViewVM.isValidName ? .green : .red
                        )
                        .fontWeight(.bold)
                        .frame(width: 30)
                }
            }
            Button(action: login) {
                Label(
                    "OK",
                    systemImage: loginViewVM.isValidName ? "checkmark.circle" : "xmark"
                )
            }
            .disabled(!loginViewVM.isValidName)
            Spacer()
        }
        // Если у VStack не будет contentShape или background - onTapGesture не срабатывает
        .contentShape(Rectangle())
        .padding(20)
        .focused($focused)
        .onTapGesture {
             focused = false
         }
    }
 
    private func login() {
        if loginViewVM.isValidName {
            loginViewVM.login()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel(
            user: User.makeGuest()
        ))
}
