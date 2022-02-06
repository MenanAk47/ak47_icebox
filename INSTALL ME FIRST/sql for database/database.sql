DROP TABLE IF EXISTS `ak47_icebox`;
CREATE TABLE IF NOT EXISTS `ak47_icebox` (
  `stock` longtext NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM `ak47_icebox`;
INSERT INTO `ak47_icebox` (`stock`) VALUES
  ('{"necklace_family":100,"goldstone_earrings":100,"skull_bracelet":100,"casino_earrings":100,"pendulus_platinum":100,"platbox_earrings":100,"chain_richman":100,"chain_medal":100,"necklace_dogtag":100,"diaplatinum_earrings":100,"chain_ls":100,"crowex_brown":100,"kronos_gold":100,"hex_gold":100,"hexdia_earrings":100,"hex4you_earrings":100,"chain_triangle":100,"chain_dogtag":100,"earrings_sgold":100,"skull_earrings":100,"kronos_black":100,"chain_is":100,"covgari_gold":100,"karaoke_earrings":100,"crowex_black":100,"diagold_earrings":100,"goldak_earrings":100,"goldhex_earrings":100,"rectdia_earrings":100}')
;
