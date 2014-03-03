ALL_CATEGORIES = JSON.parse(File.open(Rails.root.join('config/factual_taxonomy.json')).read)

FACTUAL_CATEGORIES = {}

fetch_children = Proc.new { |parent_id, parent_label|
  ALL_CATEGORIES.select do |id, category|
    category['parents'].include? parent_id
  end.each do |id, category|
    label = "#{parent_label + '>' if parent_label}#{category['labels']['en']}"
    FACTUAL_CATEGORIES[label] = id
    fetch_children.call(id, label)
  end
}

fetch_children.call('1', nil)

RETAIL_CATEGORIES = FACTUAL_CATEGORIES.select { |key, val| key =~ /^Retail/ }

# {"Automotive"=>"2"}
# {"Automotive>Car Appraisers"=>"3"}
# {"Automotive>Car Dealers and Leasing"=>"4"}
# {"Automotive>Car Dealers and Leasing>Used Cars"=>"5"}
# {"Automotive>Car Parts and Accessories"=>"6"}
# {"Automotive>Car Wash and Detail"=>"7"}
# {"Automotive>Classic and Antique Car"=>"8"}
# {"Automotive>Maintenance and Repair"=>"9"}
# {"Automotive>Maintenance and Repair>Oil and Lube"=>"10"}
# {"Automotive>Maintenance and Repair>Smog Check"=>"11"}
# {"Automotive>Maintenance and Repair>Tires"=>"12"}
# {"Automotive>Maintenance and Repair>Transmissions"=>"13"}
# {"Automotive>Motorcycles, Mopeds and Scooters"=>"14"}
# {"Automotive>Motorcycles, Mopeds and Scooters>Repair"=>"15"}
# {"Automotive>Motorcycles, Mopeds and Scooters>Sales"=>"16"}
# {"Automotive>RVs and Motor Homes"=>"17"}
# {"Automotive>Salvage Yards"=>"18"}
# {"Automotive>Towing"=>"19"}
# {"Community and Government"=>"20"}
# {"Community and Government>Animal Shelters and Humane Societies"=>"21"}
# {"Community and Government>Cemeteries"=>"22"}
# {"Community and Government>Day Care and Preschools"=>"23"}
# {"Community and Government>Disabled Persons Services"=>"24"}
# {"Community and Government>Drug and Alcohol Services"=>"25"}
# {"Community and Government>Education"=>"26"}
# {"Community and Government>Education>Adult Education"=>"27"}
# {"Community and Government>Education>Art Lessons and Schools"=>"28"}
# {"Community and Government>Education>Colleges and Universities"=>"29"}
# {"Community and Government>Education>Computer Training"=>"30"}
# {"Community and Government>Education>Culinary Lessons and Schools"=>"31"}
# {"Community and Government>Education>Driving Schools"=>"32"}
# {"Community and Government>Education>Fraternities and Sororities"=>"33"}
# {"Community and Government>Education>Primary and Secondary Schools"=>"34"}
# {"Community and Government>Education>Tutoring and Educational Services"=>"35"}
# {"Community and Government>Education>Vocational Schools"=>"36"}
# {"Community and Government>Government Departments and Agencies"=>"37"}
# {"Community and Government>Government Departments and Agencies>Embassies"=>"453"}
# {"Community and Government>Government Lobbyists"=>"38"}
# {"Community and Government>Housing Assistance and Shelters"=>"39"}
# {"Community and Government>Law Enforcement and Public Safety"=>"40"}
# {"Community and Government>Law Enforcement and Public Safety>Rescue Services"=>"41"}
# {"Community and Government>Law Enforcement and Public Safety>Fire Stations"=>"42"}
# {"Community and Government>Law Enforcement and Public Safety>Police Stations"=>"43"}
# {"Community and Government>Libraries"=>"44"}
# {"Community and Government>Military"=>"45"}
# {"Community and Government>Military>Bases"=>"46"}
# {"Community and Government>Organizations and Associations"=>"47"}
# {"Community and Government>Organizations and Associations>Charities and Non-Profits"=>"48"}
# {"Community and Government>Organizations and Associations>Environmental"=>"49"}
# {"Community and Government>Organizations and Associations>Youth Organizations"=>"50"}
# {"Community and Government>Post Offices"=>"51"}
# {"Community and Government>Public and Social Services"=>"52"}
# {"Community and Government>Religious"=>"53"}
# {"Community and Government>Religious>Buddhist Temples"=>"54"}
# {"Community and Government>Religious>Churches"=>"55"}
# {"Community and Government>Religious>Hindu Temples"=>"56"}
# {"Community and Government>Religious>Mosques"=>"57"}
# {"Community and Government>Religious>Synagogues"=>"58"}
# {"Community and Government>Senior Citizen Services"=>"59"}
# {"Community and Government>Senior Citizen Services>Retirement"=>"60"}
# {"Community and Government>Utility Companies"=>"61"}
# {"Healthcare"=>"62"}
# {"Healthcare>AIDS Resources"=>"63"}
# {"Healthcare>Assisted Living Services"=>"64"}
# {"Healthcare>Assisted Living Services>Caretakers"=>"65"}
# {"Healthcare>Assisted Living Services>Facilities and Nursing Homes"=>"66"}
# {"Healthcare>Blood Banks and Centers"=>"67"}
# {"Healthcare>Chiropractors"=>"68"}
# {"Healthcare>Dentists"=>"69"}
# {"Healthcare>Emergency Services"=>"70"}
# {"Healthcare>Emergency Services>Ambulance"=>"71"}
# {"Healthcare>Holistic, Alternative and Naturopathic Medicine"=>"72"}
# {"Healthcare>Holistic, Alternative and Naturopathic Medicine>Acupuncture"=>"73"}
# {"Healthcare>Hospitals, Clinics and Medical Centers"=>"74"}
# {"Healthcare>Medical Supplies and Labs"=>"75"}
# {"Healthcare>Mental Health"=>"76"}
# {"Healthcare>Mental Health>Counseling and Therapy"=>"77"}
# {"Healthcare>Mental Health>Psychologists"=>"78"}
# {"Healthcare>Nurses"=>"79"}
# {"Healthcare>Pharmacies"=>"80"}
# {"Healthcare>Physical Therapy and Rehabilitation"=>"81"}
# {"Healthcare>Physical Therapy and Rehabilitation>Sports Medicine"=>"82"}
# {"Healthcare>Physicians"=>"83"}
# {"Healthcare>Physicians>Anesthesiologists"=>"84"}
# {"Healthcare>Physicians>Cardiologists"=>"85"}
# {"Healthcare>Physicians>Dermatologists"=>"86"}
# {"Healthcare>Physicians>Ear, Nose and Throat"=>"87"}
# {"Healthcare>Physicians>Family Medicine"=>"88"}
# {"Healthcare>Physicians>Gastroenterologists"=>"89"}
# {"Healthcare>Physicians>General Surgery"=>"90"}
# {"Healthcare>Physicians>Internal Medicine"=>"91"}
# {"Healthcare>Physicians>Neurologists"=>"92"}
# {"Healthcare>Physicians>Obstetricians and Gynecologists"=>"93"}
# {"Healthcare>Physicians>Oncologists"=>"94"}
# {"Healthcare>Physicians>Ophthalmologists"=>"95"}
# {"Healthcare>Physicians>Orthopedic Surgeons"=>"96"}
# {"Healthcare>Physicians>Pathologists"=>"97"}
# {"Healthcare>Physicians>Pediatricians"=>"98"}
# {"Healthcare>Physicians>Plastic Surgeons"=>"99"}
# {"Healthcare>Physicians>Psychiatrists"=>"100"}
# {"Healthcare>Physicians>Radiologists"=>"101"}
# {"Healthcare>Physicians>Respiratory"=>"102"}
# {"Healthcare>Physicians>Urologists"=>"103"}
# {"Healthcare>Physicians>Geriatrics"=>"441"}
# {"Healthcare>Podiatrists"=>"104"}
# {"Healthcare>Pregnancy and Sexual Health"=>"105"}
# {"Healthcare>Weight Loss and Nutritionists"=>"106"}
# {"Landmarks"=>"107"}
# {"Landmarks>Buildings and Structures"=>"108"}
# {"Landmarks>Gardens"=>"109"}
# {"Landmarks>Historic and Protected Sites"=>"110"}
# {"Landmarks>Monuments and Memorials"=>"111"}
# {"Landmarks>Natural"=>"112"}
# {"Landmarks>Natural>Beaches"=>"113"}
# {"Landmarks>Natural>Mountains"=>"114"}
# {"Landmarks>Natural>Forests"=>"115"}
# {"Landmarks>Natural>Lakes"=>"116"}
# {"Landmarks>Natural>Rivers"=>"117"}
# {"Landmarks>Parks"=>"118"}
# {"Landmarks>Parks>Natural Parks"=>"119"}
# {"Landmarks>Parks>Picnic Areas"=>"120"}
# {"Landmarks>Parks>Playgrounds"=>"121"}
# {"Landmarks>Parks>Urban Parks"=>"122"}
# {"Retail"=>"123"}
# {"Retail>Adult"=>"124"}
# {"Retail>Antiques"=>"125"}
# {"Retail>Arts and Crafts"=>"126"}
# {"Retail>Auctions"=>"127"}
# {"Retail>Beauty Products"=>"128"}
# {"Retail>Bicycles"=>"129"}
# {"Retail>Bookstores"=>"130"}
# {"Retail>Cards and Stationery"=>"131"}
# {"Retail>Children"=>"132"}
# {"Retail>Computers and Electronics"=>"133"}
# {"Retail>Computers and Electronics>Cameras"=>"134"}
# {"Retail>Computers and Electronics>Mobile Phones"=>"135"}
# {"Retail>Computers and Electronics>Video Games"=>"136"}
# {"Retail>Construction Supplies"=>"137"}
# {"Retail>Convenience Stores"=>"138"}
# {"Retail>Costumes"=>"139"}
# {"Retail>Dance and Music"=>"140"}
# {"Retail>Department Stores"=>"141"}
# {"Retail>Fashion"=>"142"}
# {"Retail>Fashion>Clothing and Accessories"=>"143"}
# {"Retail>Fashion>Jewelry and Watches"=>"144"}
# {"Retail>Fashion>Shoes"=>"145"}
# {"Retail>Fashion>Swimwear"=>"146"}
# {"Retail>Flea Markets"=>"147"}
# {"Retail>Florists"=>"148"}
# {"Retail>Food and Beverage"=>"149"}
# {"Retail>Food and Beverage>Beer, Wine and Spirits"=>"150"}
# {"Retail>Food and Beverage>Candy Stores"=>"151"}
# {"Retail>Food and Beverage>Cheese"=>"152"}
# {"Retail>Food and Beverage>Chocolate"=>"153"}
# {"Retail>Food and Beverage>Farmers' Markets"=>"154"}
# {"Retail>Food and Beverage>Health and Diet Food"=>"155"}
# {"Retail>Food and Beverage>Kosher"=>"156"}
# {"Retail>Food and Beverage>Meat and Seafood"=>"443"}
# {"Retail>Furniture and Decor"=>"157"}
# {"Retail>Gift and Novelty"=>"158"}
# {"Retail>Glasses and Optometrist"=>"159"}
# {"Retail>Hobby and Collectibles"=>"160"}
# {"Retail>Luggage"=>"161"}
# {"Retail>Music, Video and DVD"=>"162"}
# {"Retail>Newsstands"=>"163"}
# {"Retail>Nurseries and Garden Centers"=>"164"}
# {"Retail>Outlet"=>"165"}
# {"Retail>Pawn Shops"=>"166"}
# {"Retail>Pets"=>"167"}
# {"Retail>Photos and Frames"=>"168"}
# {"Retail>Shopping Centers and Malls"=>"169"}
# {"Retail>Sporting Goods"=>"170"}
# {"Retail>Supermarkets and Groceries"=>"171"}
# {"Retail>Tobacco"=>"172"}
# {"Retail>Toys"=>"173"}
# {"Retail>Vintage and Thrift"=>"174"}
# {"Retail>Warehouses and Wholesale Stores"=>"175"}
# {"Retail>Wedding and Bridal"=>"176"}
# {"Retail>Home Appliances"=>"248"}
# {"Retail>Housewares"=>"250"}
# {"Retail>Discount Stores"=>"442"}
# {"Retail>Office Supplies"=>"444"}
# {"Retail>Party Supplies"=>"445"}
# {"Services and Supplies"=>"177"}
# {"Services and Supplies>Business and Strategy Consulting"=>"178"}
# {"Services and Supplies>Industrial Machinery and Vehicles"=>"179"}
# {"Services and Supplies>Logging and Sawmills"=>"180"}
# {"Services and Supplies>Metals"=>"181"}
# {"Services and Supplies>Packaging"=>"182"}
# {"Services and Supplies>Petroleum"=>"183"}
# {"Services and Supplies>Plastics"=>"184"}
# {"Services and Supplies>Refrigeration and Ice"=>"185"}
# {"Services and Supplies>Rubber"=>"186"}
# {"Services and Supplies>Scientific"=>"187"}
# {"Services and Supplies>Security and Safety"=>"188"}
# {"Services and Supplies>Telecommunication Services"=>"189"}
# {"Services and Supplies>Textiles"=>"190"}
# {"Services and Supplies>Water and Waste Management"=>"191"}
# {"Services and Supplies>Welding"=>"192"}
# {"Services and Supplies>Advertising and Marketing"=>"193"}
# {"Services and Supplies>Advertising and Marketing>Advertising Agencies and Media Buyers"=>"194"}
# {"Services and Supplies>Advertising and Marketing>Creative Services"=>"195"}
# {"Services and Supplies>Advertising and Marketing>Direct Mail and Email Marketing Services"=>"196"}
# {"Services and Supplies>Advertising and Marketing>Market Research and Consulting"=>"197"}
# {"Services and Supplies>Advertising and Marketing>Online Advertising"=>"198"}
# {"Services and Supplies>Advertising and Marketing>Print, TV, Radio and Outdoor Advertising"=>"199"}
# {"Services and Supplies>Advertising and Marketing>Promotional Items"=>"200"}
# {"Services and Supplies>Advertising and Marketing>Public Relations"=>"201"}
# {"Services and Supplies>Advertising and Marketing>Search Engine Marketing and Optimization"=>"202"}
# {"Services and Supplies>Advertising and Marketing>Writing, Copywriting and Technical Writing"=>"203"}
# {"Services and Supplies>Agriculture and Forestry"=>"204"}
# {"Services and Supplies>Art Restoration"=>"205"}
# {"Services and Supplies>Audiovisual"=>"206"}
# {"Services and Supplies>Automation and Control Systems"=>"207"}
# {"Services and Supplies>Chemicals and Gasses"=>"208"}
# {"Services and Supplies>Computers"=>"209"}
# {"Services and Supplies>Corporate HQ"=>"210"}
# {"Services and Supplies>Electrical Equipment"=>"211"}
# {"Services and Supplies>Employment Agencies"=>"212"}
# {"Services and Supplies>Engineering"=>"213"}
# {"Services and Supplies>Entertainment"=>"214"}
# {"Services and Supplies>Entertainment>Media"=>"215"}
# {"Services and Supplies>Equipment Rental"=>"216"}
# {"Services and Supplies>Events and Event Planning"=>"217"}
# {"Services and Supplies>Financial"=>"219"}
# {"Services and Supplies>Financial>Accounting and Bookkeeping"=>"220"}
# {"Services and Supplies>Financial>Banking and Finance"=>"221"}
# {"Services and Supplies>Financial>Banking and Finance>ATMs"=>"218"}
# {"Services and Supplies>Financial>Business Brokers and Franchises"=>"222"}
# {"Services and Supplies>Financial>Check Cashing"=>"223"}
# {"Services and Supplies>Financial>Collections"=>"224"}
# {"Services and Supplies>Financial>Financial Planning and Investments"=>"225"}
# {"Services and Supplies>Financial>Fund Raising"=>"226"}
# {"Services and Supplies>Financial>Loans and Mortgages"=>"227"}
# {"Services and Supplies>Financial>Stock Brokers"=>"228"}
# {"Services and Supplies>Financial>Student Aid and Grants"=>"229"}
# {"Services and Supplies>Food and Beverage"=>"230"}
# {"Services and Supplies>Food and Beverage>Catering"=>"231"}
# {"Services and Supplies>Food and Beverage>Distribution"=>"232"}
# {"Services and Supplies>Funeral Services"=>"233"}
# {"Services and Supplies>Geological"=>"234"}
# {"Services and Supplies>Home Improvement"=>"235"}
# {"Services and Supplies>Home Improvement>Architects"=>"236"}
# {"Services and Supplies>Home Improvement>Carpenters"=>"237"}
# {"Services and Supplies>Home Improvement>Carpet and Flooring"=>"238"}
# {"Services and Supplies>Home Improvement>Contractors"=>"239"}
# {"Services and Supplies>Home Improvement>Contractors>Bathrooms"=>"240"}
# {"Services and Supplies>Home Improvement>Contractors>Deck and Patio"=>"241"}
# {"Services and Supplies>Home Improvement>Contractors>Sewer"=>"242"}
# {"Services and Supplies>Home Improvement>Doors and Windows"=>"243"}
# {"Services and Supplies>Home Improvement>Electricians"=>"244"}
# {"Services and Supplies>Home Improvement>Fences, Fireplaces and Garage Doors"=>"245"}
# {"Services and Supplies>Home Improvement>Hardware and Services"=>"246"}
# {"Services and Supplies>Home Improvement>Heating, Ventilating and Air Conditioning"=>"247"}
# {"Services and Supplies>Home Improvement>Home Inspection Services"=>"249"}
# {"Services and Supplies>Home Improvement>Interior Design"=>"251"}
# {"Services and Supplies>Home Improvement>Kitchens"=>"252"}
# {"Services and Supplies>Home Improvement>Landscaping and Gardeners"=>"253"}
# {"Services and Supplies>Home Improvement>Lighting Fixtures"=>"254"}
# {"Services and Supplies>Home Improvement>Movers"=>"256"}
# {"Services and Supplies>Home Improvement>Painting"=>"257"}
# {"Services and Supplies>Home Improvement>Pest Control"=>"258"}
# {"Services and Supplies>Home Improvement>Plumbing"=>"259"}
# {"Services and Supplies>Home Improvement>Pools and Spas"=>"260"}
# {"Services and Supplies>Home Improvement>Roofers"=>"261"}
# {"Services and Supplies>Home Improvement>Swimming Pool Maintenance and Services"=>"263"}
# {"Services and Supplies>Home Improvement>Tree Service"=>"264"}
# {"Services and Supplies>Home Improvement>Upholstery"=>"265"}
# {"Services and Supplies>Storage"=>"262"}
# {"Services and Supplies>Human Resources"=>"266"}
# {"Services and Supplies>Import and Export"=>"267"}
# {"Services and Supplies>Leather"=>"268"}
# {"Services and Supplies>Legal"=>"269"}
# {"Services and Supplies>Legal>Credit Counseling and Bankruptcy Services"=>"270"}
# {"Services and Supplies>Legal>Immigration"=>"271"}
# {"Services and Supplies>Legal>Notary"=>"448"}
# {"Services and Supplies>Insurance"=>"272"}
# {"Services and Supplies>Machine Shops"=>"273"}
# {"Services and Supplies>Management"=>"274"}
# {"Services and Supplies>Manufacturing"=>"275"}
# {"Services and Supplies>Paper"=>"276"}
# {"Services and Supplies>Personal Care"=>"277"}
# {"Services and Supplies>Personal Care>Dry Cleaning, Ironing and Laundry"=>"278"}
# {"Services and Supplies>Personal Care>Hair Removal"=>"279"}
# {"Services and Supplies>Personal Care>Beauty Salons and Barbers"=>"280"}
# {"Services and Supplies>Personal Care>Manicures and Pedicures"=>"281"}
# {"Services and Supplies>Personal Care>Massage Clinics and Therapists"=>"282"}
# {"Services and Supplies>Personal Care>Piercing"=>"283"}
# {"Services and Supplies>Personal Care>Skin Care"=>"284"}
# {"Services and Supplies>Personal Care>Spas"=>"285"}
# {"Services and Supplies>Personal Care>Tanning Salons"=>"286"}
# {"Services and Supplies>Personal Care>Tattooing"=>"287"}
# {"Services and Supplies>Printing, Copying and Signage"=>"288"}
# {"Services and Supplies>Professional Cleaning"=>"289"}
# {"Services and Supplies>Publishing"=>"290"}
# {"Services and Supplies>Real Estate"=>"291"}
# {"Services and Supplies>Real Estate>Mobile Homes"=>"255"}
# {"Services and Supplies>Real Estate>Property Management"=>"292"}
# {"Services and Supplies>Real Estate>Real Estate Agents"=>"293"}
# {"Services and Supplies>Real Estate>Real Estate Appraiser"=>"294"}
# {"Services and Supplies>Real Estate>Real Estate Development and Title Companies"=>"295"}
# {"Services and Supplies>Real Estate>Apartments, Condos, and Houses"=>"296"}
# {"Services and Supplies>Real Estate>Boarding Houses"=>"297"}
# {"Services and Supplies>Real Estate>Building and Land Surveyors"=>"298"}
# {"Services and Supplies>Real Estate>Commercial Real Estate"=>"299"}
# {"Services and Supplies>Real Estate>Corporate Housing"=>"300"}
# {"Services and Supplies>Renewable Energy"=>"301"}
# {"Services and Supplies>Repair Services"=>"302"}
# {"Services and Supplies>Shipping, Freight, and Material Transportation"=>"303"}
# {"Services and Supplies>Tailors"=>"304"}
# {"Services and Supplies>Veterinarians"=>"305"}
# {"Services and Supplies>Web Design and Development"=>"306"}
# {"Services and Supplies>Wholesale"=>"307"}
# {"Services and Supplies>Career Counseling"=>"446"}
# {"Services and Supplies>Construction"=>"447"}
# {"Services and Supplies>Photography"=>"449"}
# {"Services and Supplies>Translation Services"=>"450"}
# {"Services and Supplies>Technology"=>"460"}
# {"Services and Supplies>Technology>Infrastructure"=>"454"}
# {"Services and Supplies>Technology>Mobile"=>"455"}
# {"Services and Supplies>Technology>Advertising"=>"456"}
# {"Social"=>"308"}
# {"Social>Arts"=>"309"}
# {"Social>Arts>Art Dealers and Galleries"=>"310"}
# {"Social>Arts>Museums"=>"311"}
# {"Social>Bars"=>"312"}
# {"Social>Bars>Hotel Lounges"=>"313"}
# {"Social>Bars>Jazz and Blues Cafes"=>"314"}
# {"Social>Bars>Sports Bars"=>"315"}
# {"Social>Bars>Wine Bars"=>"316"}
# {"Social>Entertainment"=>"317"}
# {"Social>Entertainment>Adult"=>"318"}
# {"Social>Entertainment>Arcades and Amusement Parks"=>"319"}
# {"Social>Entertainment>Billiard and Pool"=>"320"}
# {"Social>Entertainment>Bingo"=>"321"}
# {"Social>Entertainment>Bowling"=>"322"}
# {"Social>Entertainment>Carnivals"=>"323"}
# {"Social>Entertainment>Casinos and Gaming"=>"324"}
# {"Social>Entertainment>Circuses"=>"325"}
# {"Social>Entertainment>Dance Halls and Saloons"=>"326"}
# {"Social>Entertainment>Fairgrounds and Rodeos"=>"327"}
# {"Social>Entertainment>Go Carts"=>"328"}
# {"Social>Entertainment>Hookah Lounges"=>"329"}
# {"Social>Entertainment>Karaoke"=>"330"}
# {"Social>Entertainment>Miniature Golf"=>"331"}
# {"Social>Entertainment>Movie Theatres"=>"332"}
# {"Social>Entertainment>Music and Show Venues"=>"333"}
# {"Social>Entertainment>Night Clubs"=>"334"}
# {"Social>Entertainment>Party Centers"=>"335"}
# {"Social>Entertainment>Psychics and Astrologers"=>"336"}
# {"Social>Entertainment>Ticket Sales"=>"337"}
# {"Social>Food and Dining"=>"338"}
# {"Social>Food and Dining>Bagels and Donuts"=>"339"}
# {"Social>Food and Dining>Bakeries"=>"340"}
# {"Social>Food and Dining>Breweries"=>"341"}
# {"Social>Food and Dining>Cafes, Coffee and Tea Houses"=>"342"}
# {"Social>Food and Dining>Dessert"=>"343"}
# {"Social>Food and Dining>Ice Cream Parlors"=>"344"}
# {"Social>Food and Dining>Internet Cafes"=>"345"}
# {"Social>Food and Dining>Juice Bars and Smoothies"=>"346"}
# {"Social>Food and Dining>Restaurants"=>"347"}
# {"Social>Food and Dining>Restaurants>American"=>"348"}
# {"Social>Food and Dining>Restaurants>Barbecue"=>"349"}
# {"Social>Food and Dining>Restaurants>Buffets"=>"350"}
# {"Social>Food and Dining>Restaurants>Burgers"=>"351"}
# {"Social>Food and Dining>Restaurants>Chinese"=>"352"}
# {"Social>Food and Dining>Restaurants>Delis"=>"353"}
# {"Social>Food and Dining>Restaurants>Diners"=>"354"}
# {"Social>Food and Dining>Restaurants>Fast Food"=>"355"}
# {"Social>Food and Dining>Restaurants>French"=>"356"}
# {"Social>Food and Dining>Restaurants>Indian"=>"357"}
# {"Social>Food and Dining>Restaurants>Italian"=>"358"}
# {"Social>Food and Dining>Restaurants>Japanese"=>"359"}
# {"Social>Food and Dining>Restaurants>Korean"=>"360"}
# {"Social>Food and Dining>Restaurants>Mexican"=>"361"}
# {"Social>Food and Dining>Restaurants>Middle Eastern"=>"362"}
# {"Social>Food and Dining>Restaurants>Pizza"=>"363"}
# {"Social>Food and Dining>Restaurants>Seafood"=>"364"}
# {"Social>Food and Dining>Restaurants>Steakhouses"=>"365"}
# {"Social>Food and Dining>Restaurants>Sushi"=>"366"}
# {"Social>Food and Dining>Restaurants>Thai"=>"367"}
# {"Social>Food and Dining>Restaurants>Vegan and Vegetarian"=>"368"}
# {"Social>Food and Dining>Restaurants>Asian"=>"457"}
# {"Social>Food and Dining>Restaurants>Food Trucks"=>"458"}
# {"Social>Social Clubs"=>"369"}
# {"Social>Wineries and Vineyards"=>"370"}
# {"Social>Zoos, Aquariums and Wildlife Sanctuaries"=>"371"}
# {"Sports and Recreation"=>"372"}
# {"Sports and Recreation>Athletic Fields"=>"373"}
# {"Sports and Recreation>Baseball"=>"374"}
# {"Sports and Recreation>Baseball>Batting Ranges"=>"375"}
# {"Sports and Recreation>Basketball"=>"376"}
# {"Sports and Recreation>Combat Sports"=>"377"}
# {"Sports and Recreation>Cycling"=>"378"}
# {"Sports and Recreation>Dance"=>"379"}
# {"Sports and Recreation>Equestrian"=>"380"}
# {"Sports and Recreation>Football"=>"381"}
# {"Sports and Recreation>Golf"=>"382"}
# {"Sports and Recreation>Golf>Golf Courses"=>"451"}
# {"Sports and Recreation>Gun Ranges"=>"383"}
# {"Sports and Recreation>Gymnastics"=>"384"}
# {"Sports and Recreation>Gyms and Fitness Centers"=>"385"}
# {"Sports and Recreation>Hockey"=>"386"}
# {"Sports and Recreation>Outdoors"=>"387"}
# {"Sports and Recreation>Outdoors>Campgrounds and RV Parks"=>"388"}
# {"Sports and Recreation>Outdoors>Hiking"=>"389"}
# {"Sports and Recreation>Outdoors>Hot Air Balloons"=>"390"}
# {"Sports and Recreation>Outdoors>Hunting and Fishing"=>"391"}
# {"Sports and Recreation>Outdoors>Rock Climbing"=>"392"}
# {"Sports and Recreation>Outdoors>Skydiving"=>"393"}
# {"Sports and Recreation>Paintball"=>"394"}
# {"Sports and Recreation>Personal Trainers"=>"395"}
# {"Sports and Recreation>Race Tracks"=>"396"}
# {"Sports and Recreation>Racquet Sports"=>"397"}
# {"Sports and Recreation>Racquet Sports>Racquetball"=>"398"}
# {"Sports and Recreation>Racquet Sports>Tennis"=>"399"}
# {"Sports and Recreation>Recreation Centers"=>"400"}
# {"Sports and Recreation>Running"=>"401"}
# {"Sports and Recreation>Skating"=>"402"}
# {"Sports and Recreation>Snow Sports"=>"403"}
# {"Sports and Recreation>Soccer"=>"404"}
# {"Sports and Recreation>Sports Clubs"=>"405"}
# {"Sports and Recreation>Stadiums and Arenas"=>"406"}
# {"Sports and Recreation>Swimming Pools"=>"407"}
# {"Sports and Recreation>Water Sports"=>"408"}
# {"Sports and Recreation>Water Sports>Boating"=>"409"}
# {"Sports and Recreation>Water Sports>Canoes and Kayaks"=>"410"}
# {"Sports and Recreation>Water Sports>Rafting"=>"411"}
# {"Sports and Recreation>Water Sports>Scuba Diving"=>"412"}
# {"Sports and Recreation>Water Sports>Swimming"=>"413"}
# {"Sports and Recreation>Water Sports>Surfing"=>"452"}
# {"Sports and Recreation>Yoga and Pilates"=>"414"}
# {"Transportation"=>"415"}
# {"Transportation>Airlines and Aviation Services"=>"416"}
# {"Transportation>Gas Stations"=>"417"}
# {"Transportation>Parking"=>"418"}
# {"Transportation>Public Transportation Services"=>"419"}
# {"Transportation>Taxi and Car Services"=>"420"}
# {"Transportation>Taxi and Car Services>Car and Truck Rentals"=>"421"}
# {"Transportation>Taxi and Car Services>Charter Buses"=>"422"}
# {"Transportation>Taxi and Car Services>Limos and Chauffeurs"=>"423"}
# {"Transportation>Transport Hubs"=>"424"}
# {"Transportation>Transport Hubs>Airports"=>"425"}
# {"Transportation>Transport Hubs>Bus Stations"=>"426"}
# {"Transportation>Transport Hubs>Heliports"=>"427"}
# {"Transportation>Transport Hubs>Ports"=>"428"}
# {"Transportation>Transport Hubs>Rail Stations"=>"429"}
# {"Transportation>Rest Areas"=>"459"}
# {"Travel"=>"430"}
# {"Travel>Cruises"=>"431"}
# {"Travel>Lodging"=>"432"}
# {"Travel>Lodging>Bed and Breakfasts"=>"433"}
# {"Travel>Lodging>Cottages and Cabins"=>"434"}
# {"Travel>Lodging>Hostels"=>"435"}
# {"Travel>Lodging>Hotels and Motels"=>"436"}
# {"Travel>Lodging>Lodges and Vacation Rentals"=>"437"}
# {"Travel>Lodging>Resorts"=>"438"}
# {"Travel>Tourist Information and Services"=>"439"}
# {"Travel>Travel Agents and Tour Operators"=>"440"}