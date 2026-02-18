// Race list means RESTRICTED from the LISTED races.
/datum/virtue/origin
	var/origin_name = "Unknown"

/datum/virtue/origin/unknown
	name = "Nowhere"
	origin_name = "Unknown"
	desc = "I hail from nowhere in particular, thus I know no regional tongue in particular.<br>"
	origin_desc = "Wanderers, peasantry, abandoned orphans or souls left to wander the bygone world, with no identity associated with them."

/datum/virtue/origin/lyndhardt
	name = "Lyndhardtian"
	origin_name = "Lyndhardt"
	desc = "I originate from the lands of Lyndhardtia, once the most prosperous empire in the realm.<br>"
	restricted = FALSE
	added_languages = list(/datum/language/oldazurian)
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/grenzelhoft
	name = "Grenzelhoftian"
	origin_name = "Grenzelhoft"
	added_languages = list(/datum/language/grenzelhoftian)
	desc = "I originate from the lands of Grenzelhoft. With cities built from marble and stone, it is one of the strongest realms in Yoheon.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/calmirixia
	name = "Calmirixian"
	origin_name = "Calmirixia"
	added_languages = list(/datum/language/calmirixian)
	desc = "I originate from the swamps of Calmirixia, a province in Lyndhardtia. Considered the homeland of the Eskallian, and settled by only the hardiest of peoples otherwise.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/valoria
	name = "Valorian"
	origin_name = "Valoria"
	added_languages = list(/datum/language/valorian)
	desc = "I originate from the gently rolling hills of Valoria, a mercantile union of traders and faithful who answer to the Patriarch of the Valorian Archbisphoric.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/rhaenval
	name = "Rhaenish"
	origin_name = "Rhaenval"
	added_languages = list(/datum/language/gronnic)
	desc = "I originate from the expansive lands of the Rhaenish, a confederation of multiple different tribes and identities nestled in the northwest of Lewyn. The assaults of Lyndhardt upon their way of lyfe have brought the warring clans together under a single banner.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/zybantu
	name = "Zybantine"
	origin_name = "Zybantu"
	added_languages = list(/datum/language/celestial)
	desc = "I originate from the sand valleys and harsh badlands of Zybantu. Home to the spice traders, sun elves, and more. The region sits as most peoples gateways between the two continents.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/khazumia
	name = "Khazumian"
	origin_name = "Khazumia"
	added_languages = list(/datum/language/celestial)
	desc = "I originate from the sandy dunes and winding savannahs of Khazumia, known for its prowess in many talents. Staunch traditionalists, they often find themselves at odds with Forvheipal.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/yanshen
	name = "Yansheneze"
	origin_name = "Yanshen"
	added_languages = list(/datum/language/kazengunese)
	desc = "I originate from the idyllic plains and waterways of Yanshen, a region poorly known to Lewynians. Its people worship a syncretic variation of the Pantheon, often percieved as heretical.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/forvheipal
	name = "Forvheipan"
	origin_name = "Forvheipal"
	added_languages = list(/datum/language/dwarvish) //to be changed to forvheipan when the language is ported in
	desc = "I originate from mountainous Forvheipal, a frigid and sparse land in the far south of Yoheon. The region is considered one of the most hostile, and home to the most infamous slaver guilds.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/greencrest
	name = "Crestborne"
	origin_name = "Greencrest"
	added_languages = list(/datum/language/aavnic)
	desc = "I originate from the open plains of Greencrest, a nation governed by an elvish aristocracy. All other races are effectively barred from upper castes of its heavily feudalistic society.<br>"
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/racial/underdark
	name = "Underdweller"
	added_languages = list(/datum/language/dwarvish)
	origin_name = "the Underdark"
	desc = "I originate from the treacherous Underdark, a cavernous region beneath all of Beowricke. This unforgiving land is dominated by the prosperous and cruel dark elves and their pets. Most surfacedwellers only come here in chains.<br>"
	races = list(/datum/species/elf/dark,
				/datum/species/human/halfelf,
				/datum/species/kobold,
				/datum/species/dwarf,
				/datum/species/dwarf/gnome,
				/datum/species/goblinp,
)
	origin_desc = "PLACEHOLDER TO BE DONE FOR LATER"

/datum/virtue/origin/apply_to_human(mob/living/carbon/human/recipient)
	recipient.dna.species.origin = origin_name
