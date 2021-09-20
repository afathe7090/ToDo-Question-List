//
//  ListViewController.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import UIKit

//MARK: - Protocols

@objc protocol listViewButtonProtocol: AnyObject {
    func selectorOfAddButtonAction()
}


@objc protocol AddListViewProtocol: AnyObject {
    func backButtonSelect()
    func addButtonSelect()
}




//MARK: - ListViewController
class ListViewController: UIViewController {
    
    
    //MARK: - Properties
    private let listView = ListView()
    private var listData =  [ListModel]()
    private let addListView = AddListView()
    private var isEditingSection = false
    private let refreshController = UIRefreshControl()
    
    
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = listView
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
        listView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        checkDataIsEmpty()
        configureViewController()        
    }
    
    
    
    //MARK: - Function
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureViewController(){
        addListView.delegate = self
        self.title = "ToDo List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        
        listView.tableView.refreshControl = refreshController
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Add List View
    private func configureAddListView(){
        listView.addButton.isEnabled = false
        view.addSubview(addListView)
        NSLayoutConstraint.activate([
            addListView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            addListView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 330),
            addListView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addListView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 20),
            
        ])
        // For Animation
        addListView.transform = CGAffineTransform(scaleX: 0.3, y: 0.85)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.addListView.transform = .identity
        }, completion: nil)
        
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - check Empty
    private func checkDataIsEmpty(){
        listView.tableView.isHidden = listData.isEmpty ? true:false
        navigationController?.navigationBar.isHidden = listData.isEmpty ? true:false
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - FetchData
    private func fetchData(){
        guard !DataSavedLocally.shared.getDataLocally().isEmpty else{return}
        self.listData = DataSavedLocally.shared.getDataLocally()
    }
    
}















//MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate , UITableViewDataSource {
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - number Of Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData[section].isClosed ?? false ? 2:1
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell", for: indexPath) as! ListTableCell
            
            cell.backView.backgroundColor = listData[indexPath.section].isClosed ?? false ? #colorLiteral(red: 0.2167480088, green: 0.6092969962, blue: 0.8689401029, alpha: 1):#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.configureData(listData[indexPath.section])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.configureData(listData[indexPath.section])
            return cell
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Height For Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 75:150
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let estend = listData[indexPath.section].isClosed ?? false
            listData[indexPath.section].isClosed = !estend
            
            tableView.reloadSections(IndexSet(integer: indexPath.section), with: UITableView.RowAnimation.none)
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Swip Delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { context, view, completion in
            self.listData.remove(at: indexPath.section)
            DataSavedLocally.shared.saveToDoLoaclly(self.listData)
            self.checkDataIsEmpty()
            tableView.animationTableView()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { context, view, completion in
            self.configureAddListView()
            self.addListView.addButtonToDoList.setTitle("Edit !", for: .normal)
            
            let dataIndex = self.listData[indexPath.section]
            
            self.isEditingSection = true
            self.addListView.saveSectoinIndex = indexPath.section
            self.addListView.titleToDoTextField.text = dataIndex.title
            self.addListView.detailsTextView.text = dataIndex.discription
            
        }
        
        delete.backgroundColor = .red
        let swip = UISwipeActionsConfiguration(actions: [delete,edit])
        swip.performsFirstActionWithFullSwipe = false
        return swip
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Refresh Table
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            listView.tableView.animationTableView()
            refreshController.endRefreshing()
        }
    }
    
    
}
















//MARK: - listViewButtonProtocol
extension ListViewController: listViewButtonProtocol{
    
     func selectorOfAddButtonAction() {
        configureAddListView()
    }
}


//MARK: - AddListViewProtocol
extension ListViewController: AddListViewProtocol{
    
    //MARK: - Back List View Button
    func backButtonSelect() {

        addListView.titleToDoTextField.text = ""
        addListView.detailsTextView.text = ""
        
        isEditingSection = false
        listView.addButton.isEnabled = true
        UIView.animate(withDuration: 1) {
            self.addListView.removeFromSuperview()
        }
    }
    
    //MARK: - Add List Button
    func addButtonSelect() {
        
        guard !addListView.titleToDoTextField.text!.isEmpty else{backButtonSelect();return}
        guard !addListView.detailsTextView.text!.isEmpty else{backButtonSelect();return}
        
        guard let toDo = addListView.titleToDoTextField.text else{return}
        guard let toDoDetails = addListView.detailsTextView.text else{return}
        
        if isEditingSection{
            
            listData[addListView.saveSectoinIndex].title = toDo
            listData[addListView.saveSectoinIndex].discription = toDoDetails
            DataSavedLocally.shared.saveToDoLoaclly(listData)
        }else{
            isEditingSection = false
            addListView.addButtonToDoList.setTitle("Add toDo!", for: .normal)

            listData.insert(ListModel(title: toDo, discription: toDoDetails), at: 0)
            DataSavedLocally.shared.saveToDoLoaclly(listData)
        }
        
        checkDataIsEmpty()
        backButtonSelect()
        listView.tableView.animationTableView()
    }
    
    
}



