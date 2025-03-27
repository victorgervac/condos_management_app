class InsertCleaningTaskToDb
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
      # Rails.logger.info(p.inspect)
      cleaning_task = CleaningTask.where(hostaway_id: p['id']).first_or_initialize
      reservation = Reservation.where(hostaway_id: p['reservationId']).first
      next unless reservation

      listing = Listing.where(hostaway_id: reservation.listing_map_id).first
      next unless listing

      cleaning_task.attributes = {
        total: p['expense'],
        reservation_id: reservation.id,
        listing_id: listing.id
      }

      @errors << { id: p['id'], errors: cleaning_task.errors.full_messages } unless cleaning_task.save!
    end
  end
end
