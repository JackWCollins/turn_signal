# Sample make and model data from: https://github.com/n8barr/automotive-model-year-data
makes_and_models = [
  ['Bentley', 'Mulsanne'],
  ['Bentley', 'Continental Super'],
  ['Bentley', 'Continental GTC'],
  ['Bentley', 'Continental Flying Spur'],
  ['Bentley', 'Continental'],
  ['Volkswagen', 'Touareg'],
  ['Volkswagen', 'Golf'],
  ['Volkswagen', 'Routan'],
  ['Volkswagen', 'CC'],
  ['Volkswagen', 'Jetta'],
  ['Volkswagen', 'GTI'],
  ['Volkswagen', 'Eos'],
  ['Volkswagen', 'Tiguan'],
  ['Infiniti', 'EX'],
  ['Infiniti', 'G25'],
  ['Infiniti', 'G37'],
  ['Infiniti', 'QX56'],
  ['Infiniti', 'FX'],
  ['Infiniti', 'M'],
  ['Infiniti', 'IPL G'],
  ['Infiniti', 'G'],
  ['Infiniti', 'QX'],
  ['Subaru', 'Legacy'],
  ['Subaru', 'Impreza WRX'],
  ['Subaru', 'Impreza'],
  ['Subaru', 'Outback'],
  ['Subaru', 'Tribeca'],
  ['Subaru', 'Forester'],
  ['Saab', '9-3'],
  ['Saab', '9-5'],
  ['Saab', '9-4X'],
  ['Porsche', '911'],
  ['Porsche', 'Cayenne'],
  ['Porsche', 'Panamera'],
  ['Porsche', 'Boxster'],
  ['Porsche', 'Cayman'],
  ['Land Rover', 'Freelander'],
  ['Land Rover', 'Range Rover Sport'],
  ['Land Rover', 'Range Rover'],
  ['Land Rover', 'Discovery'],
  ['Land Rover', 'LR2'],
  ['Land Rover', 'LR4'],
  ['Buick', 'LaCrosse'],
  ['Buick', 'Regal'],
  ['Buick', 'Lucerne'],
  ['Buick', 'Enclave'],
  ['Scion', 'tC'],
  ['Scion', 'xB'],
  ['Scion', 'xD'],
  ['Lotus', 'Elise'],
  ['Lotus', 'Evora'],
  ['Lotus', 'Exige'],
  ['Kia', 'Optima'],
  ['Kia', 'Forte'],
  ['Kia', 'Rio'],
  ['Kia', 'Sedona'],
  ['Kia', 'Sorento'],
  ['Kia', 'Sportage'],
  ['Kia', 'Soul'],
  ['Hyundai', 'Elantra'],
  ['Hyundai', 'Sonata'],
  ['Hyundai', 'Genesis'],
  ['Hyundai', 'Santa Fe'],
  ['Hyundai', 'Tucson'],
  ['Hyundai', 'Equus'],
  ['Hyundai', 'Veracruz'],
  ['Hyundai', 'Accent'],
  ['Hyundai', 'Azera'],
  ['Hyundai', 'Genesis Coupe'],
  ['Suzuki', 'Grand Vitara'],
  ['Suzuki', 'SX4'],
  ['Suzuki', 'Kizashi'],
  ['Suzuki', 'Equator'],
  ['Smart', 'Fortwo'],
  ['Volvo', 'C30'],
  ['Volvo', 'V50'],
  ['Volvo', 'XC90'],
  ['Volvo', 'S60'],
  ['Volvo', 'XC60'],
  ['Volvo', 'XC70'],
  ['Volvo', 'C70'],
  ['Volvo', 'S80'],
  ['Volvo', 'S40'],
  ['Rolls-Royce', 'Phantom'],
  ['Rolls-Royce', 'Ghost'],
  ['Lincoln', 'Navigator'],
  ['Lincoln', 'MKT'],
  ['Lincoln', 'MKS'],
  ['Lincoln', 'MKZ'],
  ['Lincoln', 'Town Car'],
  ['Lincoln', 'MKX'],
  ['Lincoln', 'Navigator L'],
  ['Mitsubishi', 'Eclipse'],
  ['Mitsubishi', 'Outlander'],
  ['Mitsubishi', 'Endeavor'],
  ['Mitsubishi', 'Lancer'],
  ['Mitsubishi', 'Galant'],
  ['Mitsubishi', 'Lancer Evolution'],
  ['Mitsubishi', 'Outlander Sport'],
  ['Mercury', 'Mariner'],
  ['Mercury', 'Grand Marquis'],
  ['Mercury', 'Milan'],
  ['Maserati', 'GranTurismo'],
  ['Maserati', 'Quattroporte'],
  ['Chrysler', '200'],
  ['Chrysler', '300'],
  ['Chrysler', 'Town & Country'],
  ['Cadillac', 'DTS'],
  ['Cadillac', 'CTS-V'],
  ['Cadillac', 'CTS'],
  ['Cadillac', 'STS'],
  ['Cadillac', 'SRX'],
  ['Cadillac', 'Escalade'],
  ['Cadillac', 'Escalade ESV'],
  ['Cadillac', 'Escalade EXT'],
  ['Maybach', '57'],
  ['Maybach', '62'],
  ['Maybach', 'Landaulet'],
  ['Ferrari', '458 Italia'],
  ['Bugatti', 'Veyron'],
  ['Lamborghini', 'Gallardo'],
  ['Tesla', 'Roadster'],
  ['Ram', '1500'],
  ['Ram', '2500'],
  ['Ram', '3500'],
  ['Ram', 'Dakota'],
  ['Porsche', '911'],
  ['Porsche', 'Cayenne'],
  ['Porsche', 'Panamera'],
  ['Porsche', 'Boxster'],
  ['Porsche', 'Cayman'],
  ['Nissan', 'Altima'],
  ['Nissan', '370Z'],
  ['Nissan', 'Murano'],
  ['Nissan', 'Armada'],
  ['Nissan', 'Pathfinder'],
  ['Nissan', 'Leaf'],
  ['Nissan', 'Xterra'],
  ['Nissan', 'Titan'],
  ['Nissan', 'JUKE'],
  ['Nissan', 'Rogue'],
  ['Nissan', 'Maxima'],
  ['Nissan', 'Versa'],
  ['Nissan', 'Quest'],
  ['Nissan', 'Sentra'],
  ['Nissan', 'GT-R'],
  ['Nissan', 'cube'],
  ['Nissan', 'Frontier'],
  ['Nissan', 'NV1500'],
  ['Nissan', 'NV2500'],
  ['Nissan', 'NV3500'],
  ['Cadillac', 'CTS'],
  ['Cadillac', 'CTS-V'],
  ['Cadillac', 'Escalade'],
  ['Cadillac', 'SRX'],
  ['Cadillac', 'Escalade ESV'],
  ['Cadillac', 'Escalade EXT'],
  ['Audi', 'A3'],
  ['Audi', 'R8'],
  ['Audi', 'A6'],
  ['Audi', 'Q5'],
  ['Audi', 'A5'],
  ['Audi', 'A8'],
  ['Audi', 'TT'],
  ['Audi', 'A7'],
  ['Audi', 'S5'],
  ['Audi', 'A4'],
  ['Audi', 'Q7'],
  ['Audi', 'S4'],
  ['Volkswagen', 'Jetta'],
  ['Volkswagen', 'Golf'],
  ['Volkswagen', 'Routan'],
  ['Volkswagen', 'Touareg'],
  ['Volkswagen', 'Eos'],
  ['Volkswagen', 'New Beetle'],
  ['Volkswagen', 'Passat'],
  ['Volkswagen', 'Tiguan'],
  ['Volkswagen', 'GTI'],
  ['Volkswagen', 'CC'],
  ['Land Rover', 'Range Rover'],
  ['Land Rover', 'Discovery'],
  ['Land Rover', 'Range Rover Sport'],
  ['Land Rover', 'Range Rover Evoque'],
  ['Land Rover', 'LR2'],
  ['Land Rover', 'LR4'],
  ['Honda', 'Odyssey'],
  ['Honda', 'Accord'],
  ['Honda', 'Civic'],
  ['Honda', 'Ridgeline'],
  ['Honda', 'Fit'],
  ['Honda', 'Insight'],
  ['Honda', 'CR-Z'],
  ['Honda', 'Pilot'],
  ['Honda', 'FCX Clarity'],
  ['Honda', 'Crosstour'],
  ['Honda', 'CR-V'],
  ['Hyundai', 'HED-5'],
  ['Hyundai', 'Genesis'],
  ['Hyundai', 'Accent'],
  ['Hyundai', 'Equus'],
  ['Hyundai', 'Santa Fe'],
  ['Hyundai', 'Elantra'],
  ['Hyundai', 'Veracruz'],
  ['Hyundai', 'Sonata'],
  ['Hyundai', 'Tucson'],
  ['Hyundai', 'Veloster'],
  ['Hyundai', 'Azera'],
  ['Ford', 'Focus'],
  ['Ford', 'Mustang'],
  ['Ford', 'F-Series Super Duty'],
  ['Ford', 'E-Series'],
  ['Ford', 'Transit Connect'],
  ['Ford', 'Flex'],
  ['Ford', 'Escape'],
  ['Ford', 'Fusion'],
  ['Ford', 'Taurus'],
  ['Ford', 'Fiesta'],
  ['Ford', 'Explorer'],
  ['Ford', 'Expedition'],
  ['Ford', 'Edge'],
  ['Ford', 'E150'],
  ['Ford', 'E250'],
  ['Ford', 'E350'],
  ['Ford', 'Expedition EL'],
  ['Ford', 'F150'],
  ['Ford', 'F250'],
  ['Ford', 'F350'],
  ['Ford', 'F450'],
  ['GMC', 'Canyon'],
  ['GMC', 'Yukon'],
  ['GMC', 'Sierra'],
  ['GMC', 'Acadia'],
  ['GMC', 'Terrain'],
  ['GMC', 'Savana'],
  ['GMC', 'Savana 1500'],
  ['GMC', 'Savana 2500'],
  ['GMC', 'Savana 3500'],
  ['GMC', 'Sierra 1500'],
  ['GMC', 'Sierra 2500'],
  ['GMC', 'Sierra 3500'],
  ['GMC', 'Yukon XL 1500'],
  ['GMC', 'Yukon XL 2500'],
  ['Saab', '9-3'],
  ['Volvo', 'C30'],
  ['Volvo', 'XC70'],
  ['Volvo', 'XC60'],
  ['Volvo', 'XC90'],
  ['Volvo', 'C70'],
  ['Volvo', 'S80'],
  ['Volvo', 'S60'],
  ['Chevrolet', 'Corvette'],
  ['Chevrolet', 'Colorado'],
  ['Chevrolet', 'Volt'],
  ['Chevrolet', 'Express'],
  ['Chevrolet', 'Sonic'],
  ['Chevrolet', 'Camaro'],
  ['Chevrolet', 'Cruze'],
  ['Chevrolet', 'Malibu'],
  ['Chevrolet', 'Traverse'],
  ['Chevrolet', 'Equinox'],
  ['Chevrolet', 'Impala'],
  ['Chevrolet', 'Avalanche'],
  ['Chevrolet', 'Express 1500'],
  ['Chevrolet', 'Express 2500'],
  ['Chevrolet', 'Express 3500'],
  ['Chevrolet', 'Silverado 1500'],
  ['Chevrolet', 'Silverado 2500'],
  ['Chevrolet', 'Silverado 3500'],
  ['Chevrolet', 'Suburban 1500'],
  ['Chevrolet', 'Suburban 2500'],
  ['Chevrolet', 'Tahoe'],
  ['MINI', 'Cooper'],
  ['MINI', 'Countryman'],
  ['MINI', 'Clubman'],
  ['MINI', 'Cooper Clubman'],
  ['MINI', 'Cooper Countryman'],
  ['BMW', '1 Series'],
  ['BMW', '3 Series'],
  ['BMW', '5 Series'],
  ['BMW', '6 Series'],
  ['BMW', '7 Series'],
  ['BMW', 'M3'],
  ['BMW', 'X3'],
  ['BMW', 'X5'],
  ['BMW', 'X5 M'],
  ['BMW', 'X6'],
  ['BMW', 'X6 M'],
  ['BMW', 'Z4'],
  ['Lincoln', 'MKX'],
  ['Lincoln', 'Navigator'],
  ['Lincoln', 'MKS'],
  ['Lincoln', 'MKT'],
  ['Lincoln', 'MKZ'],
  ['Lincoln', 'Navigator L'],
  ['Toyota', '4Runner'],
  ['Toyota', 'Highlander'],
  ['Toyota', 'Yaris'],
  ['Toyota', 'Prius v'],
  ['Toyota', 'FJ Cruiser'],
  ['Toyota', 'Camry Hybrid'],
  ['Toyota', 'Sequoia'],
  ['Toyota', 'RAV4'],
  ['Toyota', 'Sienna'],
  ['Toyota', 'Camry'],
  ['Toyota', 'Prius Plug-in Hybrid'],
  ['Toyota', 'Avalon'],
  ['Toyota', 'Corolla'],
  ['Toyota', 'Matrix'],
  ['Toyota', 'Prius'],
  ['Toyota', 'Prius c'],
  ['Toyota', 'Prius Plug-in'],
  ['Toyota', 'Tacoma'],
  ['Toyota', 'TundraMax'],
  ['Toyota', 'Tundra'],
  ['Toyota', 'Venza'],
  ['Acura', 'ZDX'],
  ['Acura', 'MDX'],
  ['Acura', 'TSX'],
  ['Acura', 'TL'],
  ['Acura', 'RL'],
  ['Acura', 'RDX'],
  ['Mercedes-Benz', 'G-Class'],
  ['Mercedes-Benz', 'CLS-Class'],
  ['Mercedes-Benz', 'GL-Class'],
  ['Mercedes-Benz', 'E-Class'],
  ['Mercedes-Benz', 'GLK-Class'],
  ['Mercedes-Benz', 'SLS AMG'],
  ['Mercedes-Benz', 'S-Class'],
  ['Mercedes-Benz', 'CL-Class'],
  ['Mercedes-Benz', 'C-Class'],
  ['Mercedes-Benz', 'SL-Class'],
  ['Mercedes-Benz', 'M-Class'],
  ['Mercedes-Benz', 'R-Class'],
  ['Mercedes-Benz', 'SLK-Class'],
  ['Mercedes-Benz', 'SLS-Class'],
  ['Mercedes-Benz', 'Sprinter 2500'],
  ['Mercedes-Benz', 'Sprinter 3500'],
  ['Infiniti', 'FX'],
  ['Infiniti', 'M'],
  ['Infiniti', 'G37'],
  ['Infiniti', 'G25'],
  ['Infiniti', 'QX56'],
  ['Infiniti', 'IPL G'],
  ['Infiniti', 'EX'],
  ['Infiniti', 'G'],
  ['Infiniti', 'QX'],
  ['Aston Martin', 'DBS'],
  ['Aston Martin', 'DB9'],
  ['Aston Martin', 'V12 Vantage'],
  ['Aston Martin', 'Virage'],
  ['Aston Martin', 'V8 Vantage'],
  ['Aston Martin', 'Rapide'],
  ['Aston Martin', 'V8 Vantage S'],
  ['Lexus', 'RX'],
  ['Lexus', 'LS'],
  ['Lexus', 'IS'],
  ['Lexus', 'IS-F'],
  ['Lexus', 'CT'],
  ['Lexus', 'RX Hybrid'],
  ['Lexus', 'LS Hybrid'],
  ['Lexus', 'ES'],
  ['Lexus', 'LFA'],
  ['Lexus', 'HS'],
  ['Lexus', 'GX'],
  ['FIAT', '500'],
  ['Fiat', 'Nuova 500'],
  ['Dodge', 'Avenger'],
  ['Dodge', 'Caravan'],
  ['Dodge', 'Charger'],
  ['Dodge', 'Challenger'],
  ['Dodge', 'Caliber'],
  ['Dodge', 'Durango'],
  ['Dodge', 'Journey'],
  ['Dodge', 'Grand Caravan'],
  ['Suzuki', 'Kizashi'],
  ['Suzuki', 'Grand Vitara'],
  ['Suzuki', 'Equator'],
  ['Suzuki', 'SX4'],
  ['Subaru', 'Legacy'],
  ['Subaru', 'Impreza'],
  ['Subaru', 'Forester'],
  ['Subaru', 'Tribeca'],
  ['Subaru', 'Outback'],
  ['Ferrari', '458 Italia'],
  ['Ferrari', 'FF'],
  ['Smart', 'Fortwo'],
  ['Jaguar', 'XF'],
  ['Jaguar', 'XK'],
  ['Jaguar', 'XJ'],
  ['Jeep', 'Wrangler'],
  ['Jeep', 'Compass'],
  ['Jeep', 'Grand Cherokee'],
  ['Jeep', 'Patriot'],
  ['Jeep', 'Liberty'],
  ['Mazda', 'Mazda5'],
  ['Mazda', 'Mazda2'],
  ['Mazda', 'CX-9'],
  ['Mazda', 'MX-5'],
  ['Mazda', 'Mazda6'],
  ['Mazda', 'Mazda3'],
  ['Mazda', 'Mazdaspeed 3'],
  ['Mazda', 'CX-7'],
  ['Mazda', 'Miata MX-5'],
  ['Lamborghini', 'Gallardo'],
  ['Lamborghini', 'Aventador'],
  ['Tesla', 'Model S'],
  ['Tesla', 'Roadster'],
  ['Buick', 'Verano'],
  ['Buick', 'LaCrosse'],
  ['Buick', 'Regal'],
  ['Buick', 'Enclave'],
  ['Chrysler', '200'],
  ['Chrysler', '300'],
  ['Chrysler', 'Town & Country'],
  ['Kia', 'Sportage'],
  ['Kia', 'Forte'],
  ['Kia', 'Optima'],
  ['Kia', 'Sedona'],
  ['Kia', 'Soul'],
  ['Kia', 'Sorento'],
  ['Kia', 'Rio'],
  ['Lotus', 'Exige'],
  ['Lotus', 'Evora'],
  ['Bentley', 'Continental GT'],
  ['Bentley', 'Mulsanne'],
  ['Bentley', 'Continental GTC'],
  ['Bentley', 'Continental Flying Spur'],
  ['Bentley', 'Continental Super'],
  ['Bentley', 'Continental'],
  ['Mitsubishi', 'Galant'],
  ['Mitsubishi', 'Eclipse'],
  ['Mitsubishi', 'Outlander'],
  ['Mitsubishi', 'i-MiEV'],
  ['Mitsubishi', 'Lancer'],
  ['Mitsubishi', 'Outlander Sport'],
  ['Scion', 'xB'],
  ['Scion', 'tC'],
  ['Scion', 'iQ'],
  ['Scion', 'xD'],
  ['Rolls-Royce', 'Ghost'],
  ['Rolls-Royce', 'Phantom'],
  ['Maserati', 'GranTurismo'],
  ['Maserati', 'Quattroporte'],
  ['Maybach', '57'],
  ['Maybach', '62'],
  ['Maybach', 'Landaulet'],
  ['McLaren', 'MP4-12C'],
  ['Ram', '1500'],
  ['Ram', '2500'],
  ['Ram', '3500'],
  ['Ram', 'C/V'],
  ['Ford', 'Taurus'],
  ['Ford', 'C-MAX Hybrid'],
  ['Ford', 'Edge'],
  ['Ford', 'Escape'],
  ['Ford', 'Explorer'],
  ['Ford', 'Fiesta'],
  ['Ford', 'Flex'],
  ['Ford', 'Focus'],
  ['Ford', 'Focus ST'],
  ['Ford', 'Fusion'],
  ['Ford', 'Mustang'],
  ['Ford', 'Transit Connect'],
  ['Hyundai', 'Veloster'],
  ['Hyundai', 'Accent'],
  ['Hyundai', 'Elantra'],
  ['Hyundai', 'Equus'],
  ['Hyundai', 'Genesis Coupe'],
  ['Hyundai', 'Sonata'],
  ['Chevrolet', 'Cruze'],
  ['Chevrolet', 'Malibu'],
  ['Chevrolet', 'Tahoe'],
  ['Audi', 'S4'],
  ['BMW', 'X5'],
  ['BMW', 'X5 M'],
  ['BMW', 'X6'],
  ['BMW', 'X6 M'],
  ['GMC', 'Sierra 1500'],
  ['GMC', 'Yukon'],
  ['GMC', 'Yukon XL 1500'],
  ['GMC', 'Yukon XL 2500'],
  ['Infiniti', 'JX'],
  ['Jaguar', 'XK Series'],
  ['Kia', 'Rio'],
  ['Kia', 'Sorento'],
  ['Lexus', 'GS'],
  ['Lexus', 'LX'],
  ['Lexus', 'RX'],
  ['Lincoln', 'MKS'],
  ['Lincoln', 'MKT'],
  ['Lincoln', 'MKX'],
  ['Mazda', 'CX-5'],
  ['Mazda', 'MAZDA6'],
  ['Nissan', 'Altima'],
  ['Nissan', 'GT-R'],
  ['Porsche', '911'],
  ['Porsche', 'Boxster'],
  ['Porsche', 'Cayenne'],
  ['Porsche', 'Panamera'],
  ['Rolls-Royce', 'Phantom'],
  ['Scion', 'FR-S'],
  ['Scion', 'tC'],
  ['Subaru', 'BRZ'],
  ['Toyota', 'Land Cruiser'],
  ['Toyota', 'Venza'],
  ['Volkswagen', 'CC'],
  ['Volvo', 'C30'],
  ['Volvo', 'C70'],
  ['Volvo', 'S60'],
  ['Volvo', 'XC90']
]

# Create `Make` and `Model` records based on the data above
makes_and_models.each do |vehicle_info|
  make = Make.where(name: vehicle_info[0]).first_or_create!
  Model.where(name: vehicle_info[1], make_id: make.id).first_or_create!
end

# Create `Options` for specific makes and models
# I'm just making this up for some sample data

# Create an "All wheel drive" option for all Subaru makes
subaru = Make.where(name: 'Subaru').first
awd = Option.where(name: 'All wheel drive').first_or_create!
subaru.models.each do |model|
  model.options.create!(option: awd)
end

# Create a seat warmer for all Lexus models
lexus = Make.where(name: 'Lexus').first
seat_warmers = Option.where(name: 'Seat warmers').first_or_create!
lexus.models.each do |model|
  model.model_options.create!(option: seat_warmers)
end

# Create a sun roof option only for Ford F150, F250, F350, and F450
ford = Make.where(name: 'Ford').first
['F150', 'F250', 'F350', 'F450'].each do |model_name|
  model = ford.models.where(name: model_name).first
  model.model_options.create!(name: 'Sun roof')
end