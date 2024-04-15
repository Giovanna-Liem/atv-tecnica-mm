describe('Teste de pesquisa no DuckDuckGo', () => {
  it('Deve pesquisar por BitCoin e validar a quantidade de resultados', () => {
    cy.visit('https://duckduckgo.com/');
    cy.get('#searchbox_input').type('BitCoin')
    cy.get('#searchbox_homepage > .searchbox_searchbox__eaWKL > .searchbox_iconWrapper__suWUe > .searchbox_searchButton__F5Bwq > .iconButton_icon__Vr1u2').click()

    // verificar se há 10 artigos
    cy.get('article').should('have.length', 10)
  });
});