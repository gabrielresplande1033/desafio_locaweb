Dado('que o usuário está na página de Registro de Domínios da LOCAWEB') do
    registro_de_dominio.go
end

Dado('que o usuário possua um dominio do tipo {string} disponível') do |type_domain|
    @random_domain = generate_domain
    registro_de_dominio.inserir_dominio(@random_domain)
    registro_de_dominio.selecionar_tipo_dominio(type_domain)
    registro_de_dominio.buscar_dominio
    @mensagem_de_retorno = DATA_MASS['registro_de_dominio']['retorno_dominio_disponivel']
    expect(@mensagem_de_retorno).to eq registro_de_dominio.retornar_mensagem_confirmacao
end

Quando('o usuário registrar o dominio') do
    registro_de_dominio.registrar_dominio
end

Quando('validar um {string} valido') do |document|
    @documento = document
    case document
    when "CPF"
        @documento = generate_cpf
        contratar_registro.inserir_documento(@documento)
    when "CNPJ"
        @documento = generate_cnpj
        contratar_registro.inserir_documento(@documento)
    else
        contratar_registro.inserir_documento(@documento)
    end
    contratar_registro.buscar_documento
    expect(contratar_registro.has_icon_confirm_document?(visible: true)).to be_truthy
end

Então('o usuário prossegue até a página de checkout para finalizar o registro') do
    contratar_registro.botao_continuar_first
    contratar_registro.botao_continuar_second
    @retorno_checkout = DATA_MASS['checkout']['retorno_pagina_checkout']
    expect(@retorno_checkout).to eq checkout.retornar_titulo_checkout
end

Dado('que o usuário selecione mais de uma extensão para seu domínio') do
    registro_de_dominio.marcar_todos
end

Quando('o usuário registrar os dominios') do
    registro_de_dominio.registrar_dominios
end

Então('o usuário prossegue até a página de checkout para finalizar o registro dos dominios') do
    contratar_registro.botao_continuar_first_all
    contratar_registro.botao_continuar_second
    @retorno_checkout = DATA_MASS['checkout']['retorno_pagina_checkout']
    expect(@retorno_checkout).to eq checkout.retornar_titulo_checkout
end