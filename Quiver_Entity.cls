global class Quiver_Entity {

	global class InputQuiverData {
        global integer cia_codigo {get; set;}		
        global String doc_inicio_vigencia {get; set;}
        global String doc_final_vigencia {get; set;}
        global Decimal cli_codigo {get; set;}
        global Long doc_apolice {get; set;}
        global Long doc_controle {get; set;}
        global String doc_data_proposta {get; set;}
        global Decimal doc_premio_liquido {get; set;}
        global Decimal doc_premio_servico_adic {get; set;}
        global Decimal doc_premio_total {get; set;}
        global Decimal doc_perc_comissao {get; set;}
        global Integer doc_qtd_parcelas {get; set;}
        global Integer doc_situacao {get; set;}
        global Integer doc_tipo_apolice {get; set;}
        global Integer doc_tipo_movto {get; set;}
        global String doc_anotacoes {get; set;}
        global Decimal doc_comissao {get; set;}
        global Decimal doc_custo {get; set;}
        global Decimal doc_adicional_frac {get; set;}
        global Decimal doc_iof {get; set;}
        global Integer docori_codigo {get; set;}
        global Integer imp_geracao_permitida {get; set;}
        global Integer imp_repassa_vend1 {get; set;}
        global Integer imp_repassa_vend2 {get; set;}
	}

	global class ResponseQuiver {
        global String ok {get;set;}
        global String error {get;set;}
	}

}