BEGIN "#ZGemma"

//Deux premiers chiffres : ID du dialogue en entier, deux derniers : ID du bloc
//Dialogues en 01-- : dialogues de recrutement et re-recrutement.
IF ~NumTimesTalkedTo(0)~ THEN BEGIN Gemmarecrutement0101
SAY @1301001
IF ~~ THEN REPLY @2301001 GOTO Gemmarecrutement0102
END

IF ~~ THEN BEGIN Gemmarecrutement0102
SAY @1301002
IF ~~ THEN REPLY @2301002 GOTO Gemmarecrutement0103
END

IF ~~ THEN BEGIN Gemmarecrutement0103
SAY @1301003
IF ~~ THEN REPLY @2301003 GOTO Gemmarecrutement0104
END

IF ~~ THEN BEGIN Gemmarecrutement0104
SAY @1301004
IF ~~ THEN REPLY @2301004 GOTO Gemmarecrutement0105
END

IF ~~ THEN BEGIN Gemmarecrutement0105
SAY @1301005
IF ~~ THEN REPLY @2301005 GOTO Gemmarecrutement0106
END

IF ~~ THEN BEGIN Gemmarecrutement0106
SAY @1301006
IF ~CheckStatGT(Player1,10,INT)~  THEN REPLY @2301006 GOTO Gemmarecrutement0107 //si int supérieure à 10
IF ~~ THEN REPLY @2301007 GOTO Gemmarecrutement0107
IF ~~ THEN REPLY @2301008 EXIT
IF ~~ THEN REPLY @2301009 GOTO Gemmarecrutement0108
END

IF ~~ THEN BEGIN Gemmarecrutement0107
SAY @1301007
IF ~~ THEN REPLY @2301010 GOTO Gemmarecrutement0109
IF ~~ THEN REPLY @2301011 GOTO Gemmarecrutement0110
IF ~~ THEN REPLY @2301012 EXIT
END

IF ~~ THEN BEGIN Gemmarecrutement0108
SAY @1301008
IF ~Dead("AR18PRIE")~ THEN REPLY @2301013 GOTO Gemmarecrutement0111 //si le prêtre de Cyric des docks est mort
IF ~Global("UNSEEINGEYE","GLOBAL",2)~ THEN REPLY @2301014 GOTO Gemmarecrutement0111 //si la quête de l'Oeil Aveugle a été effectuée
IF ~~ THEN REPLY @2301015 EXIT
IF ~~ THEN REPLY @2301016 GOTO Gemmarecrutement0109
IF ~~ THEN REPLY @2301017 GOTO Gemmarecrutement0111
END

IF ~~ THEN BEGIN Gemmarecrutement0109
SAY @1301009
IF ~~ THEN REPLY @2301018 GOTO Gemmarecrutement0112
IF ~~ THEN REPLY @2301019 GOTO Gemmarecrutement0112
IF ~~ THEN REPLY @2301011 GOTO Gemmarecrutement0110
IF ~~ THEN REPLY @2301012 EXIT
END

IF ~~ THEN BEGIN Gemmarecrutement0110
SAY @1301010
IF ~~ THEN REPLY @2301020 GOTO Gemmarecrutement0112
IF ~~ THEN REPLY @2301012 EXIT
END

IF ~~ THEN BEGIN Gemmarecrutement0111
SAY @1301011
IF ~~ THEN DO ~SetGlobal("#ZGemmaenemy","GLOBAL",1)~ EXIT //fin de la conversation, Gemma passe agressive
END

IF ~~ THEN BEGIN Gemmarecrutement0112
SAY @1301012
IF ~~ THEN REPLY @2301012 EXIT
IF ~~ THEN REPLY @2301021 GOTO Gemmarecrutement0113
IF ~~ THEN REPLY @2301022 GOTO Gemmarecrutement0114

END

IF ~~ THEN BEGIN Gemmarecrutement0113
SAY @1301013
IF ~~ THEN REPLY @2301023 GOTO Gemmarecrutement0115
IF ~~ THEN REPLY @2301024 GOTO Gemmarecrutement0116
IF ~~ THEN REPLY @2301025 GOTO Gemmarecrutement0117
IF ~~ THEN REPLY @2301026 GOTO Gemmarecrutement0118

END

IF ~~ THEN BEGIN Gemmarecrutement0114
SAY @1301014
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Gemmarecrutement0115
SAY @1301015
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Gemmarecrutement0116
SAY @1301016
IF ~~ THEN DO ~SetGlobal("#ZGemmacoppercoronet","GLOBAL",1)~ EXIT //Gemma se rend à la CC
END

IF ~~ THEN BEGIN Gemmarecrutement0117
SAY @1301017
IF ~~ THEN DO ~SetGlobal("#ZGemmajoined","GLOBAL",1) JoinParty()~ EXIT //Gemma rejoint le groupe
END

IF ~~ THEN BEGIN Gemmarecrutement0118
SAY @1301018
IF ~~ THEN DO ~SetGlobal("#ZGemmajoined","GLOBAL",1) JoinParty()~ EXIT //Gemma rejoint le groupe
END

IF ~NumTimesTalkedToGT(0) Global("#ZGemmajoined","GLOBAL",0) Global("#ZGemmacoppercoronet","GLOBAL",0)~ THEN BEGIN Gemmarecrutement0119 //si le PJ a déjà parlé à Gemma
SAY @1301019
IF ~~ THEN REPLY @2301020 GOTO Gemmarecrutement0112
IF ~~ THEN REPLY @2301012 EXIT
END

IF ~NumTimesTalkedToGT(0) Global("#ZGemmajoined","GLOBAL",0) GlobalGT("#ZGemmacoppercoronet","GLOBAL",0)~ THEN BEGIN Gemmarecrutement0120 //Si le PJ a déjà parlé à Gemma et lui a dit d'attendre à la CC, ou si le PJ l'a virée du groupe et lui a dit d'aller attendre (à la CC ou ailleurs)
SAY @1301020
IF ~~ THEN REPLY @2301027 DO ~SetGlobal("#ZGemmajoined","GLOBAL",1) SetGlobal("#ZGemmacoppercoronet","GLOBAL",0) JoinParty()~ EXIT
IF ~~ THEN REPLY @2301028 EXIT
END

//Dialogue en 02-- : personnage viré du groupe 

BEGIN "#ZGemmaP"
IF ~Global("#ZGemmajoined","GLOBAL",1)~
THEN BEGIN Gemmavire0201
SAY @1302001
IF ~~ THEN REPLY @2302001 GOTO Gemmavire0202
IF ~~ THEN REPLY @2302002 GOTO Gemmavire0203
IF ~~ THEN REPLY @2302003 GOTO Gemmavire0204
END

IF ~~ THEN BEGIN Gemmavire0202
SAY @1302002
IF ~~ DO ~SetGlobal("#ZGemmajoined","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN Gemmavire0203
SAY @1302003
IF ~~ THEN REPLY @2302004 GOTO Gemmavire0205
END

IF ~~ THEN BEGIN Gemmavire0204
SAY @1302004
IF ~~ DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN Gemmavire0205
SAY @1302005
IF ~~ DO ~SetGlobal("#ZGemmajoined","GLOBAL",0) SetGlobal("#ZGemmacoppercoronet","GLOBAL",1)~ EXIT
END

//cc modifié d'un des blocs de recrutement, pour le rengagement

IF ~Global("#ZGemmajoined","GLOBAL",0)~ THEN BEGIN Gemmarecrutement0120 //Si le PJ a déjà parlé à Gemma et lui a dit d'attendre à la CC, ou si le PJ l'a virée du groupe et lui a dit d'aller attendre (à la CC ou ailleurs)
SAY @1301020
IF ~~ THEN REPLY @2301027 DO ~SetGlobal("#ZGemmajoined","GLOBAL",1) SetGlobal("#ZGemmacoppercoronet","GLOBAL",0) JoinParty()~ EXIT
IF ~~ THEN REPLY @2301028 EXIT
END
