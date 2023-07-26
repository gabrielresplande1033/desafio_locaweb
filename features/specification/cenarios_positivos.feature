#language: pt

Funcionalidade: Registrar login - Cenários positivos
    COMO usuário da plataforma LOCAWEB
    EU QUERO realizar consultas e registros de domínios
    A FIM DE concluir uma contratação de domínio

    Contexto: Estar na página de Registro de Domínios
        Dado que o usuário está na página de Registro de Domínios da LOCAWEB

    Cenario: Registrar domínio nacional
        Dado que o usuário possua um dominio do tipo '<tipo_dominio>' disponível
        Quando o usuário registrar o dominio
        E validar um '<documento>' valido
        Então o usuário prossegue até a página de checkout para finalizar o registro

        Exemplos:
        |tipo_dominio |documento|
        |.com.br      |CPF      |
        |.com.br      |CNPJ     |

    Cenario: Registrar domínio internacional
        Dado que o usuário possua um dominio do tipo '<tipo_dominio>' disponível
        Quando o usuário registrar o dominio
        Então o usuário prossegue até a página de checkout para finalizar o registro

        Exemplos:
        |tipo_dominio |
        |.com         |
        |.com         |

    Cenario: Registrar domínio org.br
        Dado que o usuário possua um dominio do tipo '<tipo_dominio>' disponível
        Quando o usuário registrar o dominio
        E validar um '<documento>' valido
        Então o usuário prossegue até a página de checkout para finalizar o registro

        Exemplos:
        |tipo_dominio| documento|
        |.org.br     | CNPJ     |
        |.org.br     | CNPJ     |

    Cenario: Registrar mais de um domínio
        Dado que o usuário possua um dominio do tipo '<tipo_dominio>' disponível
        E que o usuário selecione mais de uma extensão para seu domínio
        Quando o usuário registrar os dominios
        E validar um '<documento>' valido
        Então o usuário prossegue até a página de checkout para finalizar o registro dos dominios

        Exemplos:
        |tipo_dominio|documento |
        |.website    | CNPJ     |
        |.com        | CPF      |
        |.fun        | CPF      |