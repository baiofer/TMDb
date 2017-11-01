//
//  PosterStripCell.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit
import RxSwift

final class PosterStripCell: UICollectionViewCell, ReusableView, NibLoadableView {
	// MARK: - Outlets

	@IBOutlet var posterView: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var metadataLabel: UILabel!

	// MARK: - Properties

	private(set) var disposeBag = DisposeBag()

	// MARK: - Overrides

	override func prepareForReuse() {
		super.prepareForReuse()
        posterView.image = nil
		disposeBag = DisposeBag()
	}
}
