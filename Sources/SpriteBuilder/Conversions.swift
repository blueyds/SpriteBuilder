//
//  Conversions.swift
//  spritekit builder demo
//
//  Created by Craig Nunemaker on 11/27/23.
//

import GameColor

import UIKit.UIColor

extension GameColor {
	
	public var skColor: UIColor {
		UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
	}

}

