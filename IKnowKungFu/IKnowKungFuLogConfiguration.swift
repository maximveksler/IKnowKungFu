//
//  IKnowKungFuLogConfiguration.swift
//  IKnowKungFu
//
//  Created by Maxim Veksler on 24/02/2016.
//  Copyright © 2016 Maxim Veksler. All rights reserved.
//

import CleanroomLogger

class IKnowKungFuLogFormatter: FieldBasedLogFormatter {
//    public override init(timestampStyle: TimestampStyle? = .Default, severityStyle: SeverityStyle? = .Xcode, delimiterStyle: DelimiterStyle? = nil, showCallSite: Bool = true, showCallingThread: Bool = false, colorizer: TextColorizer? = XcodeColorsTextColorizer(), colorTable: ColorTable? = nil)
//    {
//        super.init(timestampStyle: timestampStyle, severityStyle: severityStyle, delimiterStyle: delimiterStyle, showCallSite: showCallSite, showCallingThread: showCallingThread, colorizer: colorizer, colorTable: colorTable)
//    }
    
    init(timestampStyle: TimestampStyle? = .Default,
        severityStyle: SeverityStyle? = .Xcode,
        delimiterStyle: DelimiterStyle? = nil,
        showCallSite: Bool = true,
        showCallingThread: Bool = false,
        colorizer: TextColorizer? = XcodeColorsTextColorizer(),
        colorTable: ColorTable? = nil)
    {
        var fields: [Field] = []
        var addSeparator = false
        
        if let timestampStyle = timestampStyle {
            fields += [.Timestamp(timestampStyle)]
            addSeparator = true
        }
        if addSeparator {
            fields += [.Delimiter(delimiterStyle ?? .SpacedPipe)]
            addSeparator = false
        }
        if let severityStyle = severityStyle {
            fields += [.Severity(severityStyle)]
            addSeparator = true
        }
        if addSeparator {
            fields += [.Delimiter(delimiterStyle ?? .SpacedPipe)]
            addSeparator = false
        }
        if showCallingThread {
            fields += [.CallingThread]
            addSeparator = true
        }
        if addSeparator {
            fields += [.Delimiter(delimiterStyle ?? .SpacedPipe)]
            addSeparator = false
        }
        if showCallingThread {
            fields += [.StackFrame]
            addSeparator = true
        }
        if addSeparator {
            fields += [.Delimiter(delimiterStyle ?? .SpacedPipe)]
            addSeparator = false
        }
        if showCallSite {
            fields += [.CallSite]
            addSeparator = true
        }
        if addSeparator {
            fields += [.Delimiter(delimiterStyle ?? .SpacedHyphen)]
            addSeparator = false
        }
        fields += [.Payload]
        
        if colorizer == nil {
            super.init(fields: fields)
        }
        else {
            super.init(formatters: [ColorizingLogFormatter(formatter: FieldBasedLogFormatter(fields: fields), colorizer: colorizer!, colorTable: colorTable)])
        }
    }
    
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