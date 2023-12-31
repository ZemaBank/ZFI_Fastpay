module M2yFast
  class Cardholder < Base
    # consulta_portador
    def self.get_cardholder(body)
      xml = CardholderXmlBuilder.get_cardholder_xml(body)
      response = M2yFast.configuration.savon_client.call(:consulta_portador, xml: xml)
      full_response(CardholderXmlResponseParser.get_cardholder_response(response.body), xml, response.body, :consulta_portador)
    end

    # dados_gral_portador
    def self.get_user_registration(card_id)
      xml = CardholderXmlBuilder.get_user_registration_xml(card_id)
      response = M2yFast.configuration.savon_client.call(:dados_gral_portador, xml: xml)
      full_response(CardholderXmlResponseParser.get_user_registration_response(response.body), xml, response.body, :dados_gral_portador)
    end

    # alteracao_portador2
    def self.update_user_registration(body)
      xml = CardholderXmlBuilder.update_user_registration_xml(body)
      response = M2yFast.configuration.savon_client.call(:alteracao_portador2, xml: xml)
      full_response(CardholderXmlResponseParser.update_user_registration_response(response.body), xml, response.body, :alteracao_portador2)
    end

    # cartoes_cpf
    def self.account_for_document(document)
      xml = CardholderXmlBuilder.account_for_document_xml(document)
      response = M2yFast.configuration.savon_client.call(:cartoes_cpf, xml: xml)
      full_response(CardholderXmlResponseParser.account_for_document_response(response.body), xml, response.body, :cartoes_cpf)
    end

    # consulta_informacao_portador
    def self.card_details_for_document(document)
      xml = CardholderXmlBuilder.card_details_for_document_xml(document)
      response = M2yFast.configuration.savon_client.call(:consulta_informacao_portador, xml: xml)
      full_response(CardholderXmlResponseParser.card_details_for_document_response(response.body), xml, response.body, :consulta_informacao_portador)
    end
  end
end
