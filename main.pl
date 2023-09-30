%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Construção de Sistema Especialista para recomendar         %%
%%  emparceiramento no jogo World of Warcraft.                 %%
%%                                                             %%
%%  Dupla: André Fernandes e Enzo Gomes Sônego.                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 



% DEFINIÇÕES:
% Define as subclasses existentes
subclasse(prot_warrior).
subclasse(arms_warrior).
subclasse(fury_warrior).
subclasse(survival_hunter).
subclasse(bm_hunter).
subclasse(mm_hunter).
subclasse(arcane_mage).
subclasse(fire_mage).
subclasse(frost_mage).
subclasse(guardian_druid).
subclasse(resto_druid).
subclasse(feral_druid).
subclasse(balance_druid).
subclasse(prot_paladin).
subclasse(holy_paladin).
subclasse(ret_paladin).

% Define as opções existentes para role
role(tank).
role(healer).
role(dps).

% Define as opções existentes para atack range
atack_range(melee_tank).
atack_range(melee).
atack_range(ranged).

% Define as opções existentes para utility
utility(buff).
utility(bloodlust).
utility(battle_res).

% Define os atributos de cada subclasse
subclass_atributes(prot_warrior,    Role, AtackRange, Utility) :- (Role=tank),   (AtackRange=melee_tank),   (Utility=buff).
subclass_atributes(arms_warrior,    Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=melee),        (Utility=buff).
subclass_atributes(fury_warrior,    Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=melee),        (Utility=buff).
subclass_atributes(survival_hunter, Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=melee),        (Utility=bloodlust).
subclass_atributes(bm_hunter,       Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=bloodlust).
subclass_atributes(mm_hunter,       Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=bloodlust).
subclass_atributes(arcane_mage,     Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=bloodlust; Utility=buff).
subclass_atributes(fire_mage,       Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=bloodlust; Utility=buff).
subclass_atributes(frost_mage,      Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=bloodlust; Utility=buff).
subclass_atributes(guardian_druid,  Role, AtackRange, Utility) :- (Role=tank),   (AtackRange=melee_tank),   (Utility=battle_res).
subclass_atributes(resto_druid,     Role, AtackRange, Utility) :- (Role=healer), (AtackRange=ranged),       (Utility=battle_res).
subclass_atributes(feral_druid,     Role, AtackRange, Utility) :-                (AtackRange=melee),        (Utility=battle_res).
subclass_atributes(balance_druid,   Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=ranged),       (Utility=battle_res; Utility=buff).
subclass_atributes(prot_paladin,    Role, AtackRange, Utility) :- (Role=tank),   (AtackRange=melee_tank),   (Utility=battle_res; Utility=buff).
subclass_atributes(holy_paladin,    Role, AtackRange, Utility) :- (Role=healer), (AtackRange=melee),        (Utility=battle_res; Utility=buff).
subclass_atributes(ret_paladin,     Role, AtackRange, Utility) :- (Role=dps),    (AtackRange=melee),        (Utility=battle_res; Utility=buff).



% FUNCIONALIDADES ÚTEIS:
% Fornece um Role que seja diferente daquele atribuido à subclasse
complementar_role(Role, Subclasse) :- 
    subclass_atributes(Subclasse, R, _, _),
    role(Role),
    Role \= R.

% Fornece um AtackRange que seja diferente daquele atribuido à subclasse
complementar_atack_range(AtackRange, Subclasse) :- 
    subclass_atributes(Subclasse, _, AR, _),
    atack_range(AtackRange),
    AtackRange \= AR.

% Fornece um Utility que seja diferente daquele atribuido à subclasse
complementar_utility(Utility, Subclasse) :- 
    subclass_atributes(Subclasse, _, _, U),
    atack_range(Utility),
    Utility \= U.

% Fornece uma subclasse onde cada atributo é diferente dos atributos do personagem
subclasse_complementar(SubclasseParceiro, SubclassePersonagem) :- 
    subclass_atributes(SubclasseParceiro, R, AR, U),
    complementar_role(R, SubclassePersonagem),
    complementar_atack_range(AR, SubclassePersonagem),
    complementar_utility(U, SubclassePersonagem).



% SUGESTÕES DE EMPARCEIRAMENTO:

% SE o personagem possui role tank
% ENTAO sugere uma subclasse com role healer
sugestao_subclasse(SubclasseParceiro, SubclassePersonagem) :- 
    subclass_atributes(SubclassePersonagem, tank, _, _),
    subclass_atributes(SubclasseParceiro, R, AR, U),
    (R=healer).

% SE o personagem possui atack range melee
% ENTAO sugere uma subclasse com atack range ranged
sugestao_subclasse(SubclasseParceiro, SubclassePersonagem) :- 
    subclass_atributes(SubclassePersonagem, melee, _, _),
    subclass_atributes(SubclasseParceiro, R, AR, U),
    (AR=ranged).

% SE o personagem é da subclasse fury_warrior 
% ENTAO escolhe um personagem da subclasse holy_paladin
sugestao_subclasse(holy_paladin, fury_warrior).

% ENCONTRA PARCEIRO:
% Define o valor a partir das sugestões de subclasse.
% Se houver conflito nas regras ou não encontrar algo
% pode utilizar qualquer classe "complementar".
acha_parceiro(SubclasseParceiro, SubclassePersonagem) :-
    sugestao_subclasse(SubclasseParceiro, SubclassePersonagem) ; subclasse_complementar(SubclasseParceiro, SubclassePersonagem).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                      %%    
%%    %%   %%    %%%%%%%%    %%%%%%%    %%
%%    %%   %%    %%          %%   %%    %%
%%    %%   %%    %%%%%%%%    %%   %%    %%
%%    %%   %%          %%    %%   %%    %%
%%    %%%%%%%    %%%%%%%%    %%%%%%%    %%
%%                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para pedir uma recomendação de subclasse para seu parceiro de acordo 
% com sua subclasse use o comando:
% acha_parceiro(SubclasseParceiro, <SEU PERSONAGEM>).
% Para receber mais de uma recomendação (se houver) aperte o botão ";" para que o programa
% continue sugerindo.

% Sua subclasse pode ser uma das seguintes:
% - prot_warrior
% - arms_warrior
% - fury_warrior
% - survival_hunter
% - bm_hunter
% - mm_hunter
% - arcane_mage
% - fire_mage
% - frost_mage
% - guardian_druid
% - resto_druid
% - feral_druid
% - balance_druid
% - prot_paladin
% - holy_paladin
% - ret_paladin

% Exemplo de execução:
% Meu personaem é do tipo prot_warrior
acha_parceiro(Parceiro, prot_warrior).
% Output:
%   Parceiro = resto_druid 