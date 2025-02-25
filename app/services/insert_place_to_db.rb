class InsertPlaceToDb
  attr_reader :errors

  def initialize(json_data:)
    @json_data = json_data
    @errors = []
  end

  def self.run(json_data:)
    service = new(json_data: json_data)
    service.insert_obj
    { status: service.errors.present? ? 'fail' : 'success', errors: service.errors.presence }
  end

  def insert_obj
    build_obj
  end

  private

  def build_obj
    @json_data['result'].each do |p|
      place = Listing.find_or_initialize_by(id: p['id'])
      place.assign_attributes(
        name: p['name'],
        internal_listing_name: p['internalListingName'],
        external_listing_name: p['externalListingName'],
        state: p['state'],
        city: p['city'],
        street: p['street'],
        address: p['address'],
        zipcode: p['zipcode'],
        price: p['price'],
        cleaning_fee: p['cleaningFee']
      )

      @errors << { id: p['id'], errors: place.errors.full_messages } unless place.save
    end
  end
end
