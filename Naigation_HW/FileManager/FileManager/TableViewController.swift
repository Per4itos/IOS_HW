//
//  TableViewController.swift
//  FileManager
//
//  Created by Адхам Тангиров on 18.08.2023.
//

import UIKit

class TableViewController: UITableViewController  {
    
    var tableViewDelegate: SettingsViewController?
    
    var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    func checkList() {
        print("Путь:", path)
        print("Cодержимое дериктории:", content)
    }
    
    var content: [String] {
        
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func sortContent() -> [String] {
            
            if UserDefaults.standard.bool(forKey: "sortValues") {
                
                let sortedContent = content.sorted(by: {$0 < $1})
                return sortedContent
            } else {
                let nonSortedContent = content
                return nonSortedContent}
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkList()

    }

    
    @IBAction func imageAction(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sortContet = sortContent()

        cell.textLabel?.text = sortContet[indexPath.row]
        cell.detailTextLabel?.text = "File"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let sortContent = sortContent()
            let pathForDelete = path + "/" + sortContent[indexPath.row]
            try? FileManager.default.removeItem(atPath: pathForDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }

}

extension TableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
            
            let imageName = UUID().uuidString
            let imagePath = URL(fileURLWithPath: path).appendingPathComponent(imageName + ".jpg")
            print("Cсылка на дерикторию:", URL(fileURLWithPath: path))
            print("Ссылка на картинку:", imagePath)
            
            if let jpegData = image?.jpegData(compressionQuality: 1.0) {
                do {
                    try jpegData.write(to: imagePath)
                } catch {
                    let alert = UIAlertController(title: "Error of create", message: error.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(alertAction)
                    present(alert, animated: true)
                }
            }
            tableView.reloadData()
            picker.dismiss(animated: true, completion: nil)
    }
}