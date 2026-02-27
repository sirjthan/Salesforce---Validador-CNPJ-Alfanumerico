public class CNPJValidator {

    /**
     * 
     * @param cnpj 
     * @return 
     */
    public static Boolean isValid(String cnpj) {
        if (String.isEmpty(cnpj)) return false;
        String rawCnpj = cnpj.replaceAll('[^a-zA-Z0-9]', '').toUpperCase();

        if (rawCnpj.length() != 14) return false;

       
        if (!rawCnpj.substring(12, 14).isNumeric()) return false;

        List<Integer> pesos1 = new List<Integer>{5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        Integer digito1 = calcularDigito(rawCnpj.substring(0, 12), pesos1);

        List<Integer> pesos2 = new List<Integer>{6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        String baseParaSegundoDigito = rawCnpj.substring(0, 12) + String.valueOf(digito1);
        Integer digito2 = calcularDigito(baseParaSegundoDigito, pesos2);

        String dvCalculado = String.valueOf(digito1) + String.valueOf(digito2);
        String dvInformado = rawCnpj.substring(12, 14);

        return dvCalculado.equals(dvInformado);
    }

    private static Integer calcularDigito(String textoBase, List<Integer> pesos) {
        Integer soma = 0;
        
        for (Integer i = 0; i < textoBase.length(); i++) {
            Integer codigoAscii = textoBase.charAt(i);
            
            Integer valorNumerico = codigoAscii - 48;
            
            soma += valorNumerico * pesos[i];
        }

        Integer resto = Math.mod(soma, 11);
        
        if (resto < 2) {
            return 0;
        } else {
            return 11 - resto;
        }
    }
}