# app/services/account_summary_service.rb
class AccountSummaryService
  require 'roo'
  require 'prawn'
  require 'date'

  def initialize(file_path)
    @file_path = file_path
    @reservations = []
    @expenses = []
    @others = []
    @header = []
    @total = []
    @title = ''
  end

  def self.run(file_path)
    new(file_path).generate_summary_pdf
  end

  def generate_summary_pdf
    read_excel_data

    column_widths = @header.flatten.map.with_index do |header, index|
      [header, @reservations.map { |row| row[index] }.max_by { |cell| cell.to_s.length }.to_s.length * 6]
    end

    Prawn::Document.generate('account_summary.pdf') do |pdf|
      # pdf.text safe_encode('Park City - Powder Pointe 302A'), size: 20, style: :bold, color: '0000ff'
      pdf.text safe_encode(@title.titleize), size: 20, style: :bold, color: '1a98a6'
      pdf.move_down 5

      pdf.text safe_encode('Address:'), size: 10, style: :bold
      pdf.text safe_encode('Powder Pointe'), size: 10
      pdf.text safe_encode('more adresss ,Park City, Utah, 84036'), size: 10
      pdf.bounding_box([pdf.bounds.right - 100, pdf.cursor], width: 100, height: 30, padding: 8) do
        pdf.stroke_bounds
        pdf.text safe_encode("Reservations: #{@reservations.count || 0}"), size: 10, style: :bold, align: :center
        pdf.text safe_encode("Expenses: #{@expenses.count || 0}"), size: 10, style: :bold, align: :center
      end
      pdf.stroke_horizontal_rule
      pdf.move_down 10

      table_data = [@header.flatten.map { |h| safe_encode(h) }] + @reservations.map do |res|
                                                                    safe_encode(res)
                                                                  end

      # Set column widths dynamically based on content

      # Debugging output
      puts "Column Widths: #{column_widths.inspect}"
      pdf.text safe_encode('Stays'), size: 15, style: :bold
      # Create the table with the data
      pdf.table(table_data, header: true, row_colors: %w[f0f0f0 ffffff],
                            cell_style: { borders: %i[top bottom], size: 6 }) do
        cells.padding = 4
        cells.borders = %i[top bottom]
        row(0).font_style = :bold
        row(0).background_color = 'cccccc'
        # self.column_widths = 12
      end

      pdf.move_down 20
    end
  end

  private

  def read_excel_data
    spreadsheet = Roo::Spreadsheet.open(@file_path)
    sheet = spreadsheet.sheet(0)

    sheet.each_with_index do |row, index|
      if index == 0
        @title << row.first
      elsif index == 1
        @header << row.shift
      elsif row.first == 'Expense'
        @expenses << row
      elsif row.first == 'Stay'
        @reservations << row.shift
      elsif row.first == 'Total'
        @total << row
      else
        @others << row
      end
    end
  end

  def safe_encode(text)
    text.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
  end
end
