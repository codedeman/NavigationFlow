//
//  AccountLinkingViewModel.swift
//  NavigationFlow
//
//  Created by Kevin on 9/21/23.
//  Copyright © 2023 Nick McConnell. All rights reserved.
//

import Foundation
import Combine

final class AccountLinkingViewModel: ObservableObject, Navigable  {

    let startLinking = PassthroughSubject<AccountLinkingViewModel, Never>()

    @Published var phone = ""

    init(phone: String = "") {
        self.phone = phone
    }

    func didTabAccountLinking() {
        startLinking.send(self)
    }
    
    
}
