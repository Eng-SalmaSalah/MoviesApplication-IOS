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
    var storedAsFavourite = false
    var selectedAsFavourite = false
    var removedFromFavourites = false
    @IBOutlet weak var trailersLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var reviewsTableview: UITableView!
    @IBOutlet weak var trailersTableview: UITableView!
    @IBOutlet weak var MovieNameLabel: UILabel!
    
    @IBOutlet weak var MoviePosterImage: UIImageView!
    
    @IBOutlet weak var favBtnOutlet: UIButton!
    
    @IBOutlet weak var MovieOverviewLabel: UILabel!
    
    @IBOutlet weak var MovieReleaseDateLabel: UILabel!
    
    @IBOutlet weak var MovieVoteAverageLabel: UILabel!
    
    var moviePresenterDelegate:MovieDetailsPresenterDelegate=MovieDetailsPresenter()
    
    
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
        
        moviePresenterDelegate.setDelegate(movieDetailsDelegate: self)
        let imageURL = "https://image.tmdb.org/t/p/w185"+selectedMovie.posterPath
        MoviePosterImage.sd_setImage(with: URL(string:imageURL ), placeholderImage: UIImage(named: "placeholder.png"))
        getMovieList(MovieId: String(selectedMovie.id))   //get Trailers using MovieId
        getReviewList(MovieId: String(selectedMovie.id))
        // we need to check if movie exists in coredata as favourite
        checkIfFavourite(movie: selectedMovie) // this sets the value of selected as favourite
        if selectedAsFavourite{
            favBtnOutlet.setImage(#imageLiteral(resourceName: "clickedFavourite"), for: UIControlState.normal)
        }
        else{
            favBtnOutlet.setImage(#imageLiteral(resourceName: "Favourite"), for: UIControlState.normal)
        }

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FavouriteBtn(_ sender: UIButton) {
        if(!selectedAsFavourite){
            //add movie to favourites
            addMovieToFavourites()
            if storedAsFavourite
            {
                sender.setImage(#imageLiteral(resourceName: "clickedFavourite"), for: UIControlState.normal)
                selectedAsFavourite = true
            }
            else {
                showAlert(type: "failedToStore")
            }
        }else{
            //remove movie from favourites
            removeMovieFromFavourites()
            if removedFromFavourites
            {
                sender.setImage(#imageLiteral(resourceName: "Favourite"), for: UIControlState.normal)
                selectedAsFavourite = false
            }
            else{
                showAlert(type: "failedToRemove")
            }
        }
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
            
            cell = trailersTableview.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            
            (cell as! MovieTableViewCell).trailerNameLabel.text=TrailerList[indexPath.row].name
            
            let imageURL = "http://img.youtube.com/vi/\(TrailerList[indexPath.row].id)/maxresdefault.jpg"

            (cell as! MovieTableViewCell).trailerImageView.sd_setImage(with: URL(string:imageURL ), placeholderImage: UIImage(named: "youtube.png"))
            
              //(cell as! MovieTableViewCell).trailerImageView
        
        }else if tableView==reviewsTableview
        {
            cell=reviewsTableview.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            cell?.textLabel?.text=ReviewList[indexPath.row]
            cell?.textLabel?.textColor=UIColor.white
            cell?.textLabel?.font=UIFont(name: "Helvetica", size:  17)
            cell?.textLabel?.numberOfLines=0
            cell?.textLabel?.lineBreakMode = .byWordWrapping
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView==trailersTableview){
            return UITableViewAutomaticDimension
        }
    else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if (tableView==trailersTableview){
        //go to youtube Trailer Link
         let customURL = URL(string :"https://www.youtube.com/watch?v="+TrailerList[indexPath.row].id)!
        if UIApplication.shared.canOpenURL(customURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL)
            } else {
                UIApplication.shared.openURL(customURL)
            }
           
            }
            //        else{  //unable to open the link
            //            print("unable to open the link")
            //        {
        }
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
