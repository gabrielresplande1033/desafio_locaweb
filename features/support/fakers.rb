require "faker"
require "cpf_faker"

def generate_domain
    return  "#{Faker::Alphanumeric.alpha(number: 15)}"
end

def generate_cpf
    return "#{Faker::CPF.numeric}"
end

def generate_cnpj
    return "#{Faker::CNPJ.numeric}"
end