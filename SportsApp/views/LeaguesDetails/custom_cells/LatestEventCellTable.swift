//
//  LatestEventCellTable.swift
//  SportsApp
//
//  Created by Rain Moustfa on 05/05/2022.
//

import Foundation
import UIKit
class LatestEventCellTable :UITableViewCell{
    static let identifier = "LatestEventCellTable"
    private let collectionView:UICollectionView
    public var models = [Team]()
    public var navigateToTeamDetails : ((Team)->()) = {team in }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 170)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(TeamCellCollection.self, forCellWithReuseIdentifier: TeamCellCollection.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
    public func configure(with models:[Team]){
        self.models = models
        collectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LatestEventCellTable: UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCellCollection.identifier, for: indexPath) as! TeamCellCollection
        cell.configure(with: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let item = collectionView.cellForItem(at: indexPath)
        navigateToTeamDetails(Team(idTeam: "1233", strTeam: "12344", strTeamBadge: "45667", strStadiumThumb: "skdjfh"))
    }
}
