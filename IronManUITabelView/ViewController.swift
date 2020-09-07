//
//  ViewController.swift
//  IronManUITabelView
//
//  Created by 陳冠諭 on 2020/9/6.
//  Copyright © 2020 KuanYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animals = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    var tableView = UITableView()
    var baseView = UIView()
    
    //tableview底下的圓框
    func setBaseView(){
        baseView.frame = CGRect(x: 50 , y: 50, width: 300, height: 405)
        baseView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        baseView.layer.borderWidth = 2
        baseView.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        baseView.layer.cornerRadius = 15
        self.view.addSubview(baseView)
        
    }
    
    //設定tableView，高度固定or隨添加的cell改變?
    func setTableView(){
        tableView.frame = CGRect(x: 60 , y: 60, width: 280, height: 400)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        //可以用來控制cell的高度
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseView()
        setTableView()
        //call class cell
    }
}


//另外寫兩個extension

extension ViewController: UITableViewDelegate{
    
    //row數量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return 1
    }
}

extension ViewController: UITableViewDataSource{
    
    
    //section數量
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.animals.count
    }
    
    //設定header高度(這邊為cell之間的距離)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 5
        return cellSpacingHeight
    }
    
    
    //設定header，功能為讓header變白色，產生間距的視覺效果
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    接收cell顯示的資料(ratasource)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    //控制字體的位置
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(cell.responds(to: #selector(setter: UITableViewCell.separatorInset))){
            cell.separatorInset = .init(top: 10, left: 40, bottom: 10, right: 10)
        }
        //        if(cell.responds(to: #selector(setter: UITableViewCell.layoutMargins))){
        //
        //            cell.layoutMargins = .init(top: 10, left: 100, bottom: 10, right: 10)
        //        }
    }
    
}


//1.產生tableview，並且可以調整尺寸
//2.tableview圓角
//3.產生cell
//4.cell圓角b
//5.cell要有顏色
//6.cell裡面有圈圈
//7.圈圈顏色要可以變，所以要讓client端可以改
//8.auto layout
//cell左右的空格怎處理？ 使用border會破壞圓框效果  tableview底層再放一張view 或是 cell放view?
//如果只使用tableview的話會跑出多餘的位置，
