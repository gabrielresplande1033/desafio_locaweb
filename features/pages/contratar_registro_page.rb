class ContratarRegistro < SitePrism::Page
    include Capybara::DSL

    element :input_document, "input[class='input-document']"
    element :button_search_document, "button[class='btn-search-validate-doc']"
    element :icon_confirm_document, "i[class='ico icon-ok']"
    element :button_continue, "#contratar-registro-de-dominio > div > div.content-left > section > section.submit-button.with-back-button.blue > div > button.haslevel.btn-buy"
    # element :button_continue, :field, "button[aria-label='Continuar']"
    element :domain_name, "label[class='domain-name']"
    element :load_element_one_check, "#domain-manager-content > div.product-box-content.domain-list > div > div.box-option.selected > div > ul > li:nth-child(2) > div > label > var"
    element :load_element_all_check, "#domain-manager-content > div.product-box-content.domain-list > div > div.box-option.selected > div > ul > li:nth-child(7) > div > label > var"
    element :modal_offer, "#myModalISOffer > div > span"
    element :message_invalid_document, "p[class='desc-error']"
                                        
    def inserir_documento(document)
        modal_offer.click if has_modal_offer?(visible: true, wait: 0)
        input_document.set document
    end

    def buscar_documento
        modal_offer.click if has_modal_offer?(visible: true, wait: 0)
        button_search_document.click
        wait_until_icon_confirm_document_visible
    end

    def buscar_documento_invalido
        modal_offer.click if has_modal_offer?(visible: true, wait: 0)
        button_search_document.click
        wait_until_message_invalid_document_visible
    end

    def botao_continuar_first
        wait_until_load_element_one_check_visible
        modal_offer.click if has_modal_offer?(visible: true, wait: 0)
        button_continue.click
    end

    def botao_continuar_first_all
        wait_until_load_element_all_check_visible
        modal_offer.click if has_modal_offer?(visible: true, wait: 0)
        button_continue.click
    end

    def botao_continuar_second
        button_continue.click
    end 
    
    def retornar_mensagem_documento_invalido
        return message_invalid_document.text
    end
end