//
//  ContactsViewModel.swift
//  Hw4
//
//  Created by Damir Nabiullin on 15.10.2023.
//

import UIKit

enum Section {
    case main
}

class ContactsViewModel: NSObject {
    typealias Item = ContactInformation
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    
    private weak var collectionView: UICollectionView?
    
    public var items: [Item] = []
    
    private var dataSource: DataSource?
    private var cellIdentifier: String
    
    init(collectionView: UICollectionView) {
        self.cellIdentifier = "ContactCell"
        self.collectionView = collectionView
        
        collectionView.register(ContactCollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        super.init()
    }
    
    private func update() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot)
    }
    
    public func add(_ items: [Item]) {
        items.forEach {
            self.items.append($0)
        }
        
        update()
    }
    
    public func remove(_ items: [Item]) {
        items.forEach { item in
            self.items.removeAll { $0 == item }
        }
        
        update()
    }
}

extension ContactsViewModel {
    private func cellProvider(_ collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ContactCollectionViewCell
        cell.configure(item)
        return cell
    }
    
    public func makeDataSource() -> DataSource {
        guard let collectionView = collectionView else { fatalError() }
        let dataSource = DataSource(collectionView: collectionView, cellProvider: cellProvider)
        self.dataSource = dataSource
        return dataSource
    }
}
