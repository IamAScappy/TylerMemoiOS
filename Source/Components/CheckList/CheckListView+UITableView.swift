//
//  CheckListBottomSheetViewController+UITableView.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

extension CheckListView {
  var configureCell: (TableViewSectionedDataSource<CheckListViewModel>, UITableView, IndexPath, CheckListViewModel.Item) -> UITableViewCell {
    return { dataSource, tableView, indexPath, item in
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckItemTableCell.identifier, for: indexPath)
        as? CheckItemTableCell
        else { fatalError("can't dequeueReusableCell identifier: [\(CheckItemTableCell.identifier)] index: \(indexPath)") }
      cell.selectionStyle = .none
      cell.configCell(item)
      cell.accessoryView = UIView()
      return cell
    }
  }
}
