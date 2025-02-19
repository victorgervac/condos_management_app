class InsertPlaceToDb
  def initialize(json_data:)
    @json_data = json_data
    @errors = []
  end

  def self.run(json_data:)
    new(json_data: json_data).insert_obj
    { status: @errors.present? ? 'fail' : 'success', errors: (@errors.present? ? @errors : nil) }
  end

  def insert_obj
    build_obj
  end

  private

  def build_obj
    @json_data['result'].each do |p|
      new_p = Place.where(id: p['id']).first_or_initialize
      new_p.attributes = { name: p['name'],
                           internal_listing_name: p['internalListingName'],
                           external_listing_name: p['externalListingName'],
                           state: p['state'],
                           city: p['city'],
                           street: p['street'],
                           address: p['address'],
                           zipcode: p['zipcode'],
                           price: p['price'],
                           cleaning_fee: p['cleaningFee'] }

      @errors.push(new_p.errors.full_messages) unless new_p.save!
    end
  end
end
