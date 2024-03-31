//
//  AnimatedLaunchView.swift
//  iFeatureFusion
//
//  Created by Karan on 30/03/24.
//

import SwiftUI

struct AnimatedLaunchView: View {
    
    var rows = Array(repeating: GridItem(.flexible()), count: 6)
    
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 100) {
                LazyHStack(spacing: 11) {
                    ForEach(0..<62) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 15) {
                    ForEach(0..<50) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 13) {
                    ForEach(0..<62) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 17) {
                    ForEach(0..<50) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 9) {
                    ForEach(0..<62) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 9) {
                    ForEach(0..<62) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
                
                LazyHStack(spacing: 9) {
                    ForEach(0..<62) { columnIndex in
                        RectangleView(index: columnIndex)
                    }
                }
            }
        }
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
//                    .onAppear {
//                        animateLooping()
//                    }
            }
            
        }
        
        private func calculateOffset(geometry: GeometryProxy) -> CGFloat {
            let position = CGFloat(index) * (50 + 10)
            let offset = position - scrollOffset
            return offset
        }
        
        private func animateLooping() {
            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                scrollOffset += 600
            }
        }
        
    }
}

#Preview {
    AnimatedLaunchView()
}
