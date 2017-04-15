class SIN {
	tag = "SIN";
	class core {
		file = "core\sin";
		class checkPos {};
		class checkDist {};
		class findPos {};
	};
}

class WLD_Core {
    tag = "WLD";
	class core {
		file = "core\core";
		class emptyVeh {};
		class getSetting {};
		class getSettings {};
		class updateProgressBar {};
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
		class bankMessage {};
		class bankWithdraw {};
	};
};