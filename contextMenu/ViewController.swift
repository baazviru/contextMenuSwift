//
//  ViewController.swift
//  contextMenu
//
//  Created by mac on 03/01/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIContextMenuInteractionDelegate {
    
    @IBOutlet weak var myCollectionView:UICollectionView!
    @IBOutlet weak var myTableView:UITableView!
    
    @IBOutlet weak var myView :UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let Interaction = UIContextMenuInteraction.init(delegate: self)
        self.myView.addInteraction(Interaction)
        
    }
    
    
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        configureMenu()
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3-15, height: collectionView.frame.size.width/3-15)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureMenu()
    }
    
    
    
    func  configureMenu() -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (actions) -> UIMenu? in
            
            
            let Play = UIAction(title: "Play",image: UIImage(systemName: "play.circle.fill")) { (cop) in
                
            }
            let Add = UIAction(title: "Add to Play List",image: UIImage(systemName: "list.dash")) { (cop) in
                
            }
            let favorite = UIAction(title: "Add to favorite",image: UIImage(systemName: "heart.circle.fill")) { (cop) in
                
            }
            
            let Delete = UIAction(title: "Delete",image: UIImage(systemName: "trash.circle.fill"),attributes: .destructive) { (cop) in
                
            }
            
            return UIMenu(title: "", children: [Play,Add,favorite,Delete])
        }
        return context
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        configureMenu()
    }
    
    
    
    
    
}
