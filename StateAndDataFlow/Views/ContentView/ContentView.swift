//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
            VStack {
                HStack {
                    Text("Hi,")
                        .font(.title)
                        .italic()
                    Text("\(loginViewVM.name)")
                        .font(.title)
                        .bold()
                }
                .padding(20)
                .cornerRadius(20)
                .foregroundStyle(.white)
                
                Spacer()
                   
                VStack(spacing: 20) {
                    Text("Counter: ")
                        .font(.largeTitle)
                        + Text(contentViewVM.counter.formatted())
                            .font(.largeTitle)
                            .bold()
                    
                    ButtonView(
                        title: contentViewVM.buttonTitle,
                        action: contentViewVM.onTapButton,
                        color: .blue,
                        size: .large
                    )
                    .shadow(shadow: .high, color: .blue)
                   
                }
                
                Spacer()
                
                ButtonView(
                    title: "Logout",
                    action: loginViewVM.logout,
                    color: .red
                )
                .shadow(shadow: .high, color: .red)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.green)
        
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel(
            user: User(name: "Valera", isLoggedIn: true)
        ))
        .environment(ContentViewViewModel())
}

