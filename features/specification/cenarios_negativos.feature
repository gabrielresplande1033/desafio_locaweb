#language: pt

Funcionalidade: Registrar login - Cenários negativos
    COMO usuário da plataforma LOCAWEB
    EU QUERO realizar consultas e registros de domínios
    A FIM DE concluir uma contratação de domínio

    Contexto: Estar na página de Registro de Domínios
        Dado que o usuário está na página de Registro de Domínios da LOCAWEB

    # Cenario: Registrar dominio indisponivel
    #     Dado que o usuário possua um dominio que não está disponível
    #     Quando o usuário realizar a busca desse dominio
    #     Então uma mensagem é exibida ao usuário informando que o dominio não está disponível

    Cenario: Registrar dominio com documento invalido
        Dado que o usuário possua um dominio do tipo '<tipo_dominio>' disponível
        Quando o usuário registrar o dominio
        E validar um '<documento>' invalido
        Então uma '<mensagem>' é exibida ao usuário informando que o documento é inválido

        Exemplos:
        |tipo_dominio|documento  |mensagem                                               |
        |.com.br     |84923987400|Documento inválido. Verifique se digitou corretamente. |
        |.org.br     |32178378332|Você precisa inserir um CNPJ válido.                   |
