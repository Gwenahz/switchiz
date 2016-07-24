json.extract! profil, :id, :user_id, :smartphone_id, :couleur_id, :prenom, :nom, :adresse, :compl_adresse, :imei, :numtel, :created_at, :updated_at
json.url profil_url(profil, format: :json)