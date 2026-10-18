/// CenterFractionCalculation.swift

import Foundation

/// Centers the window and scales both its width and height to a fraction of the screen.
class CenterFractionCalculation: WindowCalculation {

    let fraction: CGFloat

    init(fraction: CGFloat) {
        self.fraction = fraction
    }

    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {

        let visibleFrameOfScreen = params.visibleFrameOfScreen
        var calculatedWindowRect = visibleFrameOfScreen

        // Resize
        calculatedWindowRect.size.width = round(visibleFrameOfScreen.width * fraction)
        calculatedWindowRect.size.height = round(visibleFrameOfScreen.height * fraction)

        // Center
        calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - calculatedWindowRect.width) / 2.0) + visibleFrameOfScreen.minX
        calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - calculatedWindowRect.height) / 2.0) + visibleFrameOfScreen.minY

        return RectResult(calculatedWindowRect)
    }

}
