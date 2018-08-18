json.extract! note, :id, :university, :degree, :subject, :semester, :description, :attachment, :created_at, :updated_at
json.url note_url(note, format: :json)
