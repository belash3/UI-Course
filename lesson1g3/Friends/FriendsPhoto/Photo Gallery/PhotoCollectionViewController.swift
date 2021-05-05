//
//  PhotoCollectionViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 15.04.2021.
//

import UIKit

private let reuseIdentifier = "Cell"
let friendsPhotoCollectionViewCellReuse = "FriendsPhotoCollectionViewCell"

class PhotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    var photoArray = [UIImage] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "FriendsPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: friendsPhotoCollectionViewCellReuse)
        guard let _ = user,
              let array = user?.userPhotoGallery else {return}
        photoArray = array
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendsPhotoCollectionViewCellReuse, for: indexPath) as? FriendsPhotoCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(image: photoArray[indexPath.item])
        return cell
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
