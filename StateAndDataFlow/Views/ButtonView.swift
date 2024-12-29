//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Perejro on 28/12/2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    let color: Color
    var size: Size = .medium
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .size(size: size)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

#Preview {
    ButtonView(
        title: "Button",
        action: {},
        color: .red,
        size: .medium
    )
}
