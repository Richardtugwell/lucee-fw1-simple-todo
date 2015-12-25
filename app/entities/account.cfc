component  output="false" persistent="true" table="taccounts" {

property name="ID" fieldtype="id" generator="native";
property name="IDaccount" ormtype="string" unique="true" ;
property name="firstname" ormtype="string" ;
property name="lastname" ormtype="string" ;
property name="password" ormtype="string" ;
property name="email" ormtype="string" unique="true"    ;
property name="validemail" ormtype="string" ;
property name="passwordreset" ormtype="string" ;
property name="isValid" ormtype="integer" default=0 ;


}