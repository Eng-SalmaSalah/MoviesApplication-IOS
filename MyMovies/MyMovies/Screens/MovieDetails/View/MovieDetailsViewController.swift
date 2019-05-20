//
//  MovieDetailsViewController.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
    
    var selectedMovie:Movie!
    
    @IBOutlet weak var MovieNameLabel: UILabel!
    
    @IBOutlet weak var MoviePosterImage: UIImageView!
    
   
    @IBOutlet weak var MovieOverviewLabel: UILabel!
    
    @IBOutlet weak var MovieReleaseDateLabel: UILabel!
    
    @IBOutlet weak var MovieVoteAverageLabel: UILabel!
    
    var MoviePresenter:MovieDetailsPresenter=MovieDetailsPresenter()
    var TrailerList=[Trailer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MovieNameLabel.text=selectedMovie?.originalTitle
        let voteAverage = selectedMovie.voteAverage
        MovieVoteAverageLabel.text=String(voteAverage)
        MovieReleaseDateLabel.text=selectedMovie.releaseDate
        MovieOverviewLabel.text=selectedMovie.overview
        
        MoviePresenter.setDelegate(MovieDetailsDelegate: self)
        
        let imageURL = "https://image.tmdb.org/t/p/w185"+selectedMovie.posterPath
        MoviePosterImage.sd_setImage(with: URL(string:imageURL ), placeholderImage: UIImage(named: "placeholder.png"))
        getMovieList(MovieId: String(selectedMovie.id))   //get Trailers using MovieId
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FavouriteBtn(_ sender: UIButton) {
        print("Favourite")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
