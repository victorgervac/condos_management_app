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
      listing = Listing.where(hostaway_id: p['id']).first_or_initialize
      listing.attributes = {
        name: p['name'],
        internal_listing_name: p['internalListingName'],
        external_listing_name: p['externalListingName'],
        state: p['state'],
        city: p['city'],
        street: p['street'],
        address: p['address'],
        zipcode: p['zipcode'],
        price: p['price'],
        cleaning_fee: p['cleaningFee'],
        hostaway_id: p['id'],
        language: p['language'],
        description: p['description'],
        check_in_time_start: p['checkInTimeStart'],
        average_review_rating: p['averageReviewRating'],
        room_type: p['roomType'],
        bathroom_type: p['bathroomType'],
        bedrooms_number: p['bedroomsNumber'],
        beds_number: p['bedsNumber'],
        bed_type: p['bedType'],
        bathrooms_number: p['bathroomsNumber'],
        min_nights: p['minNights'],
        max_nights: p['maxNights'],
        guests_included: p['guestsIncluded'],
        price_for_extra_person: p['priceForExtraPerson'],
        instant_bookable: p['instantBookable'].to_i == 1,
        instant_bookable_lead_time: p['instantBookableLeadTime'],
        allow_same_day_booking: p['allowSameDayBooking'].to_i == 1,
        same_day_booking_lead_time: p['sameDayBookingLeadTime'],
        wifi_username: p['wifiUsername'],
        wifi_password: p['wifiPassword'],
        is_rental_agreement_active: p['isRentalAgreementActive'],
        listing_agreement_text: p['listingAgreementText'],
        insurance_eligibility_status: p['insuranceEligibilityStatus'],
        airbnb_listing_url: p['airbnbListingUrl'],
        vrbo_listing_url: p['vrboListingUrl'],
        google_vr_listing_url: p['googleVrListingUrl']
      }

      @errors << { id: p['id'], errors: listing.errors.full_messages } unless listing.save!
    end
  end
end
