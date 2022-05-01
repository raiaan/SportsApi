//
//  LeagueCoreDataService.swift
//  SportsApp
//
//  Created by Rain Moustfa on 30/04/2022.
//

import Foundation
import CoreData
import SystemConfiguration

class CoreDataService{
    
    func convertFromNSObjectToFilm(items:[NSManagedObject])->LeaguesResult{
        var resultLeagues = LeaguesResult(countrys: [Leagus]())
        for item in items {
            let id = item.value(forKeyPath: "idLeague") as! String
            let strLeague = item.value(forKeyPath: "strLeague") as! String
            let strLeagueAlternate = item.value(forKeyPath: "strLeagueAlternate") as! String
            let strSport = item.value(forKeyPath: "strSport") as! String
            let strBadge = item.value(forKey: "strBadge") as! String
            let league = Leagus(idLeague: id, strLeague: strLeague, strSport: strSport, strLeagueAlternate: strLeagueAlternate , strBadge: strBadge)
            resultLeagues.countrys.append(league)
        }
        return resultLeagues
    }
    
    func readLeagueFromCoreData(appDelegate:AppDelegate , compeletion :@escaping (LeaguesResult?)->()){
        var context:NSManagedObjectContext?
        context = appDelegate.persistentContainer.viewContext
        let fetchRec = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        do {
            let leaguesEntity = try context!.fetch(fetchRec)
           compeletion(convertFromNSObjectToFilm(items: leaguesEntity))
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    func saveToRoom(appDelegate:AppDelegate , item:Leagus){
        var context:NSManagedObjectContext?
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Leagues", in: context!)
        let league = NSManagedObject(entity: entity!,
                                       insertInto: context)
        league.setValue(item.idLeague , forKey: "idLeague")
        league.setValue(item.strLeague , forKey: "strLeague")
        league.setValue(item.strLeagueAlternate , forKey: "strLeagueAlternate")
        league.setValue(item.strSport, forKey: "strSport")
        league.setValue(item.strBadge, forKey: "strBadge")
        do{
            try context?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}
