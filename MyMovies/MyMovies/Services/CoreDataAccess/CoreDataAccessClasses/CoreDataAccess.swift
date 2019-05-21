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
    
    
    var movieDetailsPresenterDelegate : MovieDetailsPresenterDelegate?
    var favouriteMoviesPresenterDelegate : FavouriteMoviesPresenterDelegate?
    var appDelegate : AppDelegate
    var context : NSManagedObjectContext
    var movieListFromCoreData = [Movie]()
    
    init(favouriteMoviesPresenterDelegate:FavouriteMoviesPresenterDelegate){
        self.favouriteMoviesPresenterDelegate=favouriteMoviesPresenterDelegate
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    init(movieDetailsPresenterDelegate:MovieDetailsPresenterDelegate) {
        self.movieDetailsPresenterDelegate=movieDetailsPresenterDelegate
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func storeMovieInCoreData(favouriteMovie : Movie) {
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: context)
        let movie = NSManagedObject(entity: entity!, insertInto: context)
        movie.setValue(favouriteMovie.id, forKey: "movieID")
        print(favouriteMovie.id)
        movie.setValue(favouriteMovie.originalTitle, forKey: "movieOriginalTitle")
        movie.setValue(favouriteMovie.overview, forKey: "movieOverview")
        movie.setValue(favouriteMovie.posterPath, forKey: "moviePosterPath")
        movie.setValue(favouriteMovie.releaseDate, forKey: "movieReleaseDate")
        movie.setValue(favouriteMovie.voteAverage, forKey: "movieVoteAverage")
        do {
            try context.save()
            movieDetailsPresenterDelegate?.notifyWithSavingResult(succeeded: true)
            
        } catch {
            movieDetailsPresenterDelegate?.notifyWithSavingResult(succeeded: false)
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
            showMoviesFromCoreData()
            
        } catch {
            print("Failed")
        }
    }
    
    func showMoviesFromCoreData(){
        favouriteMoviesPresenterDelegate?.sendMoviesToView(movieList: movieListFromCoreData)
    }
    
    func removeMovieFromCoreData(unFavouritedMovie:Movie){
        //remove movie logic
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        let predicate = NSPredicate(format: "movieID== \(unFavouritedMovie.id)")
        fetchRequest.predicate = predicate
        let result = try? context.fetch(fetchRequest)
        let movieToDelete = result![0] as! NSManagedObject
        context.delete(movieToDelete)
        
        do {
            try context.save()
            movieDetailsPresenterDelegate?.notifyWithRemovingResult(succeeded: true)
            getMoviesFromCoreData()
            showMoviesFromCoreData()
            
        } catch {
            movieDetailsPresenterDelegate?.notifyWithRemovingResult(succeeded: false)
        }
    }
    func checkIfFavourite(movie: Movie) {
        var movieFound = false
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if data.value(forKey: "movieID") as! Int == movie.id{
                    movieFound=true
                }
            }
            movieDetailsPresenterDelegate?.respondToIfFavouriteCheck(favourite: movieFound)
            
        } catch {
            print("Failed")
        }
   
    }
}
