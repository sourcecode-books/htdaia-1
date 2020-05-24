//
//  AccessibilityCustomActionViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityCustomActionViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    let deleteString = Localizable.string(for: LocalizedKey.AccessibilityAction.delete.key)
    let markAsReadString = Localizable.string(for: LocalizedKey.AccessibilityAction.markAsRead.key)
    var items: [String] = [
        LocalizedKey.AccessibilityAction.swipeLeft.key,
        LocalizedKey.AccessibilityAction.voiceOverGesture.key,
        LocalizedKey.AccessibilityAction.customActions.key
    ]
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerViews()
    }
    
    private func registerViews() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCell.defaultCell.identifier)
    }

    // MARK: - Accessibility
    private func setUpCustomActions(for cell: UITableViewCell) {
        cell.accessibilityCustomActions = [
            UIAccessibilityCustomAction(name: markAsReadString, target: self, selector: #selector(markAsRead)),
            UIAccessibilityCustomAction(name: deleteString, target: self, selector: #selector(deleteItem))
        ]
    }

    // MARK: - User actions
    @objc private func markAsRead() -> Bool {
        print(markAsReadString)
        return true
    }

    @objc private func deleteItem() -> Bool {
        print(deleteString)
        return true
    }
}

extension AccessibilityCustomActionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.defaultCell.identifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = Localizable.string(for: items[indexPath.row])
        if isAccessibilityFixed {
            setUpCustomActions(for: cell)
        }
        return cell
    }
}

extension AccessibilityCustomActionViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        guard isAccessibilityFixed else { return nil }
        let markAsReadAction = UIContextualAction(style: .normal, title: markAsReadString, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(self.markAsRead())
        })
        markAsReadAction.image = UIImage(systemName: "flag")
        markAsReadAction.backgroundColor = .blue

        let deleteAction = UIContextualAction(style: .destructive, title:  deleteString, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(self.deleteItem())
            success(true)
        })
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [markAsReadAction, deleteAction])
    }
}
