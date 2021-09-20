//
//  DescriptionCell.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import UIKit

class DescriptionCell: UITableViewCell {

    
     private lazy var toDoSubTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
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
        
        selectionStyle = .none
        backgroundColor = .clear
        configureViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    private func configureViews(){
        
        addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor ,constant: 10),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

        ])
        
        
        addSubview(toDoSubTitleLabel)
        NSLayoutConstraint.activate([
            toDoSubTitleLabel.topAnchor.constraint(equalTo: topAnchor ,constant: 15),
            toDoSubTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            toDoSubTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            toDoSubTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
//            toDoSubTitleLabel.heightAnchor.constraint(equalToConstant:  60)
        ])
    }
    
    
    func configureData(_ list: ListModel){
        self.toDoSubTitleLabel.text = list.discription
    }
}
