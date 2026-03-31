//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: FUNCITONS
    // RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //MARK: BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircle, id: \.self) { item in
                    MovingCircle(geometry: geometry)
                }//: Loop
                
                //Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            }//: ZSTACK
            .drawingGroup()
        }//: Geometry
    }
}

// MARK: - Moving Circle Component
struct MovingCircle: View {
    let geometry: GeometryProxy
    
    @State private var position: CGPoint = .zero
    @State private var size: CGFloat = 100
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.15
    
    var body: some View {
        Circle()
            .foregroundStyle(Color.gray)
            .opacity(opacity)
            .frame(width: size, height: size)
            .scaleEffect(scale)
            .position(position)
            .onAppear {
                // Set initial random values
                position = randomPosition()
                size = randomSize()
                scale = randomScale()
                
                // Start continuous animation
                animateToNewPosition()
            }
    }
    
    private func randomPosition() -> CGPoint {
        return CGPoint(
            x: CGFloat.random(in: 0...geometry.size.width),
            y: CGFloat.random(in: 0...geometry.size.height)
        )
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private func animateToNewPosition() {
        withAnimation(
            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .speed(Double.random(in: 0.025...1.0))
                .delay(Double.random(in: 0...2))
        ) {
            position = randomPosition()
            scale = randomScale()
        }
        
        // Schedule next animation
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 3...8)) {
            animateToNewPosition()
        }
    }
}

#Preview {
    MotionAnimationView()
}
