
import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var personTableView: UITableView!
    var personss = [Person]()
    var geos = [Geo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personTableView.delegate = self
        personTableView.dataSource = self
        
        getData(with: "/users")
    }
    func getData(with endPoint:String){
          let baseURL = "https://jsonplaceholder.typicode.com"
          if let url = URL(string: baseURL + endPoint){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
              if let error = error {
                print("ERROR", error.localizedDescription)
              } else {
                if let safeData = data {
                  do {
                    let decoder = JSONDecoder()
                      self.personss = try decoder.decode([Person].self, from: safeData)
                    print("DECODED DATA", self.personss)
                    for element in self.personss {
                      print(element.email)
                    }
                    DispatchQueue.main.sync {
                      self.personTableView.reloadData()
                    }
                  } catch {
                    print("SOMTHING WENT WRRONG!", error.localizedDescription)
                  }
                }
              }
            }
            task.resume()
          }
        }
      }
    extension ViewController:UITableViewDelegate,UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return personss.count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell
         
         cell.idPersonLabel.text = "\(personss[indexPath.row].id)"
      //   cell.idPersonLabel = String (aaa[indexPath.row].id)
       cell.namePersonLable.text = personss[indexPath.row].name
       cell.userNamePersonLabel.text = personss[indexPath.row].username
         cell.emailPersonLabel.text = "\(personss[indexPath.row].email)"
         cell.phonePersonLabel.text = "\(personss[indexPath.row].phone)"
         cell.websitePersonLabel.text = "\(personss[indexPath.row].website)"
         cell.addressPersonLabel.text = "\(personss[indexPath.row].address)"
       cell.companylabel.text = "\(personss[indexPath.row].company)"

       return cell
     }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 250
     }
    }



