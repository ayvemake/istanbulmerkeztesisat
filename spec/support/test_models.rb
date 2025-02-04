module TestModels
  class ServiceArea
    attr_reader :name, :districts, :description, :postal_code

    def initialize(name:, districts:, description: nil, postal_code: nil)
      @name = name
      @districts = districts
      @description = description || 'Test description'
      @postal_code = postal_code || '34000'
    end
  end
end
