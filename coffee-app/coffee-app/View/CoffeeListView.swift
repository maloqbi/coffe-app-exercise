import SwiftUI

struct CoffeeListView: View {
    @StateObject private var viewModel = CoffeeListViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.coffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee, image: viewModel.images[coffee.id])) {
                            CoffeeCardView(coffee: coffee)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.vertical, 4)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            .navigationTitle("Coffee")
            .background(Color.viewBackground)
            .refreshable {
                 viewModel.fetchCoffees()
            }
            .onAppear {
                Task {
                     viewModel.fetchCoffees()
                }
            }
        }
    }
}

