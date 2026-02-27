@isTest
private class CNPJValidatorTest {

    @isTest
    static void testValidAlphanumericCNPJ() {
        String cnpjAlpha = '12.ABC.345/01DE-35';
        
        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjAlpha);
        Test.stopTest();

        System.assertEquals(true, isValid, 'O CNPJ alfanumérico válido deveria retornar true.');
    }

    @isTest
    static void testValidNumericCNPJ() {
        String cnpjNumeric = '00.000.000/0001-91';

        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjNumeric);
        Test.stopTest();

        System.assertEquals(true, isValid, 'O CNPJ numérico tradicional deveria retornar true.');
    }


    @isTest
    static void testUnformattedInput() {
        String cnpjRaw = '12ABC34501DE35';

        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjRaw);
        Test.stopTest();

        System.assertEquals(true, isValid, 'O CNPJ sem formatação deveria ser aceito e validado.');
    }

    @isTest
    static void testLowerCaseInput() {
        String cnpjLower = '12.abc.345/01de-35';

        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjLower);
        Test.stopTest();

        System.assertEquals(true, isValid, 'O validador deve tratar input em minúsculas corretamente.');
    }

    @isTest
    static void testInvalidCheckDigits() {
        String cnpjInvalid = '12.ABC.345/01DE-99';

        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjInvalid);
        Test.stopTest();

        System.assertEquals(false, isValid, 'CNPJ com DV incorreto deveria retornar false.');
    }

    @isTest
    static void testInvalidLength() {
        String cnpjShort = '12.ABC';
        String cnpjLong = '12.ABC.345/01DE-3500';

        Test.startTest();
        Boolean isShortValid = CNPJValidator.isValid(cnpjShort);
        Boolean isLongValid = CNPJValidator.isValid(cnpjLong);
        Test.stopTest();

        System.assertEquals(false, isShortValid, 'CNPJ muito curto deveria falhar.');
        System.assertEquals(false, isLongValid, 'CNPJ muito longo deveria falhar.');
    }


    @isTest
    static void testNullOrEmpty() {
        Test.startTest();
        Boolean isNullValid = CNPJValidator.isValid(null);
        Boolean isEmptyValid = CNPJValidator.isValid('');
        Test.stopTest();

        System.assertEquals(false, isNullValid, 'Input null deve retornar false.');
        System.assertEquals(false, isEmptyValid, 'Input vazio deve retornar false.');
    }

    @isTest
    static void testNonNumericDV() {
        String cnpjBadDvFormat = '12.ABC.345/01DE-XX';

        Test.startTest();
        Boolean isValid = CNPJValidator.isValid(cnpjBadDvFormat);
        Test.stopTest();

        System.assertEquals(false, isValid, 'Dígitos verificadores não numéricos devem falhar.');
    }
}