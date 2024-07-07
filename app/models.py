def jsonify_parcels(parcels):
    parcels_list = []
    for parcel in parcels:
        parcel_dict = {
            'id': parcel[0],
            'parcel_name': parcel[7],
            'sender_name': parcel[2],
            'recipient_name': parcel[3],
            'status': parcel[4],
            'created_at': parcel[5].strftime('%Y-%m-%d %H:%M:%S') if parcel[5] else None,
            'updated_at': parcel[6].strftime('%Y-%m-%d %H:%M:%S') if parcel[6] else None
        }
        parcels_list.append(parcel_dict)
    return parcels_list
