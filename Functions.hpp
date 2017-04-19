class SIN {
	tag = "SIN";
	class core {
		file = "core\sin";
		class adminInit {};
		class checkPos {};
		class checkDist {};
		class findPos {};
		class testCode {};
	};
}

class WLD_Core {
    tag = "WLD";
	class core {
		file = "core\core";
		class emptyVeh {};
		class fuelPump {};
		class fuelStation {};
		class getSetting {};
		class getSettings {};
		class updateProgressBar {};
		class weather {};
	};
	class startup {
		file = "core\startup";
		class addActions {};
		class keyHandler {};
		class locationDisplay {};
		class loadOptions {};
		class loadout {};
		class loadPlayerSpawn {};
		class startupMenu {};
		class tpw_air {};
		class tpw_animals {};
		class tpw_boats {};
		class tpw_cars {};
		class tpw_civs {};
		class tpw_core {};
		class tpw_park {};
	};
	class stash {
		file = "core\stash";
		class bank {};
		class bankDeposit {};
		class bankInterest {};
		class bankMessage {};
		class bankWithdraw {};
	};
	class support {
		file = "core\support";
		class taxiLandCiv {};
	};
};