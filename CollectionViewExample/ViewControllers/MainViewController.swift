//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Thiago Saraiva on 13/08/2018.
//  Copyright © 2018 ThiagoSaraiva. All rights reserved.
//

import UIKit

var collectionData = ["Janeiro", "Fevereiro", "Marco", "Abril", "maio", "Junho",
                      "Julho", "Agosto", "Setembro","Outubro", "Novembro", "Dezembro"]

class MainViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meses"
        let width = (view.frame.size.width-20)/3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            if let dest = segue.destination as? DetailViewController,
                let firstSelectedIndex = collectionView.indexPathsForSelectedItems?.first{
                dest.selection = collectionData[firstSelectedIndex.row]
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel{
            label.text = collectionData[indexPath.row]
        }
        return cell
    }
}

extension MainViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item: \(collectionData[indexPath.row])")
    }
}

