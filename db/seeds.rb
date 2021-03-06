# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.create(name: 'Running',duration_mins: 30,indoor_score: 2, outdoor_score: 4,cardio_score: 5, strength_score: 0, physicality_score: 5,mentality_score: 2,solo_score: 5,team_score: 4,intensity_score: 4,weather_restricted: true)
Activity.create(name: 'Walking',duration_mins: 45,indoor_score: 2, outdoor_score: 4,cardio_score: 3, strength_score: 0, physicality_score: 5,mentality_score: 1,solo_score: 5,team_score: 4,intensity_score: 1,weather_restricted: true)
Activity.create(name: 'Meditation',duration_mins: 15,indoor_score: 5, outdoor_score: 5,cardio_score: 0, strength_score: 0, physicality_score: 0,mentality_score: 5,solo_score: 5,team_score: 3,intensity_score: 0,weather_restricted: false)
Activity.create(name: 'Cycling',duration_mins: 30,indoor_score: 0, outdoor_score: 5,cardio_score: 4, strength_score: 2, physicality_score: 5,mentality_score: 2,solo_score: 5,team_score: 4,intensity_score: 4,weather_restricted: true)
Activity.create(name: 'Skipping Rope (Indoor)',duration_mins: 20,indoor_score: 3, outdoor_score: 4,cardio_score: 5, strength_score: 2, physicality_score: 5,mentality_score: 3,solo_score: 5,team_score: 1,intensity_score: 4,weather_restricted: false)
Activity.create(name: 'Skipping Rope (Outdoor)',duration_mins: 20,indoor_score: 3, outdoor_score: 4,cardio_score: 5, strength_score: 2, physicality_score: 5,mentality_score: 3,solo_score: 5,team_score: 1,intensity_score: 4,weather_restricted: true)

Activity.create(name: 'Yoga',duration_mins: 30,indoor_score: 5, outdoor_score: 3,cardio_score: 1, strength_score: 2, physicality_score: 4,mentality_score: 4,solo_score: 4,team_score: 4,intensity_score: 2,weather_restricted: false)
Activity.create(name: 'Breathing Exercises',duration_mins: 5,indoor_score: 5, outdoor_score: 5,cardio_score: 0, strength_score: 0, physicality_score: 0,mentality_score: 4,solo_score: 5,team_score: 1,intensity_score: 1,weather_restricted: false)
Activity.create(name: 'Reading',duration_mins: 30,indoor_score: 4, outdoor_score: 4,cardio_score: 0, strength_score: 0, physicality_score: 0,mentality_score: 5,solo_score: 5,team_score: 0,intensity_score: 1,weather_restricted: false)
Activity.create(name: 'Stretching',duration_mins: 10,indoor_score: 5, outdoor_score: 5,cardio_score: 0, strength_score: 0, physicality_score: 5,mentality_score: 1,solo_score: 5,team_score: 0,intensity_score: 1,weather_restricted: false)

#seeds for daily steps recomendations
for age in 4..6
	RecommendedDailyStep.create(age: age,minimum: 6000, medium: 10000, high:14500)
end
for age in 7..11
	RecommendedDailyStep.create(age: age,minimum: 6000, medium: 12000, high:14500)
end
for age in 12..19
	RecommendedDailyStep.create(age: age,minimum: 6000, medium: 10000, high:12500)
end
for age in 20..65
	RecommendedDailyStep.create(age: age,minimum: 3000, medium: 7000, high:11500)
end
for age in 66..120
	RecommendedDailyStep.create(age: age,minimum: 3000, medium: 7000, high:10500)
end
