module Carriers

  def names_and_domains
    [
      ['Alltel',        '@message.alltel.com'],
      ['AT&T',          '@txt.att.net'],
      ['Boost Mobile',  '@myboostmobile.com'],
      ['Cellular One',  '@mobile.celloneusa.com'],
      ['MetroPCS',      '@mymetropcs.com'],
      ['Nextel',        '@messaging.nextel.com'],
      ['Sprint',        '@messaging.sprintpcs.com'],
      ['T-Mobile',      '@tmomail.net'],
      ['Tracfone',      '@txt.att.net'],
      ['US Cellular',   '@email.uscc.net'],
      ['Verizon',       '@vtext.com'],
      ['Virgin Mobile', '@vmobl.com']
    ]
  end

  def domain_name(carrier)
    names_and_domains.map { |x| return x[1] if x[0] == carrier }
  end

  def carrier_names
    names_and_domains.map { |x| [x[0], x[0]] }
  end

end
