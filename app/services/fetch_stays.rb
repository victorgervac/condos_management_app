class FetchStays
  def initialize(json_data:)
    @json_data = json_data
    @errors = []
  end

  def self.run(json_data:)
    new(json_data: json_data).insert_obj
  end

  def insert_obj
    build_obj
    { status: @errors.present? ? 'fail' : 'success', errors: (@errors.empty? ? nil : @errors) }
  end

  private

  def build_obj
    @json_data['result'].each do |p|
      puts "whats p: #{p}"
      new_p = Reservation.where(id: p['id']).first_or_initialize
      puts "res? p: #{new_p.attributes.inspect}"
      puts "hello: #{p['id']}"

      new_p.attributes = {
        listing_map_id: p['listingMapId'],
        arrival_on: p['arrivalDate'],
        departure_on: p['departureDate'],
        nights: p['nights'],
        total_price: p['totalPrice'],
        tax_amount: p['taxAmount'],
        rental_agreement_file_url: p['rentalAgreementFileUrl'],
        hostaway_reservation_id: p['hostawayReservationId'],
        airbnb_listing_cleaning_fee: p['airbnbListingCleaningFee']
      }
      @errors << new_p.errors.full_messages unless new_p.save!
    end
  end
end
