import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kErrorColor = Color(0xFFE57373);
String accessToken = '';
var categoryList = [
  '3D',
  '3D Printing',
  '3D Technology',
  'Accounting',
  'Active Lifestyle',
  'Ad Targeting',
  'Adaptive Equipment',
  'Advanced Materials',
  'Adventure Travel',
  'Advertising',
  'Advertising Exchanges',
  'Advertising Networks',
  'Advertising Platforms',
  'Advice',
  'Aerospace',
  'Agriculture',
  'Air Pollution Control',
  'Algorithms',
  'All Markets',
  'All Students',
  'Alternative Medicine',
  'Alumni',
  'Analytics',
  'Android',
  'Angels',
  'Animal Feed',
  'Anything Capital Intensive',
  'App Discovery',
  'App Marketing',
  'App Stores',
  'Application Performance Monitoring',
  'Application Platforms',
  'Apps',
  'Aquaculture',
  'Architecture',
  'Archiving',
  'Art',
  'Artificial Intelligence',
  'Artists Globally',
  'Assisitive Technology',
  'Assisted Living',
  'Auctions',
  'Audio',
  'Audiobooks',
  'Augmented Reality',
  'Auto',
  'Automated Kiosk',
  'Automotive',
  'B2B',
  'B2B Express Delivery',
  'BPO Services',
  'Babies',
  'Baby Accessories',
  'Baby Boomers',
  'Baby Safety',
  'Banking',
  'Batteries',
  'Beauty',
  'Bicycles',
  'Big Data',
  'Big Data Analytics',
  'Billing',
  'Bio-Pharm',
  'Biofuels',
  'Bioinformatics',
  'Biomass Power Generation',
  'Biometrics',
  'Biotechnology',
  'Biotechnology and Semiconductor',
  'Bitcoin',
  'Blogging Platforms',
  'Boating Industry',
  'Brand Marketing',
  'Brewing',
  'Bridging Online and Offline',
  'Broadcasting',
  'Brokers',
  'Browser Extensions',
  'Building Owners',
  'Building Products',
  'Business Analytics',
  'Business Development',
  'Business Information Systems',
  'Business Intelligence',
  'Business Productivity',
  'Business Services',
  'Business Travelers',
  'CAD',
  'CRM',
  'Cable',
  'Call Center Automation',
  'Cannabis',
  'Carbon',
  'Career Management',
  'Career Planning',
  'Cars',
  'Casual Games',
  'Cause Marketing',
  'Celebrity',
  'Certification Test',
  'Charities',
  'Charity',
  'Charter Schools',
  'Chat',
  'Chemicals',
  'Child Care',
  'China Internet',
  'Civil Engineers',
  'Classifieds',
  'Clean Energy',
  'Clean Technology',
  'Clean Technology IT',
  'Clinical Trials',
  'Cloud Computing',
  'Cloud Data Services',
  'Cloud Infrastructure',
  'Cloud Management',
  'Cloud Security',
  'Cloud-Based Music',
  'Coffee',
  'Collaboration',
  'Collaborative Consumption',
  'Collectibles',
  'College Campuses',
  'College Recruiting',
  'Colleges',
  'Comics',
  'Commercial Real Estate',
  'Commercial Solar',
  'Commodities',
  'Communications Hardware',
  'Communications Infrastructure',
  'Communities',
  'Comparison Shopping',
  'Computer Vision',
  'Computers',
  'Concentrated Solar Power',
  'Concerts',
  'Console Gaming',
  'Construction',
  'Consulting',
  'Consumer Behavior',
  'Consumer Electronics',
  'Consumer Goods',
  'Consumer Internet',
  'Consumer Lending',
  'Consumers',
  'Contact Centers',
  'Contact Management',
  'Content',
  'Content Creators',
  'Content Delivery',
  'Content Discovery',
  'Content Syndication',
  'Contests',
  'Cooking',
  'Corporate IT',
  'Corporate Training',
  'Corporate Wellness',
  'Cosmetic Surgery',
  'Cosmetics',
  'Coupons',
  'Coworking',
  'Craft Beer',
  'Creative',
  'Creative Industries',
  'Credit',
  'Credit Cards',
  'Crowdfunding',
  'Crowdsourcing',
  'Curated Web',
  'Custom Retail',
  'Customer Service',
  'Customer Support Tools',
  'Cyber',
  'Cyber Security',
  'DIY',
  'DOD/Military',
  'Data Center Automation',
  'Data Center Infrastructure',
  'Data Centers',
  'Data Integration',
  'Data Mining',
  'Data Privacy',
  'Data Security',
  'Data Visualization',
  'Databases',
  'Debt Collecting',
  'Deep Information Technology',
  'Defense',
  'Delivery',
  'Demographies',
  'Dental',
  'Design',
  'Designers',
  'Developer APIs',
  'Developer Tools',
  'Development Platforms',
  'Diabetes',
  'Diagnostics',
  'Dietary Supplements',
  'Digital Entertainment',
  'Digital Media',
  'Digital Rights Management',
  'Digital Signage',
  'Direct Advertising',
  'Direct Marketing',
  'Direct Sales',
  'Discounts',
  'Displays',
  'Disruptive Models',
  'Distribution',
  'Distributors',
  'Doctors',
  'Document Management',
  'Domains',
  'Drones',
  'E-Books',
  'E-Commerce',
  'E-Commerce Platforms',
  'EBooks',
  'EDA Tools',
  'Early-Stage Technology',
  'EdTech',
  'Ediscovery',
  'Education',
  'Educational Games',
  'Edutainment',
  'Elder Care',
  'Electric Vehicles',
  'Electrical Distribution',
  'Electronic Health Records',
  'Electronics',
  'Email',
  'Email Marketing',
  'Email Newsletters',
  'Embedded Hardware and Software',
  'Emerging Markets',
  'Employer Benefits Programs',
  'Employment',
  'Energy',
  'Energy Efficiency',
  'Energy IT',
  'Energy Management',
  'Engineering Firms',
  'English-Speaking',
  'Enterprise 2.0',
  'Enterprise Application',
  'Enterprise Hardware',
  'Enterprise Purchasing',
  'Enterprise Resource Planning',
  'Enterprise Search',
  'Enterprise Security',
  'Enterprise Software',
  'Enterprises',
  'Entertainment',
  'Entertainment Industry',
  'Entrepreneur',
  'Environmental Innovation',
  'Estimation and Quoting',
  'Event Management',
  'Events',
  'Exercise',
  'Experience Design',
  'Eyewear',
  'Face Recognition',
  'Facebook Applications',
  'Families',
  'Fantasy Sports',
  'Farmers Market',
  'Farming',
  'Fashion',
  'Fertility',
  'Field Support Services',
  'File Sharing',
  'Film',
  'Film Distribution',
  'Film Production',
  'FinTech',
  'Finance',
  'Finance Technology',
  'Financial Exchanges',
  'Financial Services',
  'Fitness',
  'Flash Sales',
  'Flash Storage',
  'Fleet Management',
  'Flowers',
  'Fmcg',
  'Food Processing',
  'Forums',
  'Fraud Detection',
  'Freelancers',
  'Freemium',
  'FreetoPlay Gaming',
  'Fruit',
  'Fuel Cells',
  'Fuels',
  'Funeral Industry',
  'Furniture',
  'Gadget',
  'Gambling',
  'Game',
  'Game Mechanics',
  'Games',
  'Gamification',
  'Gas',
  'Gay & Lesbian',
  'General Public Worldwide',
  'Generation Y-Z',
  'Genetic Testing',
  'Geospatial',
  'Gift Card',
  'Gift Exchange',
  'Gift Registries',
  'Gold',
  'Golf Equipment',
  'Google Glass',
  'Governance',
  'Government Innovation',
  'Governments',
  'Gps',
  'Graphics',
  'Green',
  'Green Consumer Goods',
  'GreenTech',
  'Groceries',
  'Group Buying',
  'Group Email',
  'Group SMS',
  'Guides',
  'Handmade',
  'Hardware',
  'Hardware + Software',
  'Health Care',
  'Health Care Information Technology',
  'Health Diagnostics',
  'Health Services Industry',
  'Health and Insurance',
  'Health and Wellness',
  'Healthcare Services',
  'Heavy Industry',
  'Hedge Funds',
  'High School Students',
  'High Schools',
  'High Tech',
  'Home & Garden',
  'Home Automation',
  'Home Decor',
  'Home Owners',
  'Home Renovation',
  'Homeland Security',
  'Homeless Shelter',
  'Hospitality',
  'Hospitals',
  'Hotels',
  'Human Computer Interaction',
  'Human Resource Automation',
  'Human Resources',
  'Humanitarian',
  'ICT',
  'IT Management',
  'IT and Cybersecurity',
  'IaaS',
  'Identity',
  'Identity Management',
  'Image Recognition',
  'Impact Investing',
  'In-Flight Entertainment',
  'Incentives',
  'Incubators',
  'Independent Music Labels',
  'Independent Pharmacies',
  'Indians',
  'Indoor Positioning',
  'Industrial',
  'Industrial Automation',
  'Information Security',
  'Information Services',
  'Information Technology',
  'Infrastructure',
  'Infrastructure Builders',
  'Innovation Engineering',
  'Innovation Management',
  'Insurance',
  'Intellectual Asset Management',
  'Intellectual Property',
  'Intelligent Systems',
  'Interest Graph',
  'Interface Design',
  'Interior Design',
  'Internet',
  'Internet Infrastructure',
  'Internet Marketing',
  'Internet Radio Market',
  'Internet Service Providers',
  'Internet TV',
  'Internet Technology',
  'Internet of Things',
  'Investment Management',
  'Jewelry',
  'Journalism',
  'K-12 Education',
  'Kids',
  'Kinect',
  'Knowledge Management',
  'Landscaping',
  'Language Learning',
  'Lasers',
  'Law Enforcement',
  'Lead Generation',
  'Lead Management',
  'Legal',
  'Leisure',
  'Licensing',
  'Life Sciences',
  'Lifestyle',
  'Lifestyle Businesses',
  'Lifestyle Products',
  'Lighting',
  'Limousines',
  'Lingerie',
  'Linux',
  'Local',
  'Local Advertising',
  'Local Based Services',
  'Local Businesses',
  'Local Commerce',
  'Local Search',
  'Location Based Services',
  'Logistics',
  'Logistics Company',
  'Lotteries',
  'Loyalty Programs',
  'M2M',
  'Machine Learning',
  'Manufacturing',
  'Maps',
  'Market Research',
  'Marketing Automation',
  'Marketplaces',
  'Mass Customization',
  'Match-Making',
  'Material Science',
  'Mechanical Solutions',
  'Media',
  'Medical',
  'Medical Devices',
  'Medical Professionals',
  'Meeting Software',
  'Mens Specific',
  'Messaging',
  'Micro-Enterprises',
  'MicroBlogging',
  'Minerals',
  'Mining Technologies',
  'Mobile',
  'Mobile Advertising',
  'Mobile Analytics',
  'Mobile Commerce',
  'Mobile Devices',
  'Mobile Emergency&Health',
  'Mobile Enterprise',
  'Mobile Games',
  'Mobile Health',
  'Mobile Infrastructure',
  'Mobile Payments',
  'Mobile Security',
  'Mobile Shopping',
  'Mobile Social',
  'Mobile Software Tools',
  'Mobile Video',
  'Mobility',
  'Monetization',
  'Moneymaking',
  'Multi-level Marketing',
  'Music',
  'Music Education',
  'Music Services',
  'Music Venues',
  'Musical Instruments',
  'Musicians',
  'Nanotechnology',
  'Natural Gas Uses',
  'Natural Language Processing',
  'Natural Resources',
  'Navigation',
  'Network Security',
  'Networking',
  'Neuroscience',
  'New Product Development',
  'New Technologies',
  'News',
  'Nightlife',
  'Non Profit',
  'Non-Tech',
  'Nonprofits',
  'Nutrition',
  'Office Space',
  'Oil',
  'Oil & Gas',
  'Oil and Gas',
  'Online Dating',
  'Online Education',
  'Online Gaming',
  'Online Identity',
  'Online Rental',
  'Online Reservations',
  'Online Scheduling',
  'Online Shopping',
  'Online Travel',
  'Online Video Advertising',
  'Open Source',
  'Opinions',
  'Optical Communications',
  'Optimization',
  'Organic',
  'Organic Food',
  'Outdoors',
  'Outsourcing',
  'P2P Money Transfer',
  'PaaS',
  'Parenting',
  'Parking',
  'Payments',
  'Peer-to-Peer',
  'Performance Marketing',
  'Personal Branding',
  'Personal Data',
  'Personal Finance',
  'Personal Health',
  'Personalization',
  'Pervasive Computing',
  'Pets',
  'Pharmaceuticals',
  'Photo Editing',
  'Photo Sharing',
  'Photography',
  'Physical Security',
  'Physicians',
  'Plumbers',
  'Point of Sale',
  'Politics',
  'Polling',
  'Portals',
  'Postal and Courier Services',
  'Pre Seed',
  'Predictive Analytics',
  'Presentations',
  'Price Comparison',
  'Printing',
  'Privacy',
  'Private School',
  'Private Social Networking',
  'Procurement',
  'Product Design',
  'Product Development Services',
  'Product Search',
  'Productivity',
  'Productivity Software',
  'Professional Networking',
  'Professional Services',
  'Project Management',
  'Promotional',
  'Property Management',
  'Psychology',
  'Public Relations',
  'Public Safety',
  'Public Transportation',
  'Publishing',
  'Q&A',
  'QR Codes',
  'RFID',
  'Racing',
  'Rapidly Expanding',
  'Real Estate',
  'Real Estate Investors',
  'Real Time',
  'Realtors',
  'Recreation',
  'Recruiting',
  'Recycling',
  'Registrars',
  'Religion',
  'Renewable Energies',
  'Renewable Tech',
  'Rental Housing',
  'Reputation',
  'Resorts',
  'Restaurants',
  'Retail',
  'Retail Technology',
  'Retirement',
  'Reviews and Recommendations',
  'Ride Sharing',
  'Risk Management',
  'Robotics',
  'SEO',
  'SNS',
  'SaaS',
  'Sales Automation',
  'Sales and Marketing',
  'Search',
  'Search Marketing',
  'Security',
  'Semiconductor Manufacturing Equipment',
  'Semiconductors',
  'Senior Citizens',
  'Senior Health',
  'Sensors',
  'Service Industries',
  'Service Providers',
  'Services',
  'Sex Industry',
  'SexTech',
  'Shared Services',
  'Shipping',
  'Shoes',
  'Shopping',
  'Simulation',
  'Skill Assessment',
  'Skill Gaming',
  'Small and Medium Businesses',
  'Soccer',
  'Social + Mobile + Local',
  'Social Bookmarking',
  'Social Business',
  'Social Buying',
  'Social CRM',
  'Social Commerce',
  'Social Fundraising',
  'Social Games',
  'Social Media',
  'Social Media Advertising',
  'Social Media Management',
  'Social Media Marketing',
  'Social Media Platforms',
  'Social Network Media',
  'Social News',
  'Social Recruiting',
  'Social Television',
  'Social Travel',
  'Software',
  'Solar',
  'Space Travel',
  'Spas',
  'Specialty Chemicals',
  'Specialty Foods',
  'Specialty Retail',
  'Speech Recognition',
  'Sponsorship',
  'Sporting Goods',
  'Sports',
  'Staffing Firms',
  'Startups',
  'Stock Exchanges',
  'Storage',
  'Subscription Businesses',
  'Subscription Service',
  'Supply Chain Management',
  'Surveys',
  'Swimming',
  'Synchronization',
  'Systems',
  'Task Management',
  'Taxis',
  'Tea',
  'Technology',
  'Telecommunications',
  'Television',
  'Textiles',
  'Theatre',
  'Therapeutics',
  'Ticketing',
  'Tourism',
  'Toys',
  'Tracking',
  'Trading',
  'Training',
  'Translation',
  'Transportation',
  'Travel',
  'Travel & Tourism',
  'Tutoring',
  'Universities',
  'University Students',
  'Unmanned Air Systems',
  'Usability',
  'User Experience Design',
  'User Interface',
  'Utilities',
  'Vacation Rentals',
  'Vending and Concessions',
  'Venture Capital',
  'Veterinary',
  'Video',
  'Video Conferencing',
  'Video Games',
  'Video Streaming',
  'Video on Demand',
  'Virtual Workforces',
  'VoIP',
  'Waste Management',
  'Watch',
  'Water',
  'Water Purification',
  'Wearables',
  'Web Browsers',
  'Web Design',
  'Web Development',
  'Web Hosting',
  'Web Tools',
  'Weddings',
  'Wholesale',
  'Wine And Spirits',
  'Wireless',
  'Young Adults',
  'iOS',
  'iPad',
  'iPhone',
  'mHealth'
];
