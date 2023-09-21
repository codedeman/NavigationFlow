//
//  AccountLinkingScreen.swift
//  NavigationFlow
//
//  Created by Kevin on 9/21/23.
//  Copyright © 2023 Nick McConnell. All rights reserved.
//

import SwiftUI

struct AccountLinkingScreen: View {
    @StateObject var vm: AccountLinkingViewModel

    var body: some View {
        Text("Linking with \(vm.phone) New Account 🇻🇳")
        Button(action: {vm.didTabAccountLinking()}, label: {Text("Link Account")})

    }
}

//struct AccountLinkingScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountLinkingScreen()
//    }
//}
