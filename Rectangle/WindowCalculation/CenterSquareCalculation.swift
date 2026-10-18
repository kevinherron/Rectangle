/// CenterSquareCalculation.swift

import Foundation

/// Centers the window as the largest square that fits on the screen.
class CenterSquareCalculation: WindowCalculation {

    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {

        let visibleFrameOfScreen = params.visibleFrameOfScreen
        let side = min(visibleFrameOfScreen.width, visibleFrameOfScreen.height)
        var calculatedWindowRect = visibleFrameOfScreen

        // Resize
        calculatedWindowRect.size.width = side
        calculatedWindowRect.size.height = side

        // Center
        calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - side) / 2.0) + visibleFrameOfScreen.minX
        calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - side) / 2.0) + visibleFrameOfScreen.minY

        return RectResult(calculatedWindowRect)
    }

}
