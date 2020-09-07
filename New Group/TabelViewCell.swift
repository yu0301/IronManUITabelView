//
//  TabelViewCell.swift
//  IronManUITabelView
//
//  Created by 陳冠諭 on 2020/9/7.
//  Copyright © 2020 KuanYu. All rights reserved.
//

import UIKit

class TabelViewCell: ViewController,UITableViewDataSource {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //cell顯示的內容
        cell.textLabel?.text = animals[indexPath.section]
        cell.layer.borderWidth = 5
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        cell.layer.cornerRadius = 15
        
        //圈圈的設定(位置？)
        let littleCircle = UIView(frame: CGRect(x: tableView.center.x / 14 , y: tableView.center.y / 12 , width: 22, height: 22))
        littleCircle.layer.cornerRadius = 11
        
        //這邊給傳入使用者選的顏色
        littleCircle.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.6, blue: 0.7882352941, alpha: 1)
        cell.addSubview(littleCircle)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
