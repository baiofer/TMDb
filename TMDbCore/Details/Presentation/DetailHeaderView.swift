//
//  DetailHeaderView.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit
import RxSwift

final class DetailHeaderView: UIView, NibLoadableView {
	private enum Constants {
		static let height: CGFloat = 280
	}

	// MARK: - Outlets

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var metadataLabel: UILabel!
	@IBOutlet var posterView: UIImageView!
	@IBOutlet var backdropView: UIImageView!

	// MARK: - Properties

	let disposeBag = DisposeBag()

	// MARK: - Overrides

	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
	}
}
