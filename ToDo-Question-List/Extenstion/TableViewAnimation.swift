//
//  TableViewAnimation.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 13/09/2021.
//

import UIKit

extension UITableView{
    
    func animationTableView(){
        reloadData()
        
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        
        var counterDelay = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        for cell in cells{
            
            UIView.animate(withDuration: 1, delay: 0.8 * Double(counterDelay), usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut) {
                cell.transform = CGAffineTransform.identity
            }
            counterDelay += 1
            
        }
        
        
    }
    
}
