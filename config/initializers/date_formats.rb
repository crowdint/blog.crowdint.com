Time::DATE_FORMATS[:w3c] =
    lambda { |date| date.strftime( "%Y-%m-%dT%H:%M:%SZ" ) }
