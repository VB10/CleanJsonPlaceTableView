//
//  JsonTableView.swift
//  CleanJsonPlaceTableView
//
//  Created by 111542 on 5/2/21.
//

import UIKit

protocol JsonTableViewProtocol {
    func update(items: [PostModel])
}

protocol JsonTableViewOutput: class {
    func onSelected(item: PostModel)
}

final class JsonTableView: NSObject {
    private lazy var items: [PostModel] = []

    /// Json TableView Output Models
    weak var delegate: JsonTableViewOutput?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
}

extension JsonTableView: UITableViewDelegate, UITableViewDataSource { }
extension JsonTableView: JsonTableViewProtocol {
    func update(items: [PostModel]) {
        self.items = items
    }
}
