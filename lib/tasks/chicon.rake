namespace :chicon do
  desc "Seed Chicon Data"
  task seed_exclusions: :environment do
    if Exclusion.count == 0
      Exclusion.create!(
        [
          {
            title: 'Hugo Award Ceremony'
          },
          {
            title: 'Hugo Award Ceremony rehearsal'
          },
          {
            title: 'Masquerade'
          },
          {
            title: 'Masquerade rehearsal'
          },
          {
            title: 'Opening Ceremony'
          },
          {
            title: 'Closing Ceremony'
          },
          {
            title: 'WSFS Business Meeting'
          },
          {
            title: 'Mark Protection Committee meetings'
          },
          {
            title: 'Joe Siclari and Edie Stern GoH highlight session'
          },
          {
            title: 'Floyd Norman highlight session'
          },
          {
            title: 'Erle Korshak highlight session'
          },
          {
            title: 'Eve L. Ewing highlight session'
          },
          {
            title: 'Gene Ha highlight session'
          },
          {
            title: 'Eric Wilkerson highlight session'
          }
        ]
      )
    end
  end

  desc "Seed Chicon Venue/Room Data"
  task seed_rooms: :environment do
    hyatt = Venue.find_by name: "Hyatt Regency Chicago"
    if !hyatt
      Venue.create!(
        [
          {name: "Hyatt Regency Chicago", address: "151 E Wacker Drive, Chicago IL 60601"}
        ]
      )
    end
    airmeet = Venue.find_by name: "Airmeet"
    if !airmeet
      Venue.create!(
        [
          {name: "Airmeet"}
        ]
      )
    end

    hyatt = Venue.find_by name: "Hyatt Regency Chicago"
    if hyatt.rooms.count == 0
      # We only want the rooms that are going to potentially be used for programme
      Room.create!(
        [
          {venue_id: hyatt.id, name: "Plaza AB"},
          {venue_id: hyatt.id, name: "Michigan 1"},
          {venue_id: hyatt.id, name: "Michigan 2"},
          {venue_id: hyatt.id, name: "Michigan 3"},
          {venue_id: hyatt.id, name: "Michigan Boardroom"},
          {venue_id: hyatt.id, name: "Randolph 1"},
          {venue_id: hyatt.id, name: "Randolph 2"},
          {venue_id: hyatt.id, name: "Randolph 3"},
          {venue_id: hyatt.id, name: "Roosevelt 1"},
          {venue_id: hyatt.id, name: "Roosevelt 3"},
          {venue_id: hyatt.id, name: "Grand Ballroom"},
          {venue_id: hyatt.id, name: "Grand Suites 3"},
          {venue_id: hyatt.id, name: "Grand Hall GH"},
          {venue_id: hyatt.id, name: "Grand Hall I"},
          {venue_id: hyatt.id, name: "Grand Hall J"},
          {venue_id: hyatt.id, name: "Grand Hall K"},
          {venue_id: hyatt.id, name: "Grand Hall L"},
          {venue_id: hyatt.id, name: "Grand Hall MN"},
          {venue_id: hyatt.id, name: "Burnham"},
          {venue_id: hyatt.id, name: "McCormick"},
          {venue_id: hyatt.id, name: "Field"},
          {venue_id: hyatt.id, name: "Dusable"},
          {venue_id: hyatt.id, name: "Horner"},
          {venue_id: hyatt.id, name: "Ogden"},
          {venue_id: hyatt.id, name: "Wright"},
          {venue_id: hyatt.id, name: "Addams"},
          {venue_id: hyatt.id, name: "Gallery Boardroom 1"},
          {venue_id: hyatt.id, name: "Gallery Boardroom 2"},
          {venue_id: hyatt.id, name: "Gallery Boardroom 3"},
          {venue_id: hyatt.id, name: "Gallery Boardroom 4"},
          {venue_id: hyatt.id, name: "Gallery 5"},
          {venue_id: hyatt.id, name: "Crystal Ballroom A"},
          {venue_id: hyatt.id, name: "Crystal Ballroom B"},
          {venue_id: hyatt.id, name: "Crystal Ballroom C"},
          {venue_id: hyatt.id, name: "Crystal Foyer"},
          {venue_id: hyatt.id, name: "Comiskey"},
          {venue_id: hyatt.id, name: "Soldier Field"},
          {venue_id: hyatt.id, name: "Wrigley"},
          {venue_id: hyatt.id, name: "Regency Ballroom ABC"},
          {venue_id: hyatt.id, name: "Regency Ballroom D"},
          {venue_id: hyatt.id, name: "Regency Ballroom South Registration Desk"},
          {venue_id: hyatt.id, name: "Atlanta"},
          {venue_id: hyatt.id, name: "Other"},
          {venue_id: hyatt.id, name: "Autographing"}
        ]
      )
    end
    airmeet = Venue.find_by name: "Airmeet"
    if airmeet.rooms.count == 0
      Room.create!(
        [
          {venue_id: airmeet.id, name: "Airmeet 1" },
          {venue_id: airmeet.id, name: "Airmeet 2" },
          {venue_id: airmeet.id, name: "Airmeet 3" },
          {venue_id: airmeet.id, name: "Airmeet 4" }
          # {venue_id: airmeet.id, name: "Stream 1" },
          # {venue_id: airmeet.id, name: "Stream 2" },
          # {venue_id: airmeet.id, name: "Stream 3" }
        ]
      )
    end
  end
end
