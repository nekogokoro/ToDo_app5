json.id @to_do.id
json.title @to_do.title
json.finished @to_do.finished
json.expired_at @to_do.expired_at&.to_s