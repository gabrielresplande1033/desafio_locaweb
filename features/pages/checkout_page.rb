class Checkout < SitePrism::Page
    include Capybara::DSL
    
    element :title_checkout, "h2[class='ck-title-3 ck-section-title']"
    element :input_login, "#Login"
    element :input_senha, "#Password"

    def retornar_titulo_checkout
        return title_checkout.text
    end

end