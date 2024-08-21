//
//  CardsViewModel.swift
//  CardApp
//
//  Created by rbkuser on 14.08.2024.
//

import Foundation

class CardsViewModel {
    var cards: [Card] = []
    var onDataUpdate: (() -> Void?)?
 
    func fetcData() {
        Networking.shared.fetchCards { [weak self] result in
            switch result {
            case .success(let cards):
                self?.cards = cards
                self?.onDataUpdate?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
