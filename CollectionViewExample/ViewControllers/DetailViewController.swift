//
//  DetailViewController.swift
//  CollectionViewExample
//
//  Created by Thiago Saraiva on 14/08/2018.
//  Copyright © 2018 ThiagoSaraiva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selection: String!
    
    @IBOutlet private weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = selection
        self.title = selection.capitalized(with: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
