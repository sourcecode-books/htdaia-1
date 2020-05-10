//
//  SectionsViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 08/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class SectionsViewController: UITableViewController {

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViews()
        title = Localizable.string(for: "Sections")
    }

    private func registerViews() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCell.defaultCell.identifier)
    }

    // MARK: - TableViewDatasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookSections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.defaultCell.identifier, for: indexPath)
        cell.textLabel?.text = bookSections[indexPath.row].section.rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TitlesViewController()
        viewController.items = bookSections[indexPath.row].items
        navigationController?.pushViewController(viewController, animated: true)
    }
}
