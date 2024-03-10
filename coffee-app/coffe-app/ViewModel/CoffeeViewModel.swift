//
//  CoffeViewModel.swift
//  coffe-app
//
//  Created by Mohammed on 29/08/1445 AH.
//

import Foundation
import UIKit

class CoffeeListViewModel: ObservableObject {
    @Published var coffees: [Coffee] = []
    @Published var images: [Int: UIImage] = [:]

    func fetchCoffees() {
        guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let decodedCoffees = try JSONDecoder().decode([Coffee].self, from: data)
                DispatchQueue.main.async {
                    self?.coffees = decodedCoffees
                    self?.fetchImagesForCoffees(decodedCoffees)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    private func fetchImagesForCoffees(_ coffees: [Coffee]) {
        for coffee in coffees {
            guard let urlString = coffee.image, let url = URL(string: urlString) else { continue }
            fetchImage(for: url) { [weak self] image in
                DispatchQueue.main.async {
                    
                    guard let image = image else { return }
                    self?.images[coffee.id] = image
                }
            }
        }
    }
    
    private func fetchImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}
