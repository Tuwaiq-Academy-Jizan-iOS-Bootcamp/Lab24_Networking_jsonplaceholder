//
//  PersonCell.swift
//  HamadHarisi_Lab24_Networking_jsonplaceholder
//
//  Created by حمد الحريصي on 10/12/2021.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var personTableView: UITableView!
    var person = [Person]()
    var geos = [Geo]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        personTableView.delegate = self
        personTableView.dataSource = self
        getData(with: "/users")
    }
    func getData(with endPoint:String)
    {
          let baseURL = "https://jsonplaceholder.typicode.com"
          if let url = URL(string: baseURL + endPoint)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url)
              { data, response, error in
              if let error = error
                  {
                print("ERROR", error.localizedDescription)
            }
            else
            {
                if let safeData = data
                {
                  do
                  {
                    let decoder = JSONDecoder()
                      self.person = try decoder.decode([Person].self, from: safeData)
                    print("DECODED DATA", self.person)
                    for element in self.person
                    {
                    print(element.email)
                    }
                    DispatchQueue.main.sync
                    {
                    self.personTableView.reloadData()
                    }
                    }
                    catch
                    {
                    print("SOMTHING WENT WRRONG!", error.localizedDescription)
                  }
                }
              }
            }
            task.resume()
          }
        }
      }
    extension ViewController:UITableViewDelegate,UITableViewDataSource
{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
       return person.count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
       let cell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell
         
         cell.idLabel.text = "\(person[indexPath.row].id)"
        cell.nameLable.text = person[indexPath.row].name
        cell.userNameLabel.text = person[indexPath.row].username
         cell.emailLabel.text = "\(person[indexPath.row].email)"
         cell.phoneLabel.text = "\(person[indexPath.row].phone)"
         cell.websiteLabel.text = "\(person[indexPath.row].website)"
         cell.addressLabel.text = "\(person[indexPath.row].address)"
       cell.companylabel.text = "\(person[indexPath.row].company)"

    return cell
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
    return 280
    }
    }
