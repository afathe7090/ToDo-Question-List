//
//  AddListView.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import UIKit

class AddListView: UIView {
    
    //MARK: - Properties
    
    var delegate: AddListViewProtocol?
    
    var saveSectoinIndex: Int = 0
    
    let customColor = UIColor(white: 1, alpha: 0.89)
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private lazy var titleLabelView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add ToDo"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25,weight: .medium)
        label.textColor = customColor
        return label
    }()
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = customColor
        return view
    }()
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     lazy var titleToDoTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .white
        textField.textAlignment = .center
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 50))
        textField.leftView = view
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(string: "What to do? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private lazy var toDoTextFieldView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = customColor
        return view
    }()
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     lazy var detailsTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.layer.borderColor = UIColor.white.cgColor
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 7
        textView.alpha = 0.75
        textView.layer.borderWidth = 1
        return textView
    }()
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     lazy var addButtonToDoList: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.alpha = 0.85
        btn.tintColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = UIColor.darkGray.cgColor
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 5
        btn.setTitle("Add ToDo!", for: .normal)
        btn.addTarget(delegate, action: #selector(delegate?.addButtonSelect), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private lazy var backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        btn.tintColor = .white
        btn.addTarget(delegate, action: #selector(delegate?.backButtonSelect), for: .touchUpInside)
        return btn
    }()
    
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureBackButton()
        configureTitleLabel()
        configureViewTitle()
        configureToDoTextField()
        configureViewToDoTextField()
        configureTextView()

    }
    
    
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
        
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 121/255, green: 66/255, blue: 156/255, alpha: 1)
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.cornerRadius = 25
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.2
    }
    
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureBackButton(){
        
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureTitleLabel(){
        
        addSubview(titleLabelView)
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            titleLabelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabelView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureViewTitle(){
        
        addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 1.2)
        ])
    }
    
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureToDoTextField(){
        
        addSubview(titleToDoTextField)
        NSLayoutConstraint.activate([
            titleToDoTextField.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            titleToDoTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleToDoTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureViewToDoTextField(){
        
        addSubview(toDoTextFieldView)
        NSLayoutConstraint.activate([
            toDoTextFieldView.topAnchor.constraint(equalTo: titleToDoTextField.bottomAnchor),
            toDoTextFieldView.leadingAnchor.constraint(equalTo: titleToDoTextField.leadingAnchor),
            toDoTextFieldView.trailingAnchor.constraint(equalTo: titleToDoTextField.trailingAnchor),
            toDoTextFieldView.heightAnchor.constraint(equalToConstant: 1.2)
        ])
    }
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureTextView(){
        addSubview(detailsTextView)
        addSubview(addButtonToDoList)
        
        NSLayoutConstraint.activate([
            detailsTextView.topAnchor.constraint(equalTo: toDoTextFieldView.bottomAnchor, constant: 20),
            detailsTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsTextView.bottomAnchor.constraint(equalTo: addButtonToDoList.topAnchor, constant: -20),
            
            
            addButtonToDoList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addButtonToDoList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addButtonToDoList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
            
        ])
    }
    
    
}
