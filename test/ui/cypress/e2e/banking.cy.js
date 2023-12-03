// Adding intellisense for cypress commands
/// <reference types="cypress"/> 

const baseURL = 'https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login'

describe('Test Scenario: Testing Banking site example from globalsqa.', () => {
  it('Test Case: Log in as CUSTOMER - Harry Potter.', () => {
    // given
    const userName = 'Harry Potter'

    // when
    cy.loginAsCustomer(userName)

    // then
    cy.get('.borderM > :nth-child(1) > strong').should('contain.text', userName)
  })

  it('Test Case: Log in as MANAGER.', () => {
    // given
    const expectedFirst = 'Add Customer'
    const expectedSecond = 'Open Account'
    const expectedThird = 'Customers'

    // when
    cy.loginAsManager()

    // then
    cy.get('[ng-class="btnClass1"]').should('contain.text', expectedFirst)
    cy.get('[ng-class="btnClass2"]').should('contain.text', expectedSecond)
    cy.get('[ng-class="btnClass3"]').should('contain.text', expectedThird)
  })

  it('Test Case: Add new customer.', () => {
    // given
    const userInfo = ['1111user', '1111user', 1111]

    // when
    cy.createCustomer(userInfo)
    cy.get('[ng-class="btnClass3"]').click()

    // then
    cy.get(':nth-child(6) > :nth-child(1)').should('have.text', userInfo[0])
    cy.get(':nth-child(6) > :nth-child(2)').should('have.text', userInfo[1])
    cy.get(':nth-child(6) > :nth-child(3)').should('have.text', userInfo[2])
    cy.get(':nth-child(6) > :nth-child(5) > button').click() // Delete customer
  })

  it('Test Case: Delete new customer created.', () => {
    // given
    const userInfo = ['1111user', '1111user', 1111]
    const expectedLenght = 0

    // when
    cy.createCustomer(userInfo)
    cy.get('[ng-class="btnClass3"]').click()
    cy.get(':nth-child(6) > :nth-child(5) > button').click()
    cy.get('.form-control').type(userInfo[0])

    // then
    cy.get('tbody').children().should('have.length', expectedLenght)
  })

  it('Test Case: Open account for new customer created.', () => {
    // given
    const userInfo = ['1111user', '1111user', 1111]
    const currency = 'Dollar'

    // when
    cy.createCustomer(userInfo)
    cy.openAccount(userInfo, currency)
    cy.get('[ng-class="btnClass3"]').click()

    // then
    cy.get(':nth-child(6) > :nth-child(4)').should('not.be.NaN')
    cy.get(':nth-child(6) > :nth-child(5) > button').click() // Delete customer
  })

  it('Test Case: Withdraw without money available.', () => {
    // given
    const value = 1
    const userName = 'Harry Potter'
    const expectedText = 'Transaction Failed'

    // when
    cy.loginAsCustomer(userName)
    cy.get('[ng-class="btnClass3"]').click()
    cy.get('.form-control').type(value)
    cy.get('form.ng-dirty > .btn').click()
    
    // then
    cy.get('.error').should('contain.text', expectedText)
  })

})
