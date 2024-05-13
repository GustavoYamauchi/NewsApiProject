//
//  HeadlineViewModel.swift
//  NewsApiProject
//
//  Created by Gustavo Yamauchi on 11/05/24.
//

import UIKit

class HeadlineViewModel: NSObject {
    
    var headlines: [Articles]
    
    
    init(headlines: [Articles] = []) {
        self.headlines = headlines
    }
    
    
    func getHeadlines(completion: @escaping (Result<HeadlineModel, Error>) -> Void) {
        Service.shared.request() { (result: Result<HeadlineModel, Error>) in
            switch result {
            case .success(let headline):
                self.headlines = headline.articles!
                completion(.success(headline))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
