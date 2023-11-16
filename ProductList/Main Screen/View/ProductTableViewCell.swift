//
//  ProductTableViewCell.swift
//  ProductList
//
//  Created by Christian Badillo on 11.11.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class ProductTableViewCell: UITableViewCell {
    // MARK: - UI
    private let marcaNombreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    private let anioPrecioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Viewlifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        productImageView.image = nil
        marcaNombreLabel.text = nil
        anioPrecioLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - SetupView
    
    private func setupViews() {

        contentView.addSubview(productImageView)
        contentView.addSubview(marcaNombreLabel)
        contentView.addSubview(anioPrecioLabel)
        
        
    }
    // MARK: - SetupConstraints

    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.size.equalTo(90)
            make.leading.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        marcaNombreLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            make.top.equalTo(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        anioPrecioLabel.snp.makeConstraints { make in
            make.top.equalTo(marcaNombreLabel.snp.bottom).offset(5)
            make.leading.equalTo(marcaNombreLabel.snp.leading)
        }
        

    }
    
    // MARK: Public
    
    public func configureCell(marca: String, nombre: String, anio: String, precio: String, imageUrl: URL) {
        productImageView.kf.setImage(with: imageUrl)
        marcaNombreLabel.text = "marca: " + marca + ", nombre: " +  nombre
        anioPrecioLabel.text = "año: " + anio + ", precio: $" + precio
    }

}
