//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Thiago Saraiva on 13/08/2018.
//  Copyright © 2018 ThiagoSaraiva. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var collectionData = ["Janeiro", "Fevereiro", "Marco", "Abril", "maio", "Junho",
                          "Julho", "Agosto", "Setembro","Outubro", "Novembro", "Dezembro"]
    
    @objc func refresh(){
        addItem()
        collectionView.refreshControl?.endRefreshing()
    }
    
    @IBAction func addItem(){
        collectionData.append("New Word")
        collectionView.insertItems(at: [IndexPath(row: collectionData.count-1, section: 0)])
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var addButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure PULL-TO-REFRESH in CollectionView
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        collectionView.refreshControl  = refreshControl
        
        self.title = "Meses"
        let width = (view.frame.size.width-20)/3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue"{
            if let dest = segue.destination as? DetailViewController,
                let index = sender as? IndexPath{
                dest.selection = collectionData[index.item]
            }
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addButton.isEnabled = !editing
        
        collectionView.allowsMultipleSelection = editing
        
        for index in collectionView.indexPathsForVisibleItems{
            let cell = collectionView.cellForItem(at: index) as? CollectionViewCell
            cell?.isEditting = editing
            //TODO: test if it works            cell?.isEditting = isEditing
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.cellTitle.text = collectionData[indexPath.row]
        cell.isEditting = isEditing
        return cell
    }
}

extension MainViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing{
            performSegue(withIdentifier: "DetailsSegue", sender: indexPath)
        }
    }
}

