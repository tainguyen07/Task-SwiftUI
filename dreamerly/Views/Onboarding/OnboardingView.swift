//
//  OnboardingView.swift
//  dreamerly
//
//  Created by Tai Nguyen on 18/8/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingScreenView(imageName: "onboarding1", title: "Welcome to Dreamerly", description: "An app designed to help you manage your tasks efficiently.")
                    .tag(0)
                OnboardingScreenView(imageName: "onboarding2", title: "Track Your Progress", description: "Keep track of completed tasks and stay motivated.")
                    .tag(1)
                OnboardingScreenView(imageName: "onboarding3", title: "Stay Organized", description: "Organize your tasks into categories and prioritize your work.")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            ProgressView(value: Double(currentPage + 1) / 3.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding(.horizontal)
            
            HStack {
                if currentPage > 0 {
                    Button(action: {
                        withAnimation {
                            currentPage -= 1
                        }
                    }) {
                        Text("Back")
                            .font(.headline)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        if currentPage < 2 {
                            currentPage += 1
                        } else {
                            completeOnboarding()
                        }
                    }
                }) {
                    Text(currentPage < 2 ? "Next" : "Get Started")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        // Navigate to main content view
    }
}

#Preview {
    OnboardingView()
}
