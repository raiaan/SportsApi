//
//  ViewController.swift
//  SportsApp
//
//  Created by Rain Moustfa on 29/04/2022.
//

import UIKit
import SDWebImage
import Alamofire

class AllSportsViewController: UIViewController {
    @IBOutlet weak var allSportsCollectionView: UICollectionView!
    var allSportsData: [MySport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fatchDataFromAPI(){ (data, error) in
            if let error = error {
                print("a")
                print(error.localizedDescription)
            } else {
                self.allSportsData = data!.sports
                DispatchQueue.main.async {
                    self.allSportsCollectionView.reloadData()
                }
            }
        }

    }

    
    func fatchDataFromAPI(completionHandler: @escaping (AllSports?, Error?) -> Void){
        AF.request(Constants.getAllSportsURL).responseDecodable(of: AllSports.self)  { (response) in
           // print(response.value?.sports[0])
            switch response.result {
            case let .success(data):
                // success
            //    print(data.sports[0])
                completionHandler(data, nil)
            case let .failure(error):
                // error
                completionHandler(nil, error)
            }
        }
    }
    
    
    
    
    
    
    
}

extension AllSportsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allSportsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allSportsCell", for: indexPath) as! AllSportsCollectionViewCell
        
        cell.sportName.text = allSportsData[indexPath.row].strSport
        cell.allSportImageView.sd_setImage(with: URL(string: allSportsData[indexPath.row].strSportThumb))
        cell.allSportImageView.layer.cornerRadius = 25
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (allSportsCollectionView.frame.size.width - space) / 2.0
            return CGSize(width: size, height: size)
        }
    
}
