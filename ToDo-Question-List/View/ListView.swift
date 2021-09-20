//
//  ListView.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import UIKit

class ListView: UIView {
    
    let widthScreen = UIScreen.main.bounds.width
    
    var delegate: listViewButtonProtocol?
    
    var list:[ListModel] = [.init(title: "Ahmed", discription: "Mohamedsfksd'lfk'sl'dkflksdl;gk;sdlkg;ldfkf;glkjdfdklgjlkdfjglk;djffglk;jdflkmvvlkdmflfkjdflkjdlkvndkjannjgfjkd"),.init(title: "section", discription: "Ajkjsnf")]

    //-------------------------------------------------------------------------------------------------------------------------------------------
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 244/255, alpha: 1)
        tableView.register(ListTableCell.self, forCellReuseIdentifier: ListTableCell.cellID)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 150
        return tableView
    }()

    //-------------------------------------------------------------------------------------------------------------------------------------------
    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        let gifImage = UIImage.t_gif(name: "GIFWhat")
        image.image = gifImage
        return image
    }()
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.tintColor = .white
        btn.layer.shadowColor = UIColor.lightGray.cgColor
        btn.layer.shadowOpacity = 0.9
        btn.layer.shadowOffset = CGSize(width: 5, height: 2)
        btn.layer.shadowRadius = 3
        btn.addTarget(delegate, action: #selector(delegate?.selectorOfAddButtonAction), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        btn.layer.cornerRadius = 70 / 2
        return btn
    }()
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textAlignment = .center
        label.text = "No Transaction Yet!"
        return label
    }()
    
    
    private lazy var subTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "Add a transaction and it will show up here"
        return label
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        configureImageView()
        configureTitleLabel()
        configureSubTitleLabel()
        configureTableView()
        configureAddButton()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    //MARK: - Function
    
    private func configureImageView(){
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: (widthScreen / 2) + 50.0),
            imageView.heightAnchor.constraint(equalToConstant: widthScreen / 2)
        ])
    }
    
    
    private func configureTableView(){
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    private func configureTitleLabel(){
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor ,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    
    private func configureSubTitleLabel(){
        addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor ,constant: 0),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc private func configureAddButton() {
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 70),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor ,constant: -50),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -45),
        ])
        
    }
    
    
    
    @objc func configureButtonPressedAction(){
        print("Ahjnsfklsd")
        delegate?.selectorOfAddButtonAction()
    }
}




