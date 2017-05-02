module FHIR
  class MedicationStatement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'medication' => ['CodeableConcept', 'Reference'],
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['code', 'identifier', 'medication', 'patient', 'status', 'category', 'context', 'effective', 'part-of', 'source', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MedicationStatement.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MedicationStatement.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MedicationStatement.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'MedicationStatement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'MedicationStatement.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MedicationStatement.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MedicationStatement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationStatement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'MedicationStatement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ProcedureRequest', 'http://hl7.org/fhir/StructureDefinition/ReferralRequest'], 'type'=>'Reference', 'path'=>'MedicationStatement.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/MedicationDispense', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'MedicationStatement.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'MedicationStatement.context', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/medication-statement-status'=>['active', 'completed', 'entered-in-error', 'intended', 'stopped', 'on-hold']}, 'type'=>'code', 'path'=>'MedicationStatement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-statement-status'}},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/medication-statement-category'=>['inpatient', 'outpatient', 'community', 'patientspecified']}, 'type'=>'CodeableConcept', 'path'=>'MedicationStatement.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-statement-category'}},
      'medicationCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>['261000', '336001', '363000', '519005', '585007', '693002', '698006', '699003', '747006', '873008', '925002', '1018001', '1025008', '1057009', '1091008', '1171004', '1190007', '1244009', '1269009', '1325004', '1336006', '1355006', '1368003', '1381005', '1450002', '1476002', '1536005', '1575001', '1603001', '1668008', '1914001', '1944003', '1956002', '1971003', '2029004', '2125008', '2195004', '2197007', '2201007', '2212007', '2215009', '2249001', '2264001', '2346005', '2537003', '2660003', '2680002', '2796008', '2799001', '2869004', '2878005', '2927004', '2958003', '2964005', '2991007', '2995003', '3031003', '3066001', '3087006', '3136005', '3142009', '3145006', '3209002', '3212004', '3225007', '3342004', '3378009', '3379001', '3501003', '3592004', '3597005', '3617004', '3672002', '3693004', '3793006', '3823007', '3829006', '3874004', '3906002', '3932008', '3941003', '3945007', '3983008', '4014000', '4025009', '4043008', '4076007', '4188007', '4203009', '4334005', '4353000', '4355007', '4413004', '4423008', '4480008', '4518006', '4616002', '4681002', '4700006', '4780009', '4814001', '4844003', '5007006', '5142007', '5167005', '5172001', '5220000', '5312000', '5405008', '5477001', '5641004', '5647000', '5657004', '5681006', '5691000', '5699003', '5739006', '5767002', '5774007', '5907009', '5955009', '6054001', '6088007', '6162007', '6237004', '6260007', '6333002', '6394006', '6495008', '6513000', '6524003', '6602005', '6612003', '6710000', '6717002', '6790004', '6809003', '6826009', '6837005', '6865007', '6873003', '6881002', '6910009', '6927001', '6952004', '6992002', '7034005', '7084003', '7156005', '7179006', '7302008', '7318002', '7328006', '7348004', '7451005', '7509000', '7515000', '7549008', '7608003', '7737009', '7770004', '7774008', '7816005', '7834009', '7904003', '7975001', '8030004', '8143001', '8202008', '8203003', '8222007', '8252004', '8397006', '8450009', '8534003', '8631001', '8689007', '8701002', '8767001', '8886003', '8919000', '8987006', '9174005', '9234005', '9271007', '9396007', '9457002', '9471005', '9530002', '9532005', '9539001', '9643009', '9663002', '9676008', '9680003', '9721008', '9765000', '9797000', '9817005', '9910008', '9974009', '9992001', '10016008', '10020007', '10109009', '10133003', '10174003', '10192006', '10202007', '10240005', '10270000', '10282009', '10324005', '10329000', '10333007', '10342000', '10354000', '10377000', '10424009', '10466005', '10471003', '10500003', '10534002', '10595003', '10644005', '10660009', '10682002', '10730008', '10750007', '10751006', '10767000', '10782005', '10790005', '10843002', '10955007', '11036001', '11038000', '11115001', '11121002', '11137008', '11170003', '11202003', '11331001', '11345007', '11420005', '11473005', '11496005', '11504003', '11633008', '11644000', '11652002', '11714005', '11943009', '11984007', '11986009', '12009000', '12034000', '12177002', '12208001', '12218006', '12290003', '12315006', '12391001', '12525000', '12568004', '12578001', '12597001', '12689001', '12716009', '12801003', '12821002', '12870003', '12930006', '12970004', '13030002', '13150000', '13188003', '13235001', '13342004', '13502005', '13585009', '13668001', '13708006', '13787003', '13789000', '14013006', '14071002', '14146003', '14172007', '14193005', '14285000', '14312008', '14321009', '14340003', '14349002', '14399003', '14409006', '14438009', '14443002', '14461006', '14507006', '14638000', '14645000', '14715007', '14743003', '14767006', '14796007', '14819006', '14903000', '14905007', '15009009', '15017001', '15098005', '15129007', '15322006', '15331006', '15352003', '15505005', '15571002', '15660006', '15698006', '15730005', '15785009', '15810003', '15895007', '15901005', '16106007', '16125005', '16130009', '16214005', '16257000', '16276003', '16318005', '16355005', '16359004', '16392005', '16395007', '16462002', '16477005', '16492006', '16613008', '16624005', '16628008', '16670003', '16683002', '16717002', '16744007', '16745008', '16748005', '16808006', '16826009', '16915004', '16923002', '16946000', '17008002', '17062003', '17072000', '17117004', '17147002', '17212003', '17240008', '17243005', '17244004', '17356001', '17614005', '17731005', '17777001', '17798001', '17836006', '17916009', '17932007', '17942009', '17990002', '17991003', '18017000', '18039003', '18143001', '18220004', '18288009', '18321003', '18394004', '18414002', '18449009', '18462008', '18535002', '18550006', '18600008', '18616005', '18712002', '18815007', '18832006', '18852007', '18959002', '18970009', '19012003', '19041007', '19046002', '19114000', '19126005', '19163001', '19205004', '19421007', '19427006', '19462001', '19499001', '19510001', '19524002', '19595005', '19622008', '19839007', '19893005', '19918001', '19967004', '19978007', '20056006', '20170008', '20217007', '20229003', '20231007', '20238001', '20327004', '20340009', '20368008', '20378006', '20379003', '20413008', '20450009', '20468007', '20495002', '20686000', '20752000', '20771003', '20844009', '20847002', '20887007', '21028006', '21066009', '21075006', '21094001', '21168008', '21175009', '21235009', '21246007', '21289006', '21303006', '21373005', '21394008', '21518006', '21556007', '21559000', '21566004', '21568003', '21572004', '21611007', '21614004', '21706000', '21891005', '21903000', '21919007', '22038003', '22086005', '22165008', '22236007', '22242006', '22250002', '22362000', '22424004', '22453003', '22496008', '22606007', '22635004', '22654004', '22769006', '22779008', '22790003', '22792006', '22827004', '22840009', '22882008', '22941009', '22976006', '23053002', '23068001', '23077008', '23176001', '23295004', '23375008', '23433006', '23459009', '23564005', '23692005', '23701001', '23814005', '23816007', '23861006', '23862004', '23866001', '23883005', '23959001', '23969007', '24022008', '24202000', '24237002', '24261009', '24336008', '24357000', '24434007', '24435008', '24556008', '24570008', '24583009', '24650007', '24686008', '24721007', '24751001', '24809001', '24823004', '24838003', '24869004', '25002001', '25013003', '25027008', '25128000', '25141001', '25183006', '25204006', '25205007', '25213008', '25217009', '25254000', '25305005', '25307002', '25401000', '25500001', '25525005', '25538002', '25571003', '25607008', '25620006', '25710007', '25747007', '25796002', '25886000', '25911004', '26120001', '26191006', '26277008', '26288002', '26327007', '26346008', '26351002', '26371006', '26379008', '26437003', '26469007', '26518005', '26656004', '26817007', '26945002', '26992003', '27054007', '27079005', '27081007', '27082000', '27122000', '27184001', '27192005', '27244000', '27248002', '27345002', '27361000', '27499006', '27586005', '27594003', '27656005', '27730007', '27736001', '27766008', '27822002', '27928002', '27931001', '27989007', '28021008', '28029005', '28069006', '28121005', '28223003', '28268006', '28344001', '28421003', '28464005', '28521000', '28580002', '28588009', '28662003', '28702005', '28825003', '28829009', '28927005', '28942008', '28983006', '28999000', '29011006', '29184007', '29190006', '29301006', '29327006', '29406002', '29522004', '29527005', '29531004', '29584000', '29588002', '29666006', '29671004', '29725000', '29765001', '29783009', '29876006', '30034004', '30053009', '30094001', '30145004', '30178006', '30179003', '30203009', '30205002', '30236005', '30324001', '30325000', '30326004', '30329006', '30333004', '30424002', '30589007', '30658004', '30676006', '30745005', '30804005', '30820000', '30827002', '30848000', '30863002', '30990007', '31011004', '31055005', '31147000', '31178001', '31422009', '31522006', '31617001', '31622001', '31662002', '31706007', '31707003', '31731008', '31780003', '31787000', '31799007', '31801005', '31815007', '31818009', '31827005', '31895006', '31936008', '31990000', '32050003', '32083005', '32120008', '32133002', '32154009', '32157002', '32281001', '32370002', '32436002', '32437006', '32498003', '32505007', '32519007', '32707001', '32714004', '32757009', '32789000', '32800009', '32824001', '32836007', '32852005', '32898006', '32901007', '33280006', '33307008', '33396006', '33435008', '33440000', '33447002', '33535006', '33619005', '33635003', '33642003', '33667000', '33752008', '33837008', '33922005', '33963004', '34007009', '34070005', '34074001', '34086003', '34113002', '34120009', '34198005', '34211007', '34239008', '34274009', '34332002', '34425005', '34471003', '34654009', '34657002', '34658007', '34737006', '34915005', '34919004', '34953000', '34983009', '35060001', '35135004', '35150008', '35236008', '35257000', '35281007', '35318005', '35321007', '35343004', '35431001', '35466004', '35473009', '35605007', '35733004', '35748005', '35765001', '35864006', '35883004', '35903003', '35946000', '35954003', '35966009', '35976007', '36020009', '36021008', '36022001', '36136008', '36167005', '36173006', '36176003', '36235004', '36378007', '36380001', '36516003', '36541005', '36651003', '36661005', '36712003', '36872003', '36887008', '36953002', '37006008', '37013008', '37077000', '37078005', '37123002', '37225000', '37237003', '37262003', '37276002', '37352007', '37365003', '37411004', '37433002', '37451001', '37527009', '37648000', '37656002', '37691005', '37716005', '37751002', '37756007', '37758008', '37765000', '37951005', '37957009', '37978007', '37986007', '37994000', '38044001', '38122009', '38218009', '38245005', '38344006', '38399002', '38408002', '38543004', '38595007', '38622005', '38623000', '38648002', '38686006', '38714005', '38794009', '38909000', '38914001', '38937007', '39012008', '39044007', '39123009', '39152007', '39263003', '39292004', '39294003', '39428005', '39514001', '39546001', '39552000', '39808001', '39815009', '39933002', '39962001', '39972003', '39973008', '39979007', '40036000', '40115000', '40342009', '40404004', '40438007', '40534007', '40545005', '40601003', '40699008', '40710000', '40789008', '40924008', '40937006', '40940006', '41062004', '41067005', '41091001', '41143004', '41153003', '41199001', '41261002', '41332001', '41395001', '41410009', '41433005', '41464007', '41485007', '41492002', '41503000', '41509001', '41573001', '41592004', '41598000', '41722006', '41793006', '41834005', '41903005', '41945007', '41989007', '42033003', '42056007', '42145009', '42146005', '42159002', '42163009', '42180008', '42193003', '42212002', '42230009', '42319009', '42382009', '42464005', '42520004', '42549007', '42605004', '42671007', '42692007', '42710006', '42730005', '42761001', '42841002', '42877009', '43004008', '43032004', '43048003', '43136004', '43171004', '43239002', '43289005', '43332008', '43356007', '43440003', '43462003', '43538006', '43541002', '43585000', '43592005', '43597004', '43613009', '43621003', '43688007', '43698001', '43706004', '43784004', '43835003', '43848004', '43880002', '43897008', '43909000', '43989002', '44044007', '44068004', '44159003', '44234001', '44262008', '44293009', '44330008', '44347009', '44469001', '44508008', '44520000', '44555003', '44588005', '44603007', '44609006', '44624002', '44644008', '44681007', '44711006', '44776005', '44908000', '45084007', '45119009', '45158004', '45159007', '45207006', '45266004', '45483006', '45524001', '45555007', '45604009', '45754009', '45807004', '45940009', '45946003', '45960001', '46015007', '46021006', '46058006', '46097003', '46122001', '46134009', '46146008', '46191004', '46201000', '46225008', '46250006', '46257009', '46293006', '46492003', '46514003', '46558003', '46572007', '46654009', '46668002', '46711008', '46749007', '46861006', '46887006', '46921009', '46943001', '46950002', '47026005', '47176005', '47180000', '47192000', '47218005', '47247003', '47280005', '47336007', '47349002', '47350002', '47355007', '47383009', '47389008', '47408003', '47413004', '47414005', '47500008', '47663000']}, 'type'=>'CodeableConcept', 'path'=>'MedicationStatement.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-codes'}},
      'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationStatement.medication[x]', 'min'=>1, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
      'dateAsserted' => {'type'=>'dateTime', 'path'=>'MedicationStatement.dateAsserted', 'min'=>0, 'max'=>1},
      'informationSource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationStatement.informationSource', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationStatement.subject', 'min'=>1, 'max'=>1},
      'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationStatement.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'taken' => {'valid_codes'=>{'http://hl7.org/fhir/medication-statement-taken'=>['y', 'n', 'unk', 'na']}, 'type'=>'code', 'path'=>'MedicationStatement.taken', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-statement-taken'}},
      'reasonNotTaken' => {'valid_codes'=>{'http://snomed.info/sct'=>['182862001', '182863006', '182864000', '182865004', '182867007', '182868002', '182869005', '182870006', '182871005', '182872003', '182873008', '182874002', '266711001', '275929009']}, 'type'=>'CodeableConcept', 'path'=>'MedicationStatement.reasonNotTaken', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/reason-medication-not-taken-codes'}},
      'reasonCode' => {'valid_codes'=>{'http://snomed.info/sct'=>['109006', '122003', '127009', '129007', '134006', '140004', '144008', '147001', '150003', '151004', '162004', '165002', '168000', '171008', '172001', '175004', '177007', '179005', '181007', '183005', '184004', '188001', '192008', '193003', '195005', '198007', '199004', '208008', '216004', '219006', '222008', '223003', '228007', '241006', '242004', '253005', '257006', '258001', '264008', '276008', '279001', '281004', '282006', '290006', '292003', '297009', '299007', '303002', '308006', '310008', '313005', '317006', '320003', '324007', '330007', '335002', '341009', '349006', '355001', '357009', '358004', '359007', '360002', '364006', '366008', '368009', '369001', '378007', '382009', '383004', '385006', '387003', '398002', '407000', '408005', '409002', '426008', '431005', '437009', '440009', '442001', '443006', '447007', '450005', '452002', '460001', '467003', '470004', '479003', '486006', '488007', '490008', '496002', '504009', '517007', '518002', '520004', '527001', '536002', '539009', '547009', '548004', '554003', '555002', '563001', '568005', '586008', '590005', '596004', '599006', '600009', '602001', '607007', '610000', '613003', '615005', '616006', '626004', '631002', '634005', '640003', '643001', '646009', '649002', '651003', '652005', '655007', '658009', '663008', '664002', '666000', '675003', '682004', '685002', '701003', '703000', '714002', '715001', '718004', '733007', '734001', '736004', '750009', '755004', '756003', '758002', '775008', '776009', '781000', '786005', '787001', '788006', '792004', '799008', '801006', '805002', '811004', '813001', '815008', '816009', '818005', '825003', '827006', '832007', '834008', '841002', '842009', '843004', '844005', '845006', '849000', '857002', '862001', '865004', '871005', '874002', '875001', '888003', '890002', '899001', '903008', '904002', '908004', '919001', '928000', '931004', '932006', '934007', '943003', '954008', '961007', '962000', '964004', '965003', '975000', '978003', '981008', '984000', '987007', '991002', '998008', '1003002', '1020003', '1023001', '1027000', '1031006', '1033009', '1034003', '1038000', '1045000', '1046004', '1051005', '1055001', '1059007', '1070000', '1073003', '1074009', '1077002', '1079004', '1085006', '1089000', '1102005', '1107004', '1108009', '1111005', '1112003', '1116000', '1124005', '1125006', '1126007', '1131009', '1134001', '1135000', '1139006', '1140008', '1141007', '1145003', '1150009', '1151008', '1152001', '1155004', '1156003', '1168007', '1184008', '1192004', '1194003', '1196001', '1197005', '1201005', '1203008', '1207009', '1208004', '1212005', '1214006', '1230003', '1232006', '1239002', '1240000', '1259003', '1261007', '1264004', '1271009', '1280009', '1282001', '1283006', '1284000', '1286003', '1287007', '1297003', '1308001', '1310004', '1317001', '1318006', '1323006', '1332008', '1335005', '1343000', '1345007', '1351002', '1356007', '1361009', '1363007', '1367008', '1370007', '1372004', '1376001', '1378000', '1380006', '1383008', '1384002', '1386000', '1387009', '1388004', '1393001', '1395008', '1402001', '1412008', '1415005', '1418007', '1419004', '1426004', '1427008', '1430001', '1447000', '1469007', '1474004', '1475003', '1478001', '1479009', '1482004', '1486001', '1488000', '1489008', '1492007', '1493002', '1499003', '1512006', '1515008', '1518005', '1519002', '1521007', '1523005', '1525003', '1531000', '1532007', '1534008', '1538006', '1539003', '1542009', '1544005', '1551001', '1556006', '1563006', '1567007', '1588003', '1592005', '1593000', '1606009', '1608005', '1639007', '1647007', '1648002', '1654001', '1657008', '1658003', '1663004', '1667003', '1670004', '1671000', '1674008', '1679003', '1682008', '1685005', '1686006', '1694004', '1698001', '1703007', '1705000', '1708003', '1714005', '1717003', '1723008', '1724002', '1734006', '1735007', '1739001', '1742007', '1744008', '1748006', '1755008', '1761006', '1763009', '1767005', '1769008', '1771008', '1776003', '1777007', '1778002', '1779005', '1794009', '1816003', '1821000', '1822007', '1824008', '1826005', '1828006', '1829003', '1833005', '1835003', '1837006', '1845001', '1847009', '1848004', '1852004', '1855002', '1856001', '1857005', '1858000', '1860003', '1865008', '1869002', '1881003', '1892002', '1896004', '1897008', '1899006', '1903004', '1908008', '1909000', '1922008', '1926006', '1938002', '1939005', '1943009', '1953005', '1954004', '1955003', '1959009', '1961000', '1963002', '1965009', '1967001', '1973000', '1977004', '1979001', '1980003', '1981004', '1988005', '1989002', '2004005', '2012002', '2024009', '2028007', '2032001', '2036003', '2040007', '2041006', '2043009', '2053005', '2055003', '2058001', '2061000', '2065009', '2066005', '2070002', '2073000', '2087000', '2089002', '2091005', '2094002', '2102007', '2103002', '2107001', '2109003', '2114004', '2116002', '2120003', '2121004', '2128005', '2129002', '2132004', '2134003', '2136001', '2138000', '2145000', '2149006', '2158004', '2167004', '2169001', '2170000', '2176006', '2177002', '2186007', '2198002', '2202000', '2204004', '2213002', '2216005', '2217001', '2219003', '2224000', '2228002', '2229005', '2231001', '2237002', '2239004', '2241003', '2243000', '2245007', '2251002', '2256007', '2261009', '2268003', '2284002', '2295008', '2296009', '2298005', '2301009', '2303007', '2304001', '2307008', '2308003', '2312009', '2314005', '2326000', '2339001', '2341000', '2351004', '2355008', '2359002', '2365002', '2366001', '2367005', '2374000', '2385003', '2388001', '2390000', '2391001', '2396006', '2398007', '2403008', '2415007', '2418009', '2419001', '2420007', '2432006', '2435008', '2437000', '2438005', '2439002', '2443003', '2452007', '2463005', '2469009', '2470005', '2471009', '2472002', '2473007', '2477008', '2492009', '2495006', '2496007', '2506003', '2513003', '2518007', '2521009', '2523007', '2526004', '2528003', '2532009', '2534005', '2538008', '2541004', '2554006', '2556008', '2560006', '2562003', '2576002', '2581006', '2582004', '2583009', '2584003', '2585002', '2589008', '2591000', '2593002', '2602008', '2606006', '2615004', '2618002', '2622007', '2624008', '2625009', '2630008', '2634004', '2638001', '2640006', '2651006', '2655002', '2657005', '2663001', '2665008', '2683000', '2689001', '2694001', '2704003', '2707005', '2713001', '2724004', '2725003', '2733002', '2736005', '2740001', '2749000', '2751001', '2761008', '2764000', '2770006', '2772003', '2775001', '2776000', '2781009', '2782002', '2783007', '2786004', '2790002', '2805007', '2806008', '2807004', '2808009', '2815001', '2816000', '2818004', '2819007', '2825006', '2828008', '2829000', '2831009', '2835000', '2836004', '2838003', '2840008', '2850009', '2853006', '2856003', '2858002', '2884008', '2893009', '2897005', '2899008', '2900003', '2901004', '2902006', '2904007', '2910007', '2912004', '2917005', '2918000', '2919008', '2929001', '2935001', '2940009', '2946003', '2951009', '2955000', '2965006', '2967003', '2972007', '2973002', '2978006', '2981001', '2989004', '2990008', '2992000', '2994004', '2999009', '3002002', '3004001', '3006004', '3009006', '3013004', '3014005', '3018008', '3019000', '3021005', '3023008', '3032005', '3033000', '3038009', '3044008', '3053001', '3059002', '3067005', '3071008', '3072001', '3073006', '3084004', '3089009', '3094009', '3095005', '3097002', '3098007', '3105002', '3109008', '3110003', '3119002', '3129009', '3135009', '3140001', '3144005', '3158007', '3160009', '3163006', '3168002', '3185000', '3199001', '3200003', '3208005', '3214003', '3217005', '3218000', '3219008', '3228009', '3229001', '3230006', '3238004', '3239007', '3253007', '3254001', '3259006', '3261002', '3263004', '3272007', '3274008', '3275009', '3276005', '3277001', '3282008', '3283003', '3286006', '3289004', '3291007', '3298001', '3303004', '3304005', '3305006', '3308008', '3310005', '3321001', '3323003', '3327002', '3331008', '3344003', '3345002', '3355003', '3358001', '3368006', '3376008', '3381004', '3387000', '3391005', '3393008', '3398004', '3401001', '3415004', '3419005', '3421000', '3424008', '3426005', '3427001', '3434004', '3439009', '3441005', '3446000', '3449007', '3456001', '3458000', '3461004', '3464007', '3468005', '3469002', '3472009', '3474005', '3480002', '3482005', '3483000', '3487004', '3500002', '3502005', '3503000', '3505007', '3506008', '3507004', '3511005', '3514002', '3519007', '3528008', '3529000', '3530005', '3531009', '3533007', '3539006', '3542000', '3544004', '3545003', '3548001', '3549009', '3558002', '3560000', '3570003', '3571004', '3577000', '3585009', '3586005', '3589003', '3590007', '3591006', '3598000', '3611003', '3633001', '3634007', '3639002', '3640000', '3641001', '3642008', '3644009', '3649004', '3650004', '3652007', '3657001', '3660008', '3662000', '3677008', '3680009', '3681008', '3696007', '3699000', '3703002', '3704008', '3705009', '3712000', '3716002', '3720003', '3723001', '3733009', '3736001', '3738000', '3744001', '3745000', '3747008', '3750006', '3751005', '3752003', '3754002', '3755001', '3756000', '3759007', '3760002', '3762005', '3763000', '3783004', '3797007', '3798002', '3815005', '3820005', '3827008', '3830001', '3841004', '3845008', '3855007', '3859001', '3873005', '3885002', '3886001', '3899003', '3900008', '3902000', '3903005', '3908001', '3909009', '3913002', '3914008', '3928002', '3939004', '3944006', '3947004', '3950001', '3951002', '3972004', '3975002', '3978000', '3987009', '3993001', '3999002', '4003003', '4004009', '4006006', '4009004', '4016003', '4017007', '4022007', '4026005', '4030008', '4038001', '4039009', '4040006', '4041005', '4046000', '4062006', '4063001', '4069002', '4070001', '4075006', '4082005', '4088009', '4089001', '4092002', '4103001', '4106009', '4107000', '4113009', '4120002', '4124006', '4127004', '4129001', '4135001', '4136000', '4142001', '4152002', '4160001', '4168008', '4170004', '4174008', '4175009', '4178006', '4181001', '4183003', '4184009', '4191007', '4195003', '4197006', '4199009', '4208000', '4210003', '4223005', '4224004', '4225003', '4229009', '4232007', '4237001', '4240001', '4241002', '4242009', '4244005', '4248008', '4249000', '4251001', '4260009', '4262001', '4264000', '4269005', '4273008', '4275001', '4278004', '4283007', '4287008', '4294006', '4300009', '4301008', '4306003', '4307007', '4308002', '4310000', '4313003', '4316006', '4320005', '4324001', '4325000', '4332009', '4338008', '4340003', '4349002', '4354006', '4356008', '4359001', '4364002', '4367009', '4373005', '4374004', '4381006', '4386001', '4390004', '4397001', '4399003', '4403007', '4406004', '4409006', '4410001', '4412009', '4414005', '4416007', '4418008', '4426000', '4434006', '4439001', '4441000', '4445009', '4448006', '4451004', '4461006', '4463009', '4464003', '4465002', '4468000', '4470009', '4473006', '4477007', '4478002', '4481007', '4483005']}, 'type'=>'CodeableConcept', 'path'=>'MedicationStatement.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/condition-code'}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'MedicationStatement.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'MedicationStatement.note', 'min'=>0, 'max'=>Float::INFINITY},
      'dosage' => {'type'=>'Dosage', 'path'=>'MedicationStatement.dosage', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                        # 0-1 id
    attr_accessor :meta                      # 0-1 Meta
    attr_accessor :implicitRules             # 0-1 uri
    attr_accessor :language                  # 0-1 code
    attr_accessor :text                      # 0-1 Narrative
    attr_accessor :contained                 # 0-* [ Resource ]
    attr_accessor :extension                 # 0-* [ Extension ]
    attr_accessor :modifierExtension         # 0-* [ Extension ]
    attr_accessor :identifier                # 0-* [ Identifier ]
    attr_accessor :basedOn                   # 0-* [ Reference(MedicationRequest|CarePlan|ProcedureRequest|ReferralRequest) ]
    attr_accessor :partOf                    # 0-* [ Reference(MedicationAdministration|MedicationDispense|MedicationStatement|Procedure|Observation) ]
    attr_accessor :context                   # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :status                    # 1-1 code
    attr_accessor :category                  # 0-1 CodeableConcept
    attr_accessor :medicationCodeableConcept # 1-1 CodeableConcept
    attr_accessor :medicationReference       # 1-1 Reference(Medication)
    attr_accessor :effectiveDateTime         # 0-1 dateTime
    attr_accessor :effectivePeriod           # 0-1 Period
    attr_accessor :dateAsserted              # 0-1 dateTime
    attr_accessor :informationSource         # 0-1 Reference(Patient|Practitioner|RelatedPerson|Organization)
    attr_accessor :subject                   # 1-1 Reference(Patient|Group)
    attr_accessor :derivedFrom               # 0-* [ Reference(Resource) ]
    attr_accessor :taken                     # 1-1 code
    attr_accessor :reasonNotTaken            # 0-* [ CodeableConcept ]
    attr_accessor :reasonCode                # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference           # 0-* [ Reference(Condition|Observation) ]
    attr_accessor :note                      # 0-* [ Annotation ]
    attr_accessor :dosage                    # 0-* [ Dosage ]

    def resourceType
      'MedicationStatement'
    end
  end
end