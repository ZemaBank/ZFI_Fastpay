module M2yFast
  class Limit < Base
    # consulta_disponivel
    def self.card_limit(card_id)
      xml = LimitXmlBuilder.card_limit_xml(card_id)
      response = M2yFast.configuration.savon_client.call(:consulta_disponivel, xml: xml)
      full_response(LimitXmlResponseParser.card_limit_response(response.body), xml, response.body, :consulta_disponivel)
    end

    # consulta_disponivel
    def self.card_limit_by_number(card_id)
      xml = LimitXmlBuilder.card_number_limit_xml(card_id)
      response = M2yFast.configuration.savon_client.call(:consulta_disponivel, xml: xml)
      full_response(LimitXmlResponseParser.card_limit_response(response.body), xml, response.body, :consulta_disponivel)
    end

    # alterar_limite
    def self.update_limit(body)
      xml = LimitXmlBuilder.update_limit_xml(body)
      response = M2yFast.configuration.savon_client.call(:alterar_limite, xml: xml)
      full_response(LimitXmlResponseParser.update_limit_response(response.body), xml, response.body, :alterar_limite)
    end

    # consulta_opcao_parcelamento
    def self.consult_installment_options(card_id, cpf)
      xml = LimitXmlBuilder.consult_installment_options_xml(card_id, cpf)
      response = M2yFast.configuration.savon_client.call(:consulta_opcao_parcelamento, xml: xml)
      full_response(LimitXmlResponseParser.consult_installment_options_response(response.body), xml, response.body, :consulta_opcao_parcelamento)
    end

    # gera_autorizacao
    # cadastra um valor de crédito para o user
    def self.generate_authorization(card_id, value)
      xml = LimitXmlBuilder.generate_authorization_xml(card_id, value, trace)
      response = M2yFast.configuration.savon_client.call(:gera_autorizacao, xml: xml)
      full_response(LimitXmlResponseParser.generate_authorization_response(response.body), xml, response.body, :gera_autorizacao)
    end
  end
end
