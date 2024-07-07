# Parcel Delivery Management System

## Description
This project is a Flask-based web application for managing parcel deliveries. It includes features such as user authentication, parcel management (add, update, track, and report on parcel status ) and provide real-time updates on long-running tasks, such as bulk parcel processing, and integration with a MySQL database.

## Deployment 
The application has been deployed using AWS EC2, providing reliable hosting and accessibility at http://3.110.85.217:8501/

## Technology Stack
- **Backend**: Python, Flask
- **Database**: MySQL
- **Real-time Communication**: Flask-SocketIO
- **Password Hashing**: Flask-Bcrypt
- **Data Handling**: Pandas (for CSV import)
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Frontend Interaction**: AJAX for asynchronous data fetching
- **Deployment**: AWS EC2

## Installation
1. Clone the repository: `https://github.com/ayushi15092002/parcel_delivery_management.git` `cd parcel_delivery_management`
2. Create a virutal Environment:  `python -m venv venv`
3. Activate the virtual Environment:  `.\env\Scripts\activate`
4. Install dependencies : `pip install -r requirements.txt`
5. Set up your environment variables by create a .env file in root directory:
    `
     DB_HOST=localhost
     DB_USER=root
     DB_PASSWORD=
     DB_NAME=parcel_management`
6. Initialize the database:
   Create a database named parcel_management and import the `parcel-management.sql` in it. 
7. Run the app: `python run.py`
   
## Screens
1. Login Screen
   Allows users (both regular users and admins) to authenticate using their credentials.
   url : http://3.110.85.217:8501/login
   ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/d8b46edd-7d16-4e8d-9b67-af4c2eebd1bc)
   
2. SignUp Screen
   Enables new users to create accounts to access the application.
   url: http://3.110.85.217:8501/signup
   ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/4da4028d-af8f-4304-869b-4cfdcf94245b)

4. User Dashboard Screen
    - Displays parcel tracking information for logged-in users.
    - Allows users to view details of their parcels, such as current status and other relevant information.
    ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/f8b7ff1e-866e-422c-85d4-bdff3ce29de5)


5. Admin Dashboard Screen
    Admins can manually add new parcels, import parcels in bulk from CSV files, update parcel statuses, and search/filter parcels based on specific criteria such as parcel name, status,      and dates.
   
    - To view all the parcels 
       ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/de94714d-13f9-4b34-8b72-448402431556)
    
    - For Bulk Processing
      ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/a04328b6-741f-4ac6-b2cf-7cf438d69c49)
      
    - To Add new Parcel
      ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/6d3bbe30-2a94-45b4-b228-13bc55465ef2)
    
    - To view Logs of the parcel
      ![image](https://github.com/ayushi15092002/parcel_delivery_management/assets/87222543/b18f21c3-90aa-4d45-80a5-bcb676ec8be8)
    

