//
//  FlowView.swift
//  NavigationFlow
//
//  Created by Nick McConnell on 6/7/20.
//  Copyright © 2020 Nick McConnell. All rights reserved.
//

import SwiftUI

struct FlowView: View {
    
    @StateObject var vm: FlowVM

    var body: some View {
        NavigationSplitView{
            Screen1Phone(vm: vm.makeScreen1PhoneVM())
        } detail: {
            NavigationStack(path: $vm.navigationPath) {
                VStack() {
                    Text("Hello my friend ")
                    Screen1Phone(vm: vm.makeScreen1PhoneVM())
                }
                .navigationDestination(for: Screen.self) {screen in
                    switch screen {
                    case .screen2(vm: let vm):
                        Screen2Verification(vm: vm)
                    case .screen3(vm: let vm):
                        Screen3NameEmail(vm: vm)
                    case .screen4(vm: let vm):
                        Screen4CompanyInfo(vm: vm)
                    case .screen5(vm: let vm):
                        Screen5Final(vm: vm)
                    }
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())

        }

    }
}
