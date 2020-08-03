//
//  ViewController.swift
//  ParsingLocalJSON_bundle
//
//  Created by Gregory Keeley on 8/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Section {
        case main // table view has only one section
    }
    typealias DataSource = UITableViewDiffableDataSource<Section, President>
    private var dataSource: DataSource!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        configureDataSource()
    }
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: {(tableView, indexPath, president) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = president.name
            cell.detailTextLabel?.text = "\(president.number)"
            return cell
        })
        // Setup initial snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, President>()
        snapshot.appendSections([.main])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    private func fetchPresidents() {
        var presidents: [President] = []
        do {
            presidents = try Bundle.main.parseJSON(with: "presidents")
        } catch {
            print("error: \(error)")
        }
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(presidents, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}

