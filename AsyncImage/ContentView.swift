//
//  ContentView.swift
//  AsyncImage
//
//  Created by Ricky Primayuda Putra on 09/10/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
            
    }
}

struct ContentView: View {
    
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        VStack {
            
//            1. MARK: Basic
            
//            AsyncImage(url: URL(string: imageURL))
            
//            2. MARK: Scale
            
//            AsyncImage(url: URL(string: imageURL), scale: 2.5)
            
//            3. MARK: Placeholder
            
//            AsyncImage(url: URL(string: imageURL)) { image in
//                image.imageModifier()
//            } placeholder: {
//                Image(systemName: "photo.circle.fill")
//                    .iconModifier()
//            }
//            .padding(40)
            
//            4. MARK: Phase
            
//            AsyncImage(url: URL(string: imageURL)) { phase in
//                if let image = phase.image {
//                    image.imageModifier()
//                } else if phase.error != nil {
//                    Image(systemName: "ant.circle.fill").iconModifier()
//                } else {
//                    Image(systemName: "photo.circle.fill").iconModifier()
//                }
//            }
//            .padding(40)
            
//            5. MARK: Animation
            
            AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image
                        .imageModifier()
//                        .transition(.move(edge: .bottom))
//                        .transition(.slide)
                        .transition(.scale)
                case .failure(_):
                    Image(systemName : "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                default:
                    ProgressView()
                }
            }
            .padding(40)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
