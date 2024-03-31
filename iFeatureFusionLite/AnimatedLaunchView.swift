import SwiftUI

struct AnimatedLaunchView: View {
    @State private var scrollOffset: CGFloat = 0
    let contentWidth: CGFloat = 2500
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack() {
                ForEach(0..<15) { index in
                    HStack {
                        ForEach(0..<50) { columnIndex in
                            RectangleView(index: columnIndex)
                        }
                    }
                }
            }
            .offset(x: scrollOffset)
        }
        .padding()
        .onAppear {
            startAnimationLoop()
        }
        .ignoresSafeArea()
    }
    
    
    private func startAnimationLoop() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.scrollOffset -= 10 // Adjust speed here
            
            // Check if scrollOffset reached the end of the content
            if abs(self.scrollOffset) >= self.contentWidth {
                self.scrollOffset = 0 // Reset scrollOffset
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
}

struct RectangleView: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.random.gradient)
            .frame(width: 70, height: 100)
    }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1)
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLaunchView()
    }
}
