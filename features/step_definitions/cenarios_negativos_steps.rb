Dado('que o usuário possua um dominio que não está disponível') do
    @invalid_domain = DATA_MASS['registro_de_dominio']['dominio_indisponivel']
    registro_de_dominio.inserir_dominio(@invalid_domain)
end

Quando('o usuário realizar a busca desse dominio') do
    registro_de_dominio.buscar_dominio_invalido
end

Então('uma mensagem é exibida ao usuário informando que o dominio não está disponível') do
    @retorno_dominio_indisponivel = DATA_MASS['registro_de_dominio']['retorno_dominio_indisponivel']
    expect(@retorno_dominio_indisponivel).to eq registro_de_dominio.retornar_mensagem_dominio_invalido
end

Quando('validar um {string} invalido') do |document|
    @invalid_dcument = document
    contratar_registro.inserir_documento(@invalid_dcument)
    contratar_registro.buscar_documento_invalido
end

Então('uma {string} é exibida ao usuário informando que o documento é inválido') do |message|
    @retorno_documento_invalido = message
    expect(@retorno_documento_invalido). to eq contratar_registro.retornar_mensagem_documento_invalido
end