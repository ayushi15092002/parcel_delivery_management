from flask import render_template, request, jsonify, session, redirect, url_for
from app import app, socketio, bcrypt, cursor, db
from app.models import jsonify_parcels
import pandas as pd

@app.route('/')
def index():
    if 'username' in session:
        if session['role'] == 'admin':
            return redirect(url_for('admin_dashboard'))
        elif session['role'] == 'user':
            return redirect(url_for('user_dashboard'))
    return redirect(url_for('login'))

# Admin Dashboard Route
@app.route('/admin/dashboard')
def admin_dashboard():
    if 'username' not in session or session['role'] != 'admin':
        return redirect(url_for('login'))
    
    return render_template('dashboard.html', username=session['username'])


# User Dashboard Route
@app.route('/user/dashboard')
def user_dashboard():
    if 'username' not in session or session['role'] != 'user':
        return redirect(url_for('login'))
    
    return render_template('userDashboard.html', username=session['username'])


# Login Route
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        user = cursor.fetchone()
        
        if user and bcrypt.check_password_hash(user[2], password):
            session['username'] = username
            session['user_id'] = user[0]
            print("user ", user)
            session['role'] = user[3]
            
            if user[3] == 'admin':
                return redirect(url_for('admin_dashboard'))
            elif user[3] == 'user':
                return redirect(url_for('user_dashboard'))
        
        return render_template('login.html', error='Invalid username or password')
    
    return render_template('login.html')


# Signup Route
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        password_hash = bcrypt.generate_password_hash(request.form['password']).decode('utf-8')
        role = request.form['role']
        
        cursor.execute('INSERT INTO users (username, password_hash, role) VALUES (%s, %s, %s)', (username, password_hash, role))
        db.commit()
        
        return redirect(url_for('login'))
    
    return render_template('signup.html')

# Logout Route
@app.route('/logout',  methods=['GET'])
def logout():
    session.pop('username', None)
    session.pop('user_id', None)
    session.pop('role', None)
    return jsonify({'message': 'Logged out successfully'})


# Add Parcel Route
@app.route('/parcels/add', methods=['POST'])
def add_parcel():
    try:
        if 'username' not in session:
            return jsonify({'error': 'Unauthorized'}), 401
        
        user_id = session['user_id']
        parcel_name = request.form['parcel_name']
        sender_name = request.form['sender_name']
        recipient_name = request.form['recipient_name']
        status = 'pending'  # Default status
        
        cursor.execute('INSERT INTO parcels (user_id, parcel_name, sender_name, recipient_name, status) VALUES (%s, %s, %s, %s, %s)', 
                    (user_id, parcel_name, sender_name, recipient_name, status))
        db.commit()
        parcelId = cursor.lastrowid
        cursor.execute('INSERT INTO transaction_logs (parcel_id, action) VALUES (%s, %s)', 
                    (cursor.lastrowid, f'Added parcel from {sender_name} to {recipient_name}'))
        db.commit()
        
        cursor.execute('SELECT * FROM parcels WHERE id = %s', (parcelId,))
        new_parcel = cursor.fetchone()
        print("new_parcel ", new_parcel)
        
        # Emit the socket event to update the parcel list
        parcel_dict = {
            'id': new_parcel[0],
            'parcel_name': new_parcel[7],
            'sender_name': new_parcel[2],
            'recipient_name': new_parcel[3],
            'status': new_parcel[4],
            'created_at': new_parcel[5].strftime('%Y-%m-%d %H:%M:%S') if new_parcel[5] else None,
            'updated_at': new_parcel[6].strftime('%Y-%m-%d %H:%M:%S') if new_parcel[6] else None
        }
        socketio.emit('new_parcel', parcel_dict)
        
        return jsonify(parcel_dict), 201
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500

# Get All Parcels Route
@app.route('/parcels', methods=['GET'])
def get_parcels():
    try:
        if 'username' not in session:
            return jsonify({'error': 'Unauthorized'}), 401
        
        cursor.execute('SELECT * FROM parcels WHERE user_id = %s', (session['user_id'],))
        parcels = cursor.fetchall()
        
        parcels_list = []
        for parcel in parcels:
            parcel_dict = {
                'id': parcel[0],
                'sender_name': parcel[2],
                'recipient_name': parcel[3],
                'status': parcel[4],
                'created_at': parcel[5].strftime('%Y-%m-%d %H:%M:%S'),
                'updated_at': parcel[6].strftime('%Y-%m-%d %H:%M:%S')
            }
            parcels_list.append(parcel_dict)
        
        return jsonify({'parcels': parcels_list})
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500


@app.route('/parcels/<int:parcel_id>', methods=['GET'])
def get_parcels_with_id(parcel_id):
    try:
        if 'username' not in session:
            return jsonify({'error': 'Unauthorized'}), 401

        print("parcel_id ", parcel_id)

        
        cursor.execute('SELECT * FROM parcels WHERE id = %s', (parcel_id,))
        parcels = cursor.fetchall()[0]
        print("parcels ", parcels)
        parcel_dict = {
            'id': parcels[0],
            'sender_name': parcels[2],
            'recipient_name': parcels[3],
            "parcel_name":parcels[7],
            'status': parcels[4],
            'created_at': parcels[5].strftime('%Y-%m-%d %H:%M:%S'),
            'updated_at': parcels[6].strftime('%Y-%m-%d %H:%M:%S')
        }

        print("parcel_dict ", parcel_dict)

        return jsonify({'parcels': parcel_dict})
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500
    

# Update Parcel Status Route
@app.route('/parcels/<int:parcel_id>/update_status', methods=['PUT'])
def update_parcel_status(parcel_id):
    try:
        if 'username' not in session:
            return jsonify({'error': 'Unauthorized'}), 401
        
        new_status = request.form.get('status')
        if not new_status:
            return jsonify({'error': 'Status not provided'}), 400
        
        cursor.execute('UPDATE parcels SET status = %s WHERE id = %s AND user_id = %s', (new_status, parcel_id, session['user_id']))
        if cursor.rowcount == 0:
            return jsonify({'error': 'Parcel not found or you are not authorized to update'}), 404
        
        db.commit()
        
        cursor.execute('INSERT INTO transaction_logs (parcel_id, action) VALUES (%s, %s)', (parcel_id, f'Updated status to {new_status}'))
        db.commit()
        
        cursor.execute('SELECT * FROM parcels WHERE user_id = %s', (session['user_id'],))
        parcels = cursor.fetchall()
        
        socketio.emit('update_parcels', {'parcels': jsonify_parcels(parcels)}, namespace='/')
        
        return jsonify({'message': 'Parcel status updated successfully'})
    
    except KeyError as e:
        return jsonify({'error': f'Missing required parameter: {str(e)}'}), 400
    
    except Exception as e:
        db.rollback()
        print(f"An error occurred: {str(e)}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500

# Get Parcel Logs Route
@app.route('/parcels/<int:parcel_id>/logs', methods=['GET'])
def get_parcel_logs(parcel_id):
    try:
        # Check if user is logged in
        if 'username' not in session:
            return jsonify({'error': 'Unauthorized'}), 401
        
        # Retrieve transaction logs for the specified parcel_id
        cursor.execute('SELECT * FROM transaction_logs WHERE parcel_id = %s', (parcel_id,))
        logs = cursor.fetchall()
        
        logs_list = []
        for log in logs:
            log_dict = {
                'id': log[0],
                'parcel_id': log[1],
                'action': log[2],
                'timestamp': log[3].strftime('%Y-%m-%d %H:%M:%S') if log[3] else None
            }
            logs_list.append(log_dict)
        
        return jsonify({'logs': logs_list})
    
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500

@app.route('/parcels/bulk_import', methods=['POST'])
def bulk_import_parcel():
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401
    
    if 'csvFile' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    
    file = request.files['csvFile']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    try:
        # Load CSV file into pandas DataFrame
        df = pd.read_csv(file)
        print("df ", df)
        
        total_records = len(df)
        print("total_records ", total_records)
        current_record = 0
        
        for index, row in df.iterrows():
            
            current_record += 1
            sender_name = row['sender_name']
            recipient_name = row['recipient_name']
            parcel_name = row['parcel_name']            
            # Insert into database
            cursor.execute('INSERT INTO parcels (user_id, parcel_name, sender_name, recipient_name) VALUES (%s, %s, %s, %s)', 
                           (session['user_id'], parcel_name, sender_name, recipient_name))
            db.commit()
            
            # Emit progress update via WebSocket
            socketio.emit('import_progress', {'message': f'Processing record {current_record} of {total_records}'})
        cursor.execute('SELECT * FROM parcels WHERE user_id = %s', (session['user_id'],))
        parcels = cursor.fetchall()
        
        # Use socketio.emit instead of emit and specify the namespace if necessary
        socketio.emit('update_parcels', {'parcels': jsonify_parcels(parcels)}, namespace='/')
        
        return jsonify({'message': 'Bulk import successful'}), 201
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500


@socketio.on('connect')
def test_connect(auth):
    cursor.execute('SELECT * FROM parcels WHERE user_id = %s', (session['user_id'],))
    parcels = cursor.fetchall()
    socketio.emit('update_parcels', {'parcels': jsonify_parcels(parcels)})

