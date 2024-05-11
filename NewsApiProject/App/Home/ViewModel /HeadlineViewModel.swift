//
//  HeadlineViewModel.swift
//  NewsApiProject
//
//  Created by Gustavo Yamauchi on 11/05/24.
//

import UIKit

class HeadlineViewModel: NSObject {
    func fetchBrands() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=")!

//        var request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let brands = try? JSONDecoder().decode(HeadlineModel.self, from: data) {
                    print(brands)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
}
