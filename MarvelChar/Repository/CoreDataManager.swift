//
//  CoreDataManager.swift
//  MarvelChar
//
//  Created by SidneySilva on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func saveCharacter(character: Result)
    func retrieveCharacters() -> [Result]
    func deleteCharacter(id: Int)
}

class CoreDataManager: CoreDataManagerProtocol {
    func saveCharacter(character: Result) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Character", in: managedContext) else { return }
        
        let char = NSManagedObject(entity: entity, insertInto: managedContext)
        char.setValue(character.id, forKey: "id")
        char.setValue(character.name, forKey: "name")
        char.setValue(character.description, forKey: "info")
        char.setValue(character.thumbnail?.path, forKey: "path")
        char.setValue(character.thumbnail?.fileExtension, forKey: "fileExtension")

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveCharacters() -> [Result] {
        var characters = [Result]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return characters}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")

        do {
            let result = try managedContext.fetch(fetchRequest)
            guard let chars = result as? [NSManagedObject] else { return characters }
            for data in chars {
                let id = data.value(forKey: "id") as? Int
                let name = data.value(forKey: "name") as? String
                let description = data.value(forKey: "info") as? String
                let thumbnail = Thumbnail(path: data.value(forKey: "path") as? String, fileExtension: data.value(forKey: "fileExtension") as? String)
                let character = Result(id: id,
                                       isFavorite: true,
                                       name: name,
                                       title: "",
                                       description: description,
                                       thumbnail: thumbnail)
                characters.append(character)
            }
        } catch {
            print("Failed")
        }
        
        return  characters
    }
    
    func deleteCharacter(id: Int) {
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         let managedContext = appDelegate.persistentContainer.viewContext
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")
         fetchRequest.predicate = NSPredicate(format: "id = %lu", id)

         do {
            let result = try managedContext.fetch(fetchRequest)
            guard let objectToDelete = result.first as? NSManagedObject else { return }
            managedContext.delete(objectToDelete)
             
            do {
                try managedContext.save()
            } catch {
                print(error)
            }
         } catch {
             print(error)
         }
    }
}
