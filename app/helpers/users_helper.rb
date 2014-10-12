module UsersHelper
  include Carriers

  def carrier_options
    [
      ['Select Carrier', nil],
    ].concat(carrier_names)
  end

  def button_style_options
    [
      ['Blue', 'primary'],
      ['Green', 'success'],
      ['Orange', 'warning'],
      ['Red', 'danger'],
      ['Teal', 'info'],
      ['White', 'default'],
      ['None', 'link']
    ]
  end

end
