//
//  ViewController.swift
//  Simple TableView
//
//  Created by D7703_06 on 2018. 4. 30..
//  Copyright © 2018년 IceArrow. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var data = ["고양이","고슴도치","강아지"]
    var subdata = ["11","22","33"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    //sections 갯수 증가(복사)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //sections 의 제목 추가
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "1st Section"
        }
        else {
            return "2st Section"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        //셀 갯수 지정
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "RE"
        //임시 저장소 셍성
        let cell = myTable.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        cell.detailTextLabel?.text = subdata[indexPath.row]
        //date,subdate의 안에 있는 값을 텍스트에 출력
        let myImg = UIImage(named:"\(indexPath.row+1).jpeg")
        cell.imageView?.image = myImg
        //이미지출력
        return cell
    }
    //table view 클릭했을때 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let alert = UIAlertController(title:data[indexPath.row], message: subdata[indexPath.row], preferredStyle: .alert)
        let Action = UIAlertAction(title: "Section : \(indexPath.section) Row : \(indexPath.row)", style: .default)
        let noAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(Action)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
    //tableview의 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {return 100.0}
}

