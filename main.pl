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

role(tank).
role(healer).
role(dps).

atack_range(melee_tank).
atack_range(melee).
atack_range(ranged).

utility(buff).
utility(bloodlust).
utility(battle_res).

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

complementar_role(Role, Subclass) :- 
    subclass_atributes(Subclass, R, _, _),
    role(Role),
    Role \= R.

complementar_atack_range(AtackRange, Subclass) :- 
    subclass_atributes(Subclass, _, AR, _),
    atack_range(Role),
    Role \= AR.

complementar_utility(Utility, Subclass) :- 
    subclass_atributes(Subclass, _, _, U),
    atack_range(Role),
    Role \= U.

% equivalente a sugestao_vinho
% subclasse_complementar(Sugestao, prot_warrior) :- subclasse_adequada(Sugestao, healer, ranged).
subclasse_complementar(Sugestao, Subclass) :- 
    subclass_atributes(Sugestao, R, AR, U),
    complementar_role(R, Subclass),
    complementar_atack_range(AR, Subclass),
    complementar_utility(U, Subclass).

% % equivalente a melhor_vinho
% subclasse_adequada(resto_druid, Role, AtackRange) :- (Role=healer), (AtackRange=ranged).
% subclasse_adequada(feral_druid, Role, AtackRange) :- (Role=healer), (AtackRange=ranged), !.