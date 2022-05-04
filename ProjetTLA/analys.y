%{
#include "analys.c"
void yyerror(char* s);
%}

%union{
     char* texte;
}

%token MAIN 
%token AFFICHER 
%token ID 
%token INF 
%token PRO 
%token PRF 
%token ACO 
%token ACF 
%token MSG
%token TYPE 
%token DPV 
%token EGAL
%token ENTIER
%token VAR
%token VIRG

%type<texte> affichage
%type<texte> affectation

%start  S 

%%

S: MAIN PRO VAR PRF ACO ListeOper ACF{
                   printf ("/n c'est le programme principale");
             };
             
ListeOper :  affectation{
                   printf ("\naffectation");
             }
             |
             affichage{
                   printf ("\naffichage");
             };
        
             
affectation : TYPE VAR EGAL ENTIER DPV {
                   printf ("\n affecter un entier a une variable");
             };
             
affichage :   AFFICHER PRO MSG VIRG VAR PRF DPV{
                   printf ("\n affichage du contenu du variable");
             };
              
%%

void yyerror(char* s){
   
    printf("\n --erreur syntaxique à la ligne [ %d ] -- \n",yylineno);
}

void main(){
    
    if(!yyparse()){
        printf("\n-- Fin de l'analyse lexicale et syntaxique --\n");   
    }

}