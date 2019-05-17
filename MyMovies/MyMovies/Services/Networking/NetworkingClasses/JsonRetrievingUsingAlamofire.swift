//
//  JsonRetrievingUsingAlamofire.swift
//  MyMovies
//
//  Created by Salma on 5/16/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class JsonRetrievingUsingAlamofire:JsonRetrievingUsingAlamofireDelegate {

    var movieList = [Movie]()
    var homePresenter : HomePresenter
    
    
    init(homePresneter:HomePresenter){
        self.homePresenter = homePresneter
    }
    
    func getMovies(){
        let url = URL(string :"https://api.themoviedb.org/3/discover/movie?sort_by=highest-rated.desc&api_key=b3bc361fb3fda11be0977ea63bbfc10f")
        Alamofire.request(url!).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let value):
                let json = JSON(value)
                if let result = json["results"].array{
                    for item in result{
                        let movie = Movie(id: item["id"].intValue,title: item["title"].stringValue, posterPath: item["poster_path"].stringValue, originalTitle: item["original_title"].stringValue, overview: item["overview"].stringValue, releaseData: item["release_date"].stringValue)
                        self.movieList.append(movie)
                    }
                    self.sendMoviesToPresenter(movieList: self.movieList)
                }
                else{
                    print ("error")
                }
            }
        }
    }
    func sendMoviesToPresenter(movieList:[Movie]) {
        homePresenter.sendMoviesToView(movieList: movieList)
    }
    
}
