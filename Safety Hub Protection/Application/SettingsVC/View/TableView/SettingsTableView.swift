//
//  SettingsTableView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//

import UIKit

class SettingsTableView: UITableView {
    
    
    //MARK: - TransitionsClousers
    var tableViewTranstionClosure: ((SettingsOption) -> ())?

    //MARK: - Cunstructor
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup View
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        tableFooterView = UIView()
        separatorStyle = .none
        showsHorizontalScrollIndicator = false
        
        register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        delegate = self
        dataSource = self
    }
    

    
}

//MARK: - UITableViewDelegate
extension SettingsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let settingsOption = SettingsOption(rawValue: indexPath.row) else { return }
        
        self.tableViewTranstionClosure?(settingsOption)
    }
    
    
}


//MARK: - UITableViewDataSource
extension SettingsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        
        let option = SettingsOption(rawValue: indexPath.row)
        cell.option = option

        return cell
    }
    
}

