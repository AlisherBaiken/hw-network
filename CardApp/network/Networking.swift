//
//  Networking.swift
//  CardApp
//
//  Created by rbkuser on 14.08.2024.
//

import Foundation
import Alamofire

class Networking {
    let baseUrl = "https://api.magicthegathering.io/"
    let cardPass = "v1/cards"
    static let shared = Networking()
    
    func fetchCards(completions: @escaping (Result<[Card], Error>) -> Void) {
        AF.request(baseUrl + cardPass).responseDecodable(of: CardResponse.self) { response in
            switch response.result {
            case .success(let CardResponse):
                completions(.success(CardResponse.cards))
            case .failure(let error):
                completions(.failure(error))
            }
        }
    }
}
