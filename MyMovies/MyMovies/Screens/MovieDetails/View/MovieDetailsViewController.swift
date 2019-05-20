//
//  MovieDetailsViewController.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var selectedMovie:Movie!
    
    @IBOutlet weak var reviewsTableview: UITableView!
    @IBOutlet weak var trailersTableview: UITableView!
    @IBOutlet weak var MovieNameLabel: UILabel!
    
    @IBOutlet weak var MoviePosterImage: UIImageView!
    
   
    @IBOutlet weak var MovieOverviewLabel: UILabel!
    
    @IBOutlet weak var MovieReleaseDateLabel: UILabel!
    
    @IBOutlet weak var MovieVoteAverageLabel: UILabel!
    
    var MoviePresenter:MovieDetailsPresenter=MovieDetailsPresenter()
    var TrailerList=[Trailer]()
     var ReviewList=[String]()
    
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
        getReviewList(MovieId: String(selectedMovie.id))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FavouriteBtn(_ sender: UIButton) {
        print("Favourite")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if(tableView==trailersTableview){
         return TrailerList.count
       }
       else{
            return ReviewList.count
        
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :UITableViewCell?
        if(tableView==trailersTableview){
            cell=trailersTableview.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! UITableViewCell
            (cell as! MovieTableViewCell).trailerNameLabel.text=TrailerList[indexPath.row].name
        }else if tableView==reviewsTableview
        {
            cell=reviewsTableview.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            cell?.textLabel?.text=ReviewList[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
