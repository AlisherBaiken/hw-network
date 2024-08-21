//
//  ViewController.swift
//  CardApp
//
//  Created by rbkuser on 14.08.2024.
//

import UIKit
import SnapKit

class CardsViewController: UIViewController {
    
    let tableView = UITableView()
    var model = CardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Magic: The Gathering Cards"
        setupTableView()
        setupBindings()
        model.fetcData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "CardTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        model.onDataUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension CardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as? CardTableViewCell else {
            return UITableViewCell()
        }
        let card = model.cards[indexPath.row]
        cell.configure(with: card)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = model.cards[indexPath.row]
        let detailViewController = CardDetailViewController(card: card)
        present(detailViewController, animated: true, completion: nil)
    }
    
}

