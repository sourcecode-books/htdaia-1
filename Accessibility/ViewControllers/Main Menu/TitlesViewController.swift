//
//  TitlesViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 09/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class TitlesViewController: UITableViewController {

    // MARK: - Properties
    var items: [Item] = []

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViews()
        title = Localizable.string(for: "Titles")
    }

    private func registerViews() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCell.defaultCell.identifier)
    }

    // MARK: - TableViewDatasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.defaultCell.identifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nibName = items[indexPath.row].nibName
        guard let className = NSClassFromString(nibName).self as? AccessibilityConfigurableViewController.Type else { return }

        let brokenVC = className.init()
        brokenVC.tabBarItem = UITabBarItem(title: "Broken", image: UIImage(systemName: "xmark.square"), selectedImage:  UIImage(systemName: "xmark.square.fill"))

        let fixedVC = className.init()
        fixedVC.isAccessibilityFixed = true
        fixedVC.tabBarItem = UITabBarItem(title: "Fixed", image: UIImage(systemName: "checkmark.square"), selectedImage:  UIImage(systemName: "checkmark.square.fill"))

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [brokenVC, fixedVC]
        tabBarController.title = items[indexPath.row].title
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}
