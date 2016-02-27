//
//  IKnowKungFuLogConfiguration.swift
//  IKnowKungFu
//
//  Created by Maxim Veksler on 24/02/2016.
//  Copyright © 2016 Maxim Veksler. All rights reserved.
//

import CleanroomLogger

private class IKnowKungFuLogFormatter: XcodeLogFormatter {
    
}

public class IKnowKungFuLogConfiguration: XcodeLogConfiguration {

    public init() {
        let colorizer = XcodeColorsTextColorizer()
        
        let formatter = IKnowKungFuLogFormatter(timestampStyle: .Default, severityStyle: .Xcode, delimiterStyle: nil, showCallSite: true, showCallingThread: true, colorizer: colorizer)
        
        let formatters = [formatter].map({$0 as LogFormatter}) // Swift bug work around http://stackoverflow.com/a/30101004/48062
        
        super.init(minimumSeverity: .Debug,
            debugMode: true,
            verboseDebugMode: false,
            logToASL: true,
            colorizer: colorizer,
            colorTable: nil,
            filters: [],
            formatters: formatters)
    }
    
    
}