<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

Emacs em 30 segundos
====================

-------------------------------------------------------------------------------

TL;DR

Arquivo de configuração para o Emacs para ser utilizado em uma instalação nova ou substituir uma antiga. Automaticamente instala alguns pacotes definidos e configura o ambiente e os pacotes. Tudo bem explicadinho para ser alterado/melhorado facilmente.

-------------------------------------------------------------------------------

Acredito que o maior problema para alguém iniciar com o Emacs está em como ele vem configurado inicialmente. Uma aparência relativamente simples e com teclas de atalhos diferentes das que os usuários estão acostumados (pelo menos as principais).
Muitas das configurações devem estar no arquivo *.emacs* o que implica em edição e a primeira decepção do usuário.

Existem algumas soluções para quem deseja iniciar no fabuloso mundo do Emacs. Para quem usa o *Vim*, uma boa alternativa pode ser o [spacemacs](https://github.com/syl20bnr/spacemacs). Como desvantagem tem a sua complexidade e curva de aprendizado para configurar. Outra opção é o [super-emacs](https://github.com/myTerminal/super-emacs) mas acho que também falham em alguns aspectos. Esconder o menu pode não ser uma boa ideia ou sobrepor atalhos CUA com shift setas para selecionar frames também não.

A ideia aqui é que o usuário apenas copie um arquivo e, ao executar o Emacs na primeira vez, o programa já seja apresentado com uma aparência mais agradável e com diversas ferramentas/opções não disponíveis/configuradas. Mas também é necessário que o usuário saiba o que foi feito, possa efetuar as alterações e incluir novas diretrizes. É o que pretendo colocar neste documento.

O arquivo de configuração *.emacs* ficou estruturado da seguinte forma:

1. agrupamento das alterações que também são efetuadas pelo menu **Options** para que não causem conflito em futuras alterações pelo menu;
2. definição de repositório e pacotes que serão instalados;
3. instalação dos pacotes não inclusos no emacs e configuração dos que acompanham a distribuição;
4. configuração dos pacotes internos e externos que não pertencem ao item 1.

Instalação
==========

Para instalar é necessário uma conexão com a internet para que os pacotes necessários sejam baixados. Basta baixar o arquivo *.emacs* e colocá-lo na pasta do usuário. No Linux é **~/** ou **/home/nomeusuário** e no Windows é  **c:\\Usuários\\nome\\AppData\\Rooming\\** (pelo menos em uma versão do Windows 8 que eu testei; não tenho Windows para saber como são as outras versões nem exatamente o que funciona ou não). 




<!--  LocalWords:  http-equiv Content-Type content text html charset
 -->
<!--  LocalWords:  utf Emacs TL emacs Options spacemacs super-emacs
 -->
<!--  LocalWords:  CUA shift frames Windows AppData Rooming
 -->
