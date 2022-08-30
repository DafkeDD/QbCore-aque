QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Arbetslös',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'A-Kasssan',
                payment = 50
            },
        },
	},
	['police'] = {
		label = 'Polismyndigheten',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Aspirant',
                payment = 150
            },
			['1'] = {
                name = 'Assistent',
                payment = 175
            },
			['2'] = {
                name = 'Assistent 4års',
                payment = 180
            },
			['3'] = {
                name = 'Inspektör',
                payment = 190
            },
			['4'] = {
                name = 'Inspektör (befäl/arbetsledare)',
                payment = 200
            },
            ['5'] = {
                name = 'Inspektör (chef för grupp)',
                payment = 210
            },
            ['6'] = {
                name = 'Kommisarie',
                payment = 225
            },
            ['7'] = {
                name = 'Kommisarie (befäl/arbetsledare)',
                payment = 230
            },
            ['8'] = {
                name = 'Kommisarie (chef för sektion)',
                payment = 235
            },
            ['9'] = {
                name = 'intendent',
                payment = 250
            },
            ['10'] = {
                name = 'Sekreterare',
                payment = 255
            },
            ['11'] = {
                name = 'Polismästare',
                payment = 265
            },
            ['12'] = {
                name = 'Bitr rikspolischef ',
                isboss = true,
                payment = 300
            },
            ['13'] = {
                name = 'Rikspolischef ',
                isboss = true,
                payment = 315
            },
        },
	},
	['ambulance'] = {
		label = 'Sjukvårdare',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Receptionist',
                payment = 100
            },
			['1'] = {
                name = 'Undersköterska',
                payment = 290
            },
			['2'] = {
                name = 'Sjuksköterska',
                payment = 300
            },
			['3'] = {
                name = 'Överläkare',
                payment = 340
            },
			['4'] = {
                name = 'Biträdandechef',
				isboss = true,
                payment = 380
            },
            ['6'] = {
                name = 'Regionschef',
				isboss = true,
                payment = 400
            },
        },
	},
	['realestate'] = {
		label = 'Mäklare',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 75
            },
			['1'] = {
                name = 'Hus säljare',
                payment = 100
            },
			['2'] = {
                name = 'Business Sales',
                payment = 125
            },
			['3'] = {
                name = 'Broker',
                payment = 150
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 160
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 50
            },
			['2'] = {
                name = 'Event Driver',
                payment = 50
            },
			['3'] = {
                name = 'Sales',
                payment = 50
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 50
            },
        },
	},
    ["beanmachine"] = {
		label = "Beanmachine",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 800
            },
			['1'] = {
                name = "Employee",
                payment = 1500
            },
			['2'] = {
                name = "Manager",
                payment = 3500
            },
			['3'] = {
                name = "CEO",
				isboss = true,
                payment = 5500
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chaufför',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Igors Bilfirma',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 105
            },
			['1'] = {
                name = 'Anställd',
                payment = 110
            },
			['2'] = {
                name = 'Expert Antälld',
                payment = 115
            },
			['3'] = {
                name = 'Finance',
                payment = 120
            },
			['4'] = {
                name = 'Chef',
				isboss = true,
                payment = 130
            },
        },
	},
    ['sanders'] = {
		label = 'Sanders Motorcyklar',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 100
            },
			['1'] = {
                name = 'Anställd',
                payment = 115
            },
			['2'] = {
                name = 'Expert Antälld',
                payment = 120
            },
			['3'] = {
                name = 'Finance',
                payment = 135
            },
			['4'] = {
                name = 'Chef',
				isboss = true,
                payment = 140
            },
        },
	},
    ['pawn'] = {
		label = 'Pawn AB',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny Anställd',
                payment = 100
            },
			['1'] = {
                name = 'Anställd',
                payment = 120
            },
			['2'] = {
                name = 'Expert',
                payment = 135
            },
			['3'] = {
                name = 'Biträdandechef',
                isboss = true,
                payment = 150
            },
			['4'] = {
                name = 'Chef',
				isboss = true,
                payment = 175
            },
        },
	},
	['mechanic'] = {
		label = 'Auto Exotics',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Ny Anställd',
                payment = 120
            },
			['1'] = {
                name = 'Anställd',
                payment = 150
            },
			['2'] = {
                name = 'Expert',
                payment =170
            },
			['3'] = {
                name = 'Biträdandechef',
                isboss = true,
                payment = 210
            },
			['4'] = {
                name = 'Chef',
				isboss = true,
                payment = 220
            },
        },
	},
    ['tuner'] = {
        label = 'Redline',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 140
            },
            ['1'] = {
                name = 'Mekaniker',
                payment = 150
            },
            ['2'] = {
                name = 'Expert Mekaniker',
                payment = 170
            
            },
            ['3'] = {
                name = 'Co-Owner',
                isboss = true,
                payment = 210
            },
            ['4'] = {
                name = 'Chef',
                isboss = true,
                payment = 220
            },
        },
	},
    ['vanilla'] = {
        label = 'Club De Deltaco',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Ny anställd',
                payment = 100
            },
            ['1'] = {
                name = 'Anställd',
                payment = 125
            },
            ['2'] = {
                name = 'Strippare',
                payment = 150
            
            },
            ['3'] = {
                name = 'Co-Owner',
                isboss = true,
                payment = 155
            },
            ['4'] = {
                name = 'Chef',
                isboss = true,
                payment = 160
            },
        },
    },
    ['pizzathis'] = {
        label = 'Ching Pizzeria',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Provanställd',
                payment = 80
            },
            ['1'] = {
                name = 'Pizza Bagare',
                payment = 100
            },
            ['2'] = {
                name = 'Bättre Bagare',
                payment = 110
            
            },
            ['3'] = {
                name = 'Co-Owner',
                isboss = true,
                payment = 120
            },
            ['4'] = {
                name = 'Chef',
                isboss = true,
                payment = 140
            },
        },
    },
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
    ['builder'] = {
		label = 'Byggarbetare',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Byggarbetare',
                payment = 100
            },
        },
	},
    ['tastyeats'] = {
		label = 'Tasty Eats',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Tasty Eats',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
}