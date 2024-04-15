describe('Pesquisa DuckGo', () => {
  it('deve encontrar notícias sobre a copa de 2022', () => {
    cy.visit('https://duckduckgo.com/');

    //digitar na barra de pesquisa
    cy.get('#searchbox_input').type('Futebol').type('{enter}')
 
    // clicar em qualquer data
    cy.get('.results--main > .search-filters-wrap > .js-search-filters > .dropdown--date > .dropdown__button').click()

    // clicar em período personalizado
    cy.contains('Período personalizado').click({ force: true })

    // digitar data inicial
    cy.get('.js-custom-date-range-from').clear().type('01/11/2022')

    // digitar data final
    cy.get('.js-custom-date-range-to').clear().type('30/11/2022')

    // aplicar
    cy.contains('Aplicar').click();

    // encontrar imagens
    cy.contains('Imagens de Futebol').click()

    cy.wait(1000)

    //tirar print da tela
    cy.screenshot('foto', { capture: 'viewport' })

  })
})