//
//  CoffeCardView.swift
//  coffe-app
//
//  Created by Mohammed on 29/08/1445 AH.
//

import Foundation
import SwiftUI

struct CoffeeCardView: View {
    let coffee: Coffee
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(coffee.title ?? "No Data")
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .frame(height: 40, alignment: .leading)
            
            
            if let description = coffee.description, !description.isEmpty {
                Text(description)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(3)
                    .frame(height: 60, alignment: .leading)
            } else {
                
                Text("No description available")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(3)
                    .hidden()
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150)
        .background(LinearGradient(gradient: Gradient(colors: [Color.cardStart, Color.cardEnd]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
