class RegistroDeDominioPage < SitePrism::Page
    include Capybara::DSL

    element :input_domain, "input[class='input-domain']"
    element :select_domain, "select[class='top-level-domain-list']"
    element :button_search_domain, "button[class='button-primary btn-search']"
    element :confirm_avaliable_domain, "h2[class='domain-title avaliable']"
    element :button_register_domain, "button[aria-label='Registre']"
    element :all_checkbox, "input[name='domain-suggestion']"
    element :message_domain_exists, "h2[class='domain-title unavaliable']"

    def go
        visit '/'
        page.windows[0].maximize
    end

    def inserir_dominio(domain)
        input_domain.set domain
    end

    def selecionar_tipo_dominio(type_domain)
        select_domain.select(type_domain)
    end

    def buscar_dominio
        button_search_domain.click
        wait_until_confirm_avaliable_domain_visible
    end

    def retornar_mensagem_confirmacao
        return confirm_avaliable_domain.text
    end

    def registrar_dominio
        button_register_domain.click
        contratar_registro.wait_until_load_element_one_check_visible
    end

    def registrar_dominios
        button_register_domain.click
        contratar_registro.wait_until_load_element_all_check_visible
    end

    def marcar_todos
        all('input[name="domain-suggestion"]').each { |checkbox| checkbox.set(true) }
    end

    def buscar_dominio_invalido
        button_search_domain.click
        wait_until_message_domain_exists_visible
    end

    def retornar_mensagem_dominio_invalido
        return message_domain_exists.text
    end

end