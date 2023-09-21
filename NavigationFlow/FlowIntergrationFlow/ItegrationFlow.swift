//
//  ItergrationFlow.swift
//  NavigationFlow
//
//  Created by Kevin on 9/21/23.
//  Copyright © 2023 Nick McConnell. All rights reserved.
//

import Foundation
import Combine

enum ItegrationStep: Hashable {
    case start(vm: AccountLinkingViewModel)
    case finish 
}

final class IntegrationFlow: ObservableObject {

    @Published var navigationPath: [ItegrationStep] = []
    var subscription = Set<AnyCancellable>()

    func makeAccountLinkingViewModel() -> AccountLinkingViewModel {
        let vm = AccountLinkingViewModel()
        vm.startLinking
            .sink(receiveValue: startLinking(vm:))
            .store(in: &subscription)
        return vm
    }


    func startLinking(vm: AccountLinkingViewModel) {
        navigationPath.append(.finish)
    }

    func startOpenPhoneScreen() -> FlowVM {
        let vm = FlowVM(step: .screen2(vm: .init(phoneNumber: "+84")))
        vm.root
            .sink(receiveValue: finishInterationFlow(phone:))
            .store(in: &subscription)
        return vm
    }

    func finishInterationFlow(phone: String) {
//        IntegrationView(flow: IntegrationFlow())
//        navigationPath.append(.start(vm: .init(phone: phone)))
        navigationPath.append(.finish)
    }


}
