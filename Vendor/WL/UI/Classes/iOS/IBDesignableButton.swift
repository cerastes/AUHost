/// File: IBDesignableButton.swift
/// Project: WLUI
/// Author: Created by Vlad Gorlov on 12.03.15.
/// Copyright: Copyright (c) 2015 WaveLabs. All rights reserved.

import UIKit

@IBDesignable
public class IBDesignableButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		#if !TARGET_INTERFACE_BUILDER
			initializeView()
		#endif
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	public override func awakeFromNib() {
		super.awakeFromNib()
		initializeView()
	}

	public override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		initializeView()
	}

	/// Called after all KVC properties are settled.
	public func initializeView() {
		// Do something
	}

}
