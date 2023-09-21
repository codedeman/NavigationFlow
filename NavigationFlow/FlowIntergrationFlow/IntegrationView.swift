//
//  IntegrationView.swift
//  NavigationFlow
//
//  Created by Kevin on 9/21/23.
//  Copyright © 2023 Nick McConnell. All rights reserved.
//

import Foundation
import SwiftUI

struct IntegrationView: View {

    @StateObject var flow: IntegrationFlow
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack(path: $flow.navigationPath) {
            VStack() {
                AccountLinkingScreen(vm: flow.makeAccountLinkingViewModel())
            }
            .navigationDestination(for: ItegrationStep.self) {screen in
                switch screen {
                case .start(let vm):
                    AccountLinkingScreen(vm: vm)
                case .finish:
                    FlowView(vm: flow.startOpenPhoneScreen())

                }
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
