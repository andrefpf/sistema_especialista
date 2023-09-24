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

role(prot_warrior, tank).
role(arms_warrior, dps).
role(fury_warrior, dps).
role(survival_hunter, dps).
role(bm_hunter, dps).
role(mm_hunter, dps).
role(arcane_mage, dps).
role(fire_mage, dps).
role(frost_mage, dps).
role(guardian_druid, tank).
role(resto_druid, healer).
# role(feral_druid).
role(balance_druid, dps).
role(prot_paladin, tank).
role(holy_paladin, healer).
role(ret_paladin, dps).

atack_range(prot_warrior, melee_tank).
atack_range(arms_warrior, melee).
atack_range(fury_warrior, melee).
atack_range(survival_hunter, melee).
atack_range(bm_hunter, ranged).
atack_range(mm_hunter, ranged).
atack_range(arcane_mage, ranged).
atack_range(fire_mage, ranged).
atack_range(frost_mage, ranged).
atack_range(guardian_druid, melee_tank).
atack_range(resto_druid, healer).
atack_range(feral_druid, melee).
atack_range(balance_druid, ranged).
atack_range(prot_paladin, melee_tank).
atack_range(holy_paladin, healer).
atack_range(ret_paladin, healer).

utility(prot_warrior, buff).
utility(arms_warrior, buff).
utility(fury_warrior, buff).
utility(survival_hunter, bloodlust).
utility(bm_hunter, bloodlust).
utility(mm_hunter, bloodlust).
utility(arcane_mage, buff).
utility(fire_mage, buff).
utility(frost_mage, buff).
utility(arcane_mage, bloodlust).
utility(fire_mage, bloodlust).
utility(frost_mage, bloodlust).
utility(guardian_druid, battle_res).
utility(resto_druid, battle_res).
utility(feral_druid, battle_res).
utility(balance_druid, battle_res).
utility(prot_paladin, battle_res).
utility(holy_paladin, battle_res).
utility(ret_paladin, battle_res).
utility(balance_druid, buff).
utility(prot_paladin, buff).
utility(holy_paladin, buff).
utility(ret_paladin, buff).

