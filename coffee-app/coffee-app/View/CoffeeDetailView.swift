import SwiftUI

import SwiftUI

struct CoffeeDetailView: View {
    let coffee: Coffee
    let image: UIImage?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
        
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20)) 
                        .shadow(radius: 5) 
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondary)
                }

                Text(coffee.title ?? "Unknown Title")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(coffee.description ?? "No description available.")
                    .font(.body)

                if !coffee.ingredients.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Ingredients:")
                            .font(.headline)
                            .padding(.vertical, 5)

                        ForEach(coffee.ingredients, id: \.self) { ingredient in
                            Text(" - \(ingredient)")
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(coffee.title ?? "Coffee Detail")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.viewBackground)
        
    }
}
