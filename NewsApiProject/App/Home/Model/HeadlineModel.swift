//
//  HeadlineModel.swift
//  NewsApiProject
//
//  Created by Gustavo Yamauchi on 11/05/24.
//

import UIKit

class HeadlineModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
}

class Articles: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publisshedAt: String?
    var content: String?
}

class Source: Codable {
    var id: String?
    var name: String?
}
