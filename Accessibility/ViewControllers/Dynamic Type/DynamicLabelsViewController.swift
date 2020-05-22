//
//  DynamicLabelsViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

struct DynamicTypeViewModel {
    let imageName: String
    let title: String
    let description: String
}

final class DynamicLabelsViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var viewModels: [DynamicTypeViewModel] = [
        DynamicTypeViewModel(imageName: "book", title: LocalizedKey.DynamicType.titleOne.key, description: LocalizedKey.DynamicType.descriptionCell.key),
        DynamicTypeViewModel(imageName: "heart", title: LocalizedKey.DynamicType.titleTwo.key, description: LocalizedKey.DynamicType.descriptionCell.key),
        DynamicTypeViewModel(imageName: "calendar", title: LocalizedKey.DynamicType.titleThree.key, description: LocalizedKey.DynamicType.descriptionCell.key)
    ]

    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: Nib.dynamicTableViewCell.name, bundle: nil).self, forCellReuseIdentifier: TableViewCell.dynamicTypeCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension DynamicLabelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.dynamicTypeCell.identifier, for: indexPath) as! DynamicTableViewCell
        let viewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        if isAccessibilityFixed {
            cell.setUpAccessibility()
        }
        return cell
    }
}
