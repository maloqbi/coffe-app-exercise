import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CoffeeListView()
                .tabItem {
                    Label("Coffee", systemImage: "house.fill")
                }
            
            Text("Second View")
                .tabItem {
                    Label("Other", systemImage: "ellipsis.circle.fill")
                }
        }
    }
    
}


struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}


