//
//  ButtonViewModifier.swift
//  StateAndDataFlow
//
//  Created by Perejro on 26/12/2024.
//

import SwiftUI

enum Shadow {
    case low, medium, high
    
    var value: CGFloat {
        switch self {
        case .low:
            5
        case .medium:
            10
        case .high:
            15
        }
    }
}

enum Size {
    case small, medium, large
    
    var value: (width: CGFloat, height: CGFloat) {
        switch self {
        case .small:
            (width: 150, height: 40)
        case .medium:
            (width: 200, height: 60)
        case .large:
            (width: 250, height: 80)
        }
    }
}


struct ButtonViewSizeModifier: ViewModifier {
    let size: Size
    
    func body(content: Content) -> some View {
        content
            .frame(width: size.value.width, height: size.value.height)
    }
}

struct ButtonViewShadowModifier: ViewModifier {
    let shadow: Shadow
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: shadow.value, x: 0, y: 10)
    }
}


extension View {
    func size(size: Size) -> some View {
        modifier(ButtonViewSizeModifier(size: size))
    }
    
    func shadow(shadow: Shadow, color: Color) -> some View {
        modifier(ButtonViewShadowModifier(shadow: shadow, color: color))
    }
}

