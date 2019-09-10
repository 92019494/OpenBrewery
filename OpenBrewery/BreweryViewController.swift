//
//  BreweryViewController.swift
//  OpenBrewery
//
//  Created by Anthony on 9/09/19.
//  Copyright © 2019 EmeraldApps. All rights reserved.
//

import UIKit

class BreweryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var breweryListTableView: UITableView!
    var breweries = [Brewery]()

    // initializing loading view variables
    var loadingView = UIView()
    var loadingLabel = UILabel()
    var loadingIcon = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding loading view until api call is finished
        setUpLoadingView()
        
        
        // revealing navigation tab
        navigationController?.navigationBar.isHidden = false
        
        // changing background color and applying gradient
        self.view.backgroundColor = UIColor.clear
        let layer = CAGradientLayer()
        self.view.applyGradient(layer: layer, colorOne: UIColor(red: 72/255, green: 126/255, blue: 220/255, alpha: 1), colorTwo: UIColor(red: 172/255, green: 182/255, blue: 229/255, alpha: 1))
        
        // making API call
        fetchBreweriesJSON { (res) in
            switch res {
            case .success(let breweriesList):
                self.breweries = [Brewery]()
                breweriesList.forEach({ (brewery) in
                    self.breweries.append(Brewery(name: brewery.name, street: brewery.street, city: brewery.city, state: brewery.state, country: brewery.country, phone: brewery.phone, website_url: brewery.website_url))
                })
                DispatchQueue.main.async {
                    self.hideLoadingView()
                    self.breweryListTableView.reloadData()
                }
            case .failure(let err):
                print("Failed to fetch breweries: " , err)
            }
        }
    }
    
    // MARK: - Loading View
    func setUpLoadingView() {
        loadingView.addSubview(loadingLabel)
        loadingView.addSubview(loadingIcon)
        view.addSubview(loadingView)
        
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.backgroundColor = UIColor.white
        loadingView.layer.cornerRadius = 15
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        loadingLabel.topAnchor.constraint(equalTo: loadingView.topAnchor, constant: 20).isActive = true
        loadingLabel.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: -20).isActive = true
        loadingLabel.leftAnchor.constraint(equalTo: loadingView.leftAnchor, constant: 80).isActive = true
        loadingLabel.rightAnchor.constraint(equalTo: loadingView.rightAnchor, constant: -20).isActive = true
        loadingLabel.backgroundColor = UIColor.blue
        loadingLabel.numberOfLines = 2
        loadingLabel.text = "Loading breweries..."
        loadingLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        loadingLabel.backgroundColor = UIColor.clear
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIcon.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        loadingIcon.rightAnchor.constraint(equalTo: loadingLabel.leftAnchor, constant: -20).isActive = true
        loadingIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loadingIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        loadingIcon.startAnimating()
        loadingIcon.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func hideLoadingView(){
        self.loadingView.isHidden = true
        self.loadingIcon.stopAnimating()
    }
    
    // MARK: - API CALL function
    fileprivate func fetchBreweriesJSON(completion: @escaping (Result<[Brewery], Error>) -> ()){
        
        let urlString = "https://api.openbrewerydb.org/breweries"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            // successful
            do {
                let breweries = try JSONDecoder().decode([Brewery].self, from: data!)
                completion(.success(breweries))
            }
            
            catch let jsonError {
                completion(.failure(jsonError))
                
            }
        }.resume()
    }
    
     // MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breweryCell", for: indexPath) as!
        BreweryTableViewCell
        
        cell.nameLabel.text = breweries[indexPath.row].name
        cell.streetLabel.text = breweries[indexPath.row].street
        cell.cityLabel.text = breweries[indexPath.row].city
        cell.stateLabel.text = breweries[indexPath.row].state
        cell.countryLabel.text = breweries[indexPath.row].country
        if breweries[indexPath.row].phone == "" {
            cell.phoneNumberLabel.text = "Sorry, there is no phone number for this brewery"
        } else {
            cell.phoneNumberLabel.text = breweries[indexPath.row].phone
        }
        cell.websiteLabel.text = breweries[indexPath.row].website_url
        cell.cellView.layer.cornerRadius = 15
    
        
        return cell
 
    }
    
}

// MARK: UIView extension
extension UIView {
    
    func applyGradient(layer: CAGradientLayer, colorOne: UIColor, colorTwo:UIColor){

        layer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        layer.colors = [colorOne.cgColor, colorTwo.cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.locations = [0,1]
        self.layer.insertSublayer(layer, at: 0)
    }
}
