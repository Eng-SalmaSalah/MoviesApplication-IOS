//
//  CoreDataAccess.swift
//  MyMovies
//
//  Created by Salma on 5/19/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CoreDataAccess : CoreDataAccessDelegate{
    var homePresenter : HomePresenter
    var appDelegate : AppDelegate
    var context : NSManagedObjectContext
    var movieListFromCoreData = [Movie]()
    init(homePresenter:HomePresenter) {
        self.homePresenter=homePresenter
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func storeMovieInCoreData(favouriteMovie : Movie) {
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: context)
        let movie = NSManagedObject(entity: entity!, insertInto: context)
            movie.setValue(favouriteMovie.id, forKey: "movieID")
            movie.setValue(favouriteMovie.originalTitle, forKey: "movieOriginalTitle")
            movie.setValue(favouriteMovie.overview, forKey: "movieOverview")
            movie.setValue(favouriteMovie.posterPath, forKey: "moviePosterPath")
            movie.setValue(favouriteMovie.releaseDate, forKey: "movieReleaseDate")
            movie.setValue(favouriteMovie.voteAverage, forKey: "movieVoteAverage")
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
    
    
    func getMoviesFromCoreData() {
        movieListFromCoreData.removeAll()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let movie = Movie(id: data.value(forKey: "movieID") as! Int, voteAverage: data.value(forKey: "movieVoteAverage") as! Float, posterPath: data.value(forKey: "moviePosterPath") as! String, originalTitle: data.value(forKey: "movieOriginalTitle") as! String, overview: data.value(forKey: "movieOverview") as! String, releaseDate: data.value(forKey: "movieReleaseDate") as! String)
                movieListFromCoreData.append(movie)
            }
            print(movieListFromCoreData[0])
            showMoviesFromCoreData()
            
        } catch {
            
            print("Failed")
        }
    }
    
    func showMoviesFromCoreData(){
        homePresenter.sendMoviesToView(movieList: movieListFromCoreData)
    }
}
