//
//  ListTableCell.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import UIKit

class ListTableCell: UITableViewCell {
    
    static let cellID = "ListTableCell"
    
    //MARK: - Properties
    
      lazy var toDoTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var backView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    private func configureViews(){
        
        addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor ,constant: 5),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),

        ])
        
        
        
        backView.addSubview(toDoTitleLabel)
        NSLayoutConstraint.activate([
            toDoTitleLabel.topAnchor.constraint(equalTo: topAnchor ,constant: 5),
            toDoTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            toDoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            toDoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            toDoTitleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    func configureData(_ list: ListModel){
        self .toDoTitleLabel.text = list.title
    }
}
