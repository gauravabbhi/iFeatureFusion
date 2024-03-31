//
//  AnimatedLaunchView.swift
//  iFeatureFusion
//
//  Created by Karan on 30/03/24.
//

import SwiftUI

struct AnimatedLaunchView: View {
    
    let rows: Int = {
#if os(macOS)
        return 16
#elseif os(iOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 3 // Adjust the number of rows for iPad
        } else {
            return 10 // Default number of rows for other iOS devices
        }
#else
        return 3
#endif
    }()
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 100) {
                ForEach(0..<self.rows, id: \.self){_ in
                    HStack(spacing: 20) {
                        ForEach(0..<62) { columnIndex in
                            RectangleView(index: columnIndex)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    struct RectangleView: View {
        let index: Int
        
        @State private var scrollOffset: CGFloat = 0
        
        var body: some View {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.random.gradient)
                    .frame(width: 70, height: 100)
                    .offset(x: calculateOffset(geometry: geometry))
                    .onAppear {
                        animateLooping()
                    }
            }
            
        }
        
        private func calculateOffset(geometry: GeometryProxy) -> CGFloat {
            let position = CGFloat(index) * (50 + 10)
            let offset = position - scrollOffset
            return offset
        }
        
        private func animateLooping() {
            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: true)) {
                scrollOffset += 600
            }
        }
        
    }
}

#Preview {
    AnimatedLaunchView()
}
