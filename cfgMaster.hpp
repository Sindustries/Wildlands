#define true 1
#define false 0
/*
    MASTER CONFIG
*/
class WLD {

/* MAIN SETTINGS */
	WLDdebugMode = true;

	defaultCash = 2000.00;			//Starting cash for new game
	WLDtimeMultiplier = 10;			//Default time multiplier
	WLDrefuelCost = 3.50;			//Starting petrol/gas price (in $)

/* STASH & BANK SETTINGS */
	WLDinterestRate = 0.036;		//Interest rate paid onto bank account (%)

/* VEHICLE SETTINGS */
	WLD_civVehicles[] = {
		"Jonzie_30CSL",
		"Jonzie_Escalade",
		"Jonzie_Datsun_510",
		"Jonzie_Datsun_Z432",
		"Jonzie_Raptor",
		"Jonzie_VE",
		"Jonzie_Ute",
		"Jonzie_Ceed",
		"Jonzie_Galant",
		"Jonzie_Corolla",
		"Jonzie_XB",
		"Jonzie_Viper",
		"Jonzie_Quattroporte",
		"Jonzie_STI",
		"Jonzie_Transit",
		"Jonzie_Highway",
		"Jonzie_Superliner",
		"Jonzie_Box_Truck",
		"Jonzie_Flat_Bed",
		"Jonzie_Log_Truck",
		"Jonzie_Tanker_Truck",
		"Jonzie_Tow_Truck",
		"Jonzie_Mini_Cooper",
		"Jonzie_Mini_Cooper_R_spec",
		"Jonzie_Western"
	};

	WLD_parkVehicles[] = {
		"Jonzie_30CSL",
		"Jonzie_Escalade",
		"Jonzie_Datsun_510",
		"Jonzie_Datsun_Z432",
		"Jonzie_Raptor",
		"Jonzie_VE",
		"Jonzie_Ute",
		"Jonzie_Ceed",
		"Jonzie_Galant",
		"Jonzie_Corolla",
		"Jonzie_XB",
		"Jonzie_Viper",
		"Jonzie_Quattroporte",
		"Jonzie_STI"
	};

};
