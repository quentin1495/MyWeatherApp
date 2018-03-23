//
//  HomeViewController+NSFetchedResultsControllerDelegate.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 06/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import CoreData

extension HomeViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any, at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        let index = indexPath ?? (newIndexPath ?? nil)
        guard let cellIndexPath = index else {
            return
        }
        switch type {
        case .insert:
            tableView.insertRows(at: [cellIndexPath], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [cellIndexPath], with: .automatic)
        case .update:
            tableView.reloadRows(at: [cellIndexPath], with: .automatic)
        case .move:
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                tableView.moveRow(at: indexPath, to: newIndexPath)
            }
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
