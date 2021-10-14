import XCTest

class InterChallengeUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.app = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        self.app = nil
        try super.tearDownWithError()
    }
    
    func testChallengeScreenExists() {

        let challengeText = app.navigationBars["Desafio"].staticTexts["Desafio"]
        XCTAssertNotNil(challengeText, "The title of the nagitation bar does not exist")

        let tablesQuery = app.tables

        let bretLabel = tablesQuery.staticTexts["Bret"]
        XCTAssertNotNil(bretLabel, "The Bret label does not exist")

        let antonetteLabel = tablesQuery.staticTexts["Antonette"]
        XCTAssertNotNil(antonetteLabel, "The Antonette label does not exist")

        let samanthaLabel = tablesQuery.staticTexts["Samantha"]
        XCTAssertNotNil(samanthaLabel, "The Samantha label does not exist")

        let karianneLabel = tablesQuery.staticTexts["Karianne"]
        XCTAssertNotNil(karianneLabel, "The bret label does not exist")
        
    }
    
}
