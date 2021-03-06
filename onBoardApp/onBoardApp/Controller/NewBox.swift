import UIKit

class NewBox: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let flow = CustomFlowLayout()
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //TODO: Set the datasource & delegate
        collectionView.dataSource = self as? UICollectionViewDataSource
        collectionView.delegate = self as? UICollectionViewDelegate
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //TODO: Register the cell
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    var data: [ServicesModel] =  [ServicesModel(image: UIImage(named: "helping_hand")!, title: "Treats" ),ServicesModel(image: UIImage(named: "meds")!, title: "Food" ),ServicesModel(image: UIImage(named: "dogtoy")!, title: "Bath" ),ServicesModel(image: UIImage(named: "dogbrush")!, title: "Shower" ),ServicesModel(image: UIImage(named: "petFood")!, title: "Run" ),]
    
    override func loadView() {
        super.loadView()
       
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))
    }
    
    
    @objc func showOptions(controller: UIViewController) {
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
//            self.collectionView.performBatchUpdates({
////                self.data[3] = "😦"
//                let updated = self.data[3]
//                self.data.remove(at: 3)
//                self.data.insert(updated, at: 0)
//
//                self.collectionView.deleteItems(at: [IndexPath(item: 3, section: 0)])
//                self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
//
//            }, completion: nil)
//
//        }))
        
        alert.addAction(UIAlertAction(title: "Insert card at the beginning", style: .default, handler: { (_) in
            self.data.insert( ServicesModel(image: UIImage(named: "helping_hand")!, title: "Food"), at: 0)
                   self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
        }))
        

//        alert.addAction(UIAlertAction(title: "Update item at 5 with an emoji", style: .default, handler: { (_) in
//        }))
//
//        alert.addAction(UIAlertAction(title: "Delete first 2 items, insert 3 items at the end", style: .default, handler: { (_) in
//        }))
//
//        alert.addAction(UIAlertAction(title: "Delete first 3, insert 1 item at the beginning", style: .default, handler: { (_) in
//        }))
//
//        alert.addAction(UIAlertAction(title: "Delete first 3 items, insert 1 item at end", style: .default, handler: { (_) in
//        }))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.data = [ServicesModel(image: UIImage(named: "helping_hand")!, title: "Treats" ),ServicesModel(image: UIImage(named: "meds")!, title: "Food" ),ServicesModel(image: UIImage(named: "dogtoy")!, title: "Bath" ),ServicesModel(image: UIImage(named: "dogbrush")!, title: "Shower" ),ServicesModel(image: UIImage(named: "petFood")!, title: "Run" ),]
            self.collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
}


extension NewBox: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
//        let data = self.data[indexPath.item]
        cell.itemButton.tag = indexPath.row
        cell.itemButton.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
        cell.itemButton.setImage(data[indexPath.item].image, for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let padding: CGFloat =  50
          let collectionViewSize = collectionView.frame.size.width - padding

          return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
      }
    
    
    
    @objc func subscribeTapped(_ sender: UIButton){
        let data = self.data[0]
      let alert = UIAlertController(title: "Subscribed!", message: "Subscribed to \(data)", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(okAction)
            
      self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
