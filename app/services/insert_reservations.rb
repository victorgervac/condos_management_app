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
      reservation = Reservation.where(hostaway_id: p['id']).first_or_initialize
      reservation.attributes = {
        hostaway_id: p['id'],
        listing_map_id: p['listingMapId'],
        channel_id: p['channelId'],
        source: p['source'],
        channel_name: p['channelName'],
        reservation_id: p['reservationId'],
        hostaway_reservation_id: p['hostawayReservationId'],
        channel_reservation_id: p['channelReservationId'],
        external_property_id: p['externalPropertyId'],
        external_rate_plan_id: p['externalRatePlanId'],
        external_unit_id: p['externalUnitId'],
        assignee_user_id: p['assigneeUserId'],
        manual_ical_id: p['manualIcalId'],
        manual_ical_name: p['manualIcalName'],
        is_processed: p['isProcessed'].to_i == 1,
        is_initial: p['isInitial'].to_i == 1,
        is_manually_checked: p['isManuallyChecked'].to_i == 1,
        is_instant_booked: p['isInstantBooked'].to_i == 1,
        has_pull_error: p['hasPullError'].to_i == 1,
        reservation_date: p['reservationDate'],
        pending_expire_date: p['pendingExpireDate'],
        guest_name: p['guestName'],
        guest_first_name: p['guestFirstName'],
        guest_last_name: p['guestLastName'],
        guest_external_account_id: p['guestExternalAccountId'],
        guest_zip_code: p['guestZipCode'],
        guest_address: p['guestAddress'],
        guest_city: p['guestCity'],
        guest_country: p['guestCountry'],
        guest_email: p['guestEmail'],
        guest_picture: p['guestPicture'],
        guest_recommendations: p['guestRecommendations'],
        guest_trips: p['guestTrips'],
        guest_work: p['guestWork'],
        is_guest_identity_verified: p['isGuestIdentityVerified'].to_i == 1,
        is_guest_verified_by_email: p['isGuestVerifiedByEmail'].to_i == 1,
        is_guest_verified_by_work_email: p['isGuestVerifiedByWorkEmail'].to_i == 1,
        is_guest_verified_by_facebook: p['isGuestVerifiedByFacebook'].to_i == 1,
        is_guest_verified_by_government_id: p['isGuestVerifiedByGovernmentId'].to_i == 1,
        is_guest_verified_by_phone: p['isGuestVerifiedByPhone'].to_i == 1,
        is_guest_verified_by_reviews: p['isGuestVerifiedByReviews'].to_i == 1,
        number_of_guests: p['numberOfGuests'],
        adults: p['adults'],
        children: p['children'],
        infants: p['infants'],
        pets: p['pets'],
        arrival_date: p['arrivalDate'],
        departure_date: p['departureDate'],
        is_dates_unspecified: p['isDatesUnspecified'].to_i == 1,
        previous_arrival_date: p['previousArrivalDate'],
        previous_departure_date: p['previousDepartureDate'],
        check_in_time: p['checkInTime'],
        check_out_time: p['checkOutTime'],
        nights: p['nights'],
        phone: p['phone'],
        total_price: p['totalPrice'],
        tax_amount: p['taxAmount'],
        channel_commission_amount: p['channelCommissionAmount'],
        hostaway_commission_amount: p['hostawayCommissionAmount'],
        cleaning_fee: p['cleaningFee'],
        security_deposit_fee: p['securityDepositFee'],
        is_paid: p['isPaid'].to_i == 1,
        payment_method: p['paymentMethod'],
        stripe_guest_id: p['stripeGuestId'],
        currency: p['currency'],
        status: p['status'],
        cancellation_date: p['cancellationDate'],
        cancelled_by: p['cancelledBy'],
        host_note: p['hostNote'],
        guest_note: p['guestNote'],
        guest_locale: p['guestLocale'],
        door_code: p['doorCode'],
        door_code_vendor: p['doorCodeVendor'],
        door_code_instruction: p['doorCodeInstruction'],
        comment: p['comment'],
        confirmation_code: p['confirmationCode'],
        airbnb_expected_payout_amount: p['airbnbExpectedPayoutAmount'],
        airbnb_listing_base_price: p['airbnbListingBasePrice'],
        airbnb_listing_cancellation_host_fee: p['airbnbListingCancellationHostFee'],
        airbnb_listing_cancellation_payout: p['airbnbListingCancellationPayout'],
        airbnb_listing_cleaning_fee: p['airbnbListingCleaningFee'],
        airbnb_listing_host_fee: p['airbnbListingHostFee'],
        airbnb_listing_security_price: p['airbnbListingSecurityPrice'],
        airbnb_occupancy_tax_amount_paid_to_host: p['airbnbOccupancyTaxAmountPaidToHost'],
        airbnb_total_paid_amount: p['airbnbTotalPaidAmount'],
        airbnb_transient_occupancy_tax_paid_amount: p['airbnbTransientOccupancyTaxPaidAmount'],
        airbnb_cancellation_policy: p['airbnbCancellationPolicy'],
        is_starred: p['isStarred'].to_i == 1,
        is_archived: p['isArchived'].to_i == 1,
        is_pinned: p['isPinned'].to_i == 1,
        original_channel: p['originalChannel'],
        customer_user_id: p['customerUserId'],
        rental_agreement_file_url: p['rentalAgreementFileUrl'],
        reservation_agreement: p['reservationAgreement'],
        remaining_balance: p['remainingBalance'],
        insurance_status: p['insuranceStatus'],
        claim_status: p['claimStatus'],
        insurance_policy_id: p['insurancePolicyId'],
        cancellation_policy_id: p['cancellationPolicyId'],
        host_proxy_email: p['hostProxyEmail']
      }

      @errors << { id: p['id'], errors: reservation.errors.full_messages } unless reservation.save!
    end
  end
end
