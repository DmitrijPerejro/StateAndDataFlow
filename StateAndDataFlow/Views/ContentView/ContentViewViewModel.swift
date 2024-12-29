//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel {
    enum ButtonState {
        case reset, start, wait
        
        var title: String {
            switch self {
            case .reset:
                return "Reset"
            case .start:
                return "Start"
            case .wait:
                return "Wait..."
            }
        }
    }
    
    var counter = 3
    var buttonTitle: String {
        buttonState.title
    }
    
    private var buttonState = ButtonState.start
    
    @ObservationIgnored
    private var timer: Timer?
    
    func onTapButton() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonState = ButtonState.reset
        }
        
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonState == ButtonState.reset {
            counter = 3
            buttonState = ButtonState.start
        } else {
            buttonState = ButtonState.wait
        }
        
    }
}
