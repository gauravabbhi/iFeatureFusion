//
//  iFeatureFusionLiteApp.swift
//  iFeatureFusionLite
//
//  Created by Karan on 30/03/24.
//

import SwiftUI

@main
struct iFeatureFusionLiteApp: App {
    var body: some Scene {
        WindowGroup {
            ConditionalView()
        }
    }
}


class AppViewModel: ObservableObject {
    @Published var conditionMet = false
}


struct ConditionalView: View {
    @StateObject private var viewModel = AppViewModel()

    var body: some View {
        NavigationView {
            if viewModel.conditionMet {
                ContentView()
            } else {
                AnimatedLaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                viewModel.conditionMet = true
                            }
                        }
                    }
            }
        }
    }
}
