public class Quiver_SendProposta implements Queueable, Database.AllowsCallouts{
    
    public void execute(QueueableContext context) {
        System.debug(' ------ Start ------ ');
        Quiver_Entity.InputQuiverData propostaQuiver;
        Map<String, Object> returnQuiver;
        System.debug('Quiver_SendProposta - Enviando proposta...');
        try {
            propostaQuiver = getProposta();
            if (propostaQuiver != null) {
                Quiver_CallRest call = new Quiver_CallRest();
                returnQuiver = call.PostQuiver(JSON.serialize(propostaQuiver));
                if ((String) returnQuiver.get('Status') != 'Success') {
                    System.debug((String) returnQuiver.get('ErrorMessage') + ' Request: ' + JSON.serialize(propostaQuiver));
                } else {
                    Quiver_Entity.ResponseQuiver deserializedReturnQuiver = (Quiver_Entity.ResponseQuiver)JSON.deserialize((String) returnQuiver.get('Retorno'), Quiver_Entity.ResponseQuiver.class);
                    if (deserializedReturnQuiver.ResponseQuiver = ok) {
                        System.debug('Proposta cadastrada');
                    }
                }
            } else {
                System.debug('Erro: ' + propostaQuiver);
            }
        } catch (Exception e) {
            System.debug('Erro: ' + e.getMessage() + ' ' + e.getLineNumber()); 
        }
        System.debug(' ------ END ------ ');
    }

    private Quiver_Entity.InputQuiverData getProposta() {
        Quiver_Entity.InputQuiverData data = new Quiver_Entity.InputQuiverData();

		Case propostaQuiver = [
            SELECT Dado1, Dato2, ObjetoDaLista1, ObjetoDaLista2
            FROM Case 
            WHERE Id =: this.idCase];

        data.Dado1 = propostaQuiver.Dado1;
        data.Dato2 = propostaQuiver.Dato2;
        data.ObjetoDaLista1 = propostaQuiver.ObjetoDaLista1;
        data.ObjetoDaLista2 = propostaQuiver.ObjetoDaLista2;

        return data;
    }
}


JSON que preciso enviar
    { 
        "data":{ 
            "Dado1":"1",
            "Dato2":"2",
            "Lista1":[ { "ObjetoDaLista1":"1", } ],
            "Lista2":[ { "ObjetoDaLista2":"2" } ],
        }
    }


Resposta da Quiver
    Sucess:
    [
        {
            "ok": "Proposta gerada:7959"
        }
    ]

    Error:
    [
        {
            "erro": "? obrigat?rio informar o campo X."
        }
    ]