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
      puts "whats p: #{p.inspect}"
      new_p = Reservation.where(id: p['id']).first_or_initialize

      new_p.attributes = {
        # listing_map_id: p['listingMapId'],
        # hostaway_reservation_id: p['hostawayReservationId'],
        # nights: p['nights'],
        # total_price: p['totalPrice'],
        # tax_amount: p['taxAmount'],
        # rental_agreement_file_url: p['rentalAgreementFileUrl'],
        # airbnb_listing_cleaning_fee: p['airbnbListingCleaningFee']
        listing_name: p['listing_name'],
        arrival_date: p['arrivalDate'],
        departure_date: p['departureDate'],
        guest_name: p['guest_name'],
        guest_first_name: p['guest_first_name'],
        guest_last_name: p['guest_last_name']

      }
      @errors << new_p.errors.full_messages unless new_p.save!
    end
  end
end
