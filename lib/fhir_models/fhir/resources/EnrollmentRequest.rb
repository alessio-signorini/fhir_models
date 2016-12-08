module FHIR
  class EnrollmentRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EnrollmentRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EnrollmentRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EnrollmentRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'EnrollmentRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'EnrollmentRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EnrollmentRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EnrollmentRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EnrollmentRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EnrollmentRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'EnrollmentRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'created' => {'type'=>'dateTime', 'path'=>'EnrollmentRequest.created', 'min'=>0, 'max'=>1},
      'insurer' => {'type'=>'Reference', 'path'=>'EnrollmentRequest.insurer', 'min'=>0, 'max'=>1},
      'provider' => {'type'=>'Reference', 'path'=>'EnrollmentRequest.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type'=>'Reference', 'path'=>'EnrollmentRequest.organization', 'min'=>0, 'max'=>1},
      'subject' => {'type'=>'Reference', 'path'=>'EnrollmentRequest.subject', 'min'=>0, 'max'=>1},
      'coverage' => {'type'=>'Reference', 'path'=>'EnrollmentRequest.coverage', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :status            # 0-1 code
    attr_accessor :created           # 0-1 dateTime
    attr_accessor :insurer           # 0-1 Reference()
    attr_accessor :provider          # 0-1 Reference()
    attr_accessor :organization      # 0-1 Reference()
    attr_accessor :subject           # 0-1 Reference()
    attr_accessor :coverage          # 0-1 Reference()

    def resourceType
      'EnrollmentRequest'
    end
  end
end