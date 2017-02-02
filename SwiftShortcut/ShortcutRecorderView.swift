//
//  ShortcutView.swift
//  SwiftShortcut
//
//  Created by Shad Sharma on 12/28/16.
//  Copyright © 2016 Shad Sharma. All rights reserved.
//

import AppKit

class ShortcutRecorderView: NSView {
    let clearCancelWidth: CGFloat = 21

    var enabled = true
    var cell: NSButtonCell!
    var shortcutFrame: NSRect!
    var clearCancelFrame: NSRect!
    
    var recording = false {
        didSet {
            setNeedsDisplay(bounds)
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        cell = NSButtonCell()
        cell.isEnabled = true
        cell.setButtonType(.pushOnPushOff)
        cell.font = NSFontManager.shared().convert(cell.font!, toSize: 11)
        cell.bezelStyle = .roundRect
    }
    
    func draw(frame: NSRect, title: String, alignment: NSTextAlignment) {
        Swift.print("draw, recording: \(recording)")
        cell.title = recording ? "\u{238B}" : "\u{2715}";
        cell.alignment = .right
        cell.state = NSOffState
        cell.isEnabled = enabled
        cell.draw(withFrame: frame, in: self)

        shortcutFrame = NSRect(origin: frame.origin,
                               size: CGSize(width: frame.width - clearCancelWidth, height: frame.height))
        clearCancelFrame = NSRect(origin: CGPoint(x: frame.width - clearCancelWidth, y: 0),
                                  size: CGSize(width: clearCancelWidth, height: frame.height))
        
        cell.title = title;
        cell.alignment = alignment
        cell.state = recording ? NSOnState : NSOffState
        cell.isEnabled = enabled
        cell.draw(withFrame: shortcutFrame, in: self)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        draw(frame: bounds, title: "A", alignment: .center)
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = convert(event.locationInWindow, from: nil)
        if recording && clearCancelFrame.contains(location) {
            recording = false
        } else if !recording && shortcutFrame.contains(location) {
            recording = true
        } else if !recording && clearCancelFrame.contains(location) {
            Swift.print("Clear!")
        }
    }
}
