roles = ['physician', 'nurse', 'subject']
10.times do
  patient = Patient.create(
    name: Faker::Educator.patient_name
  )
 
  10.times do 
    doctor = Doctor.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      role: roles.sample,
      patient_id: patient.id,
      doctor_id: doctor.id
    )
  end
end

puts "Data Seeded."