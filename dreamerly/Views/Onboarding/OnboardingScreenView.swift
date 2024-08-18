//
//  OnboardingScreenView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 18/8/24.
//

import SwiftUI

struct OnboardingScreenView: View {
    let imageName: String
    let title: String
    let description: String
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300) // Increase the height for a bigger image
                .scaleEffect(animate ? 1.0 : 0.8)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0), value: animate)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0).delay(0.5), value: animate)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0).delay(1.0), value: animate)
            
            Spacer()
        }
        .padding()
        .onAppear {
            animate = true
        }
    }
}
//#Preview {
//    OnboardingScreenView()
//}
