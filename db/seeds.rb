Mentor.destroy_all
Mentee.destroy_all
Match.destroy_all
Appointment.destroy_all
User.destroy_all

Mentor.connection.execute('ALTER SEQUENCE mentors_id_seq RESTART WITH 1')
Mentee.connection.execute('ALTER SEQUENCE mentees_id_seq RESTART WITH 1')
Match.connection.execute('ALTER SEQUENCE matches_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')


r = Mentor.create!(first_name: "Andrea", last_name: "James",email: "a@mail.com", years_of_experience: 5, current_company: "DBC", current_industry: "Education", linkedin_link: "linkedin.com/andrea", race: "Asian", gender: "female", socioeconomic_background: "lower", orientation: "bisexual", location: "SF Bay Area", interests: "golfing, karate, cooking", good_standing: true, availability: DateTime.now, other: "")
r2 = Mentor.create!(first_name: "Chris", last_name: "Samson",email: "chris@mail.com", years_of_experience: 4, current_company: "Acme Inc.", current_industry: "FinTech", linkedin_link: "linkedin.com/chris", race: "White", gender: "male", socioeconomic_background: "middle", orientation: "straight", location: "SF Bay Area", interests: "tennis, wind-surfing", good_standing: true, availability: DateTime.now, other: "")
r3 = Mentor.create!(first_name: "Andrea", last_name: "James",email: "a@mail.com", years_of_experience: 5, current_company: "DBC", current_industry: "Education", linkedin_link: "linkedin.com/andrea", race: "Asian", gender: "female", socioeconomic_background: "lower", orientation: "bisexual", location: "SF Bay Area", interests: "golfing, karate, cooking", good_standing: true, availability: DateTime.now, other: "")



t = Mentee.create!(first_name: "Jane", last_name: "Thomas",email: "j@mail.com", objective: "code reviews", linkedin_link: "linkedin.com/jane", race: "Asian", gender: "female", socioeconomic_background: "middle", orientation: "straight", location: "SF Bay Area", interests: "beanie baby collection", good_standing: true, mentor_demographic_pref: true, other: "")

m = Match.create!(mentor_id: r.id, mentee_id: t.id)

a = Appointment.create!(location: "Peets coffee", mentor_rating: 4, mentee_rating: 3, mentor_id: r.id, mentee_id: t.id, datetime: DateTime.now)

# u = User.create(provider: "linkedinnn", uid: "0909090", name: "king kong")