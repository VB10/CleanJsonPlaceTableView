//
//  JsonPlaceHolderViewController.swift
//  CleanJsonPlaceTableView
//
//  Created by 111542 on 5/2/21.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {
    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!

    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPLaceHolderProtocol = JsonPlaceHolderService()

    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initService()
    }

    private func initDelegate() {
        tableViewJsonPlaceHolder.delegate = jsonTableView
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        jsonTableView.delegate = self
    }

    private func initService() {
        jsonService.fethAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
    }

}


extension JsonPlaceHolderViewController: JsonTableViewOutput {
    func onSelected(item: PostModel) {
        print(item.body ?? "")
    }
}
