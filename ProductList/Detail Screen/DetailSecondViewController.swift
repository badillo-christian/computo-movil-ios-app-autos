//
//  DetailSecondViewController.swift
//  ProductList
//
//  Created by Christian Badillo on 11.11.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailSecondViewController: UIViewController {
    
    // MARK: - State
    private var detailProduct: Product
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    private lazy var marcaLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.text = "Marca: \(detailProduct.marca)"
        title.textAlignment = .left
        return title
    }()
    
    private lazy var nombreLabel: UILabel = {
        let productDescription = UILabel()
        productDescription.textColor = .black
        productDescription.numberOfLines = 0
        productDescription.text = "Nombre: \(detailProduct.nombre)"
        return productDescription
    }()
    
    private lazy var anioLabel: UILabel = {
        let price = UILabel()
        price.textColor = .black
        price.text = "Año: \(detailProduct.anio) "
        return price
    }()
    
    private lazy var precioLabel: UILabel = {
        let category = UILabel()
        category.textColor = .black
        category.text = "Precio: $ \(detailProduct.precio) "
        return category
    }()
    
    private lazy var kmLabel: UILabel = {
        let brand = UILabel()
        brand.textColor = .black
        brand.text = "Kilometraje: \(detailProduct.km)"
        return brand
    }()
    
    private lazy var motorLabel: UILabel = {
        let motor = UILabel()
        motor.textColor = .black
        motor.text = "Motor: \(detailProduct.motor)"
        return motor
    }()
    
    private lazy var garantiaLabel: UILabel = {
        let garantia = UILabel()
        garantia.textColor = .black
        garantia.text = "Garantia: \(detailProduct.garantia)"
        return garantia
    }()
    // MARK: - Init
    init(detailProduct: Product) {
        self.detailProduct = detailProduct
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

        setupViews()
        setupConstraints()
        
        
    }
    
    // MARK: - Setup Navigation bar
    
    private func setupNavigationBar() {
        title = detailProduct.nombre
        edgesForExtendedLayout = []
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(marcaLabel)
        view.addSubview(nombreLabel)
        view.addSubview(anioLabel)
        view.addSubview(precioLabel)
        view.addSubview(kmLabel)
        view.addSubview(motorLabel)
        view.addSubview(garantiaLabel)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(340)
        }
        
        marcaLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        nombreLabel.snp.makeConstraints { make in
            make.top.equalTo(marcaLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        anioLabel.snp.makeConstraints { make in
            make.top.equalTo(nombreLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nombreLabel)
        }
        
        precioLabel.snp.makeConstraints { make in
            make.top.equalTo(anioLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nombreLabel)
        }
        
        kmLabel.snp.makeConstraints { make in
            make.top.equalTo(precioLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nombreLabel)
        }
        
        motorLabel.snp.makeConstraints { make in
            make.top.equalTo(kmLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nombreLabel)
        }
        
        garantiaLabel.snp.makeConstraints { make in
            make.top.equalTo(motorLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nombreLabel)
        }    }
}

// MARK: Extensions UICollectionViewDelegate, UICollectionViewDataSource

extension DetailSecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailProduct.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ImageCollectionViewCell
        let imageUrl = detailProduct.images[indexPath.item]
        let url = URL(string: imageUrl)!
        cell.configure(url: url)
        return cell
    }
}
