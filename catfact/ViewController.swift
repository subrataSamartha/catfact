//
//  ViewController.swift
//  catfact
//
//  Created by subrata Samartha on 25/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factDisplayLabel: UILabel!
    @IBOutlet weak var resfreshBtn: UIButton!
    @IBOutlet weak var addToFavButton: UIButton!
    //    var favFactArrat: [String] = []
    var factOnScreen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkManager.shared.getCatFact { [self] factData, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                return
            }
            
            guard let fact = factData else {
                print("No data")
                return
            }
            factOnScreen = fact.fact
            DispatchQueue.main.async {
                self.factDisplayLabel.text=fact.fact
            }
            
        }
    }
    
    
    @IBAction func refreshFactButton(_ sender: Any) {
        NetworkManager.shared.getCatFact { [self] factData, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                return
            }
            
            guard let fact = factData else {
                print("No data")
                return
            }
            
            factOnScreen = fact.fact
            DispatchQueue.main.async {
                self.factDisplayLabel.text=fact.fact
                
            }
            
            
        }
    }
    
    
    @IBAction func addToFavorite(_ sender: Any) {
        UserData.shared.addFactToUserData(factOnScreen: factOnScreen)
        showToastMsg(message: "Added to Favorite", font: .systemFont(ofSize: 12.0))
    }
    
    @IBAction func showFavList(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let favListVC = Storyboard.instantiateViewController(withIdentifier: "favListViewController")
        self.present(favListVC, animated: true)
    }
    
    

}

