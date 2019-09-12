public class Quiver_CallRest {

    public static final String EndpointInserirProposta = '/integracaoProposta/inserir';
    
    public Map<String, Object> PostQuiver(String serializedParameter) {
        Map<String, Object> results = new Map<String, Object>();
        
        // Credenciais cadastradas em custom settings
        URL = ExternalAPI__c.getValues('Quiver').Endpoint__c + EndpointInserirProposta;
        // URL = 'https://www0.quiverplus.net.br/integracaoProposta/inserir';
        Content-Type = ExternalAPI__c.getValues('Quiver').ContentType__c;
        // Content-Type = 	'application/json;charset=UTF-8';
        conexao = ExternalAPI__c.getValues('Quiver').Conexao__c;
        // conexao = 'V1ABC2D6C1E';
        api = ExternalAPI__c.getValues('Quiver').Api__c;
        // api = '45BEA39570604E508328725288C358BE';

        method = 'POST';
    
        results = new Map<String, Object>();

        strJSON = Callout(serializedParameter);
        
        results.put('WSResponseStatusCode', StatusCode); 
        if (Error) {
            results.put('Status', 'Failed');
            results.put('ErrorMessage', ErrorMessage);
        } else if (StatusCode == 201 || StatusCode == 200) {
            results.put('Retorno', strJSON); 
            results.put('Status', 'Success'); 
        } else {
            results.put('Status', 'Failed');
            results.put('ErrorMessage', strJSON);
        }
        return results;
    }
}