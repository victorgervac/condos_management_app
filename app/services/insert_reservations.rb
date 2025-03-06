class InsertReservations
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
      new_p = Reservation.where(hostaway_id: p['id']).first_or_initialize
      raise "#{p.keys.inspect}/#{p.values.inspect}"

      new_p.attributes = {
        listing_name: p['listing_name'],
        arrival_date: p['arrivalDate'],
        departure_date: p['departureDate'],
        guest_name: p['guest_name'],
        guest_first_name: p['guest_first_name'],
        guest_last_name: p['guest_last_name'],
        hostaway_id: p['id'],
        guest_email: p['guestEmail'],
        check_in: p['checkIn'],
        check_out: p['checkOut'],
        total_price: p['totalPrice'],
        status: p['status'],
        guest_zip_code: p['guestZipCode'],
        guest_address: p['guestAddress'],
        guest_city: p['guestCity'],
        guest_country: p['guest_country'],
        guest_picture: p['guestPicture'],
        guest_recommendations: p['guestRecommendations'],
        guest_trips: p['guestTrips'],
        guest_work: p['guestWork'],
        listing_map_id: p['listingMapId']
      }
      @errors << new_p.errors.full_messages unless new_p.save!
    end
  end
end
