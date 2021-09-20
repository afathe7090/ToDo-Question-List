//
//  DataSavedLocally.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 13/09/2021.
//

import UIKit




class DataSavedLocally{
    
    static let shared = DataSavedLocally()
    
    let defaults = UserDefaults.standard
    
    
    
    //MARK: - SaveData Locally
    func saveToDoLoaclly(_ toDo: [ListModel]){
        
        let encoder = JSONEncoder()
        
        do{
            let data = try encoder.encode(toDo)
            defaults.setValue(data, forKey: "dataEncoder")
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Get Data Localy
    func getDataLocally()-> [ListModel]{
        
        var dataLocally = [ListModel]()
        
        if let data = defaults.data(forKey: "dataEncoder"){
            let decoder = JSONDecoder()
            
            do{
                let data = try decoder.decode([ListModel].self, from: data)
                dataLocally = data
            }catch{
                print(error.localizedDescription)
            }
        }
        return dataLocally
    }
    
    
    
}
