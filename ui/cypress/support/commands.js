// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

const baseURL = 'https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login'

Cypress.Commands.add('loginAsCustomer', (userName) => {
    cy.visit(baseURL)
    cy.get('.borderM > :nth-child(1) > .btn').click()
    cy.get('#userSelect').select(userName)
    cy.get('form.ng-valid > .btn').click()
})

Cypress.Commands.add('loginAsManager', () => {
    cy.visit(baseURL)
    cy.get(':nth-child(3) > .btn').click()
})