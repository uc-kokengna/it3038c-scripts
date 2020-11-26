### from routes obtains info from routes.py and import all "app" info
from routes import app 

if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')
