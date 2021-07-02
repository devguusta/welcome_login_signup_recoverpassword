import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:password_strength/password_strength.dart';
import 'package:email_validator/email_validator.dart';

class Validators{
  String? validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome" : null;
  }

 String? cpfValidator(String value) {
   if(CPFValidator.isValid(value)) {
     return null;
   } else {
     return "Formato do CPF inválido ou não existe";
   }
 }

 String? validateEmail(String value) {
   final bool isValid = EmailValidator.validate(value);
   return isValid ? null : 'Informe um email válido';
 }

 String? validateEmailLogin(String value) {
   final bool isValid = EmailValidator.validate(value);
   return isValid ? null : 'E-mail inválido ou não cadastrado no sistema :(';
 }

 String? validatePassword(String value) {
   double strength = estimatePasswordStrength(value);
   if(strength >= 0.3) {
     return null;
   } else {
     var myRichRunesMessage = new Runes(
       'Escolha uma senha mais forte para sua segurança!'
     );

     return new String.fromCharCodes(myRichRunesMessage);
   }
 }

 String? validatePasswordLogin(String value) {
   double strength = estimatePasswordStrength(value);
   if(strength >= 0.3) {
     return null;
   } else {
     var myRichRunesMessage = new Runes(
       'Senha incorreta!'
     );

     return new String.fromCharCodes(myRichRunesMessage);
   }
 } 

  String? validateRecoverPassword(String value, String value1) {
    if (value != value1) {
      return "As senhas não conferem";
    }
    double strength = estimatePasswordStrength(value);
    if (strength > 0.4 || value == value1) {
      return null;
    } else {
      var myRichRunesMessage = new Runes(
        ' \u{1F512} Escolha uma senha mais forte',
      );

      return new String.fromCharCodes(myRichRunesMessage);
    }
  }




}