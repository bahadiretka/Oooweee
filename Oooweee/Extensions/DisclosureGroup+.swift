//
//  DisclosureGroup+.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 11.04.2023.
//

import Foundation
import SwiftUI
struct CustomDisclosureGroup<Prompt: View, ExpandedView: View>: View {
    
    @Binding var isExpanded: Bool

    var actionOnClick: () -> ()
    var animation: Animation?
    
    let prompt: Prompt
    let expandedView: ExpandedView
    
    init(animation: Animation?, isExpanded: Binding<Bool>, actionOnClick: @escaping () -> (), prompt: () -> Prompt, expandedView: () -> ExpandedView) {
        self.actionOnClick = actionOnClick
        self._isExpanded = isExpanded
        self.animation = animation
        self.prompt = prompt()
        self.expandedView = expandedView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            prompt
            
            if isExpanded{
                expandedView
            }
        }
        .clipped()
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(animation) {
                actionOnClick()
            }
        }
    }
}
