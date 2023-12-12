import os
from flask import Flask
from . import db

def create_app(test_config=None):
    # create and configure the app
    # app = Flask(__name__, instance_relative_config=True)
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY="IBelieveICanFly",
        SQLALCHEMY_DATABASE_URI=os.getenv("DATABASE_URL", "sqlite:////data/app.db"),
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
    )

    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////data/app.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.secret_key = 'IBelieveICanFly'

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    
    db.init_app(app)
    #@app.before_first_request 
    #def create_tables():
        #db.init_db_command()
    
    # Import and register the blueprint for authentication from the factory. 
    from . import auth
    app.register_blueprint(auth.bp)

    # Import and register the blueprint for the blog posts (tasks).
    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')

    # This route is used for testing. 
    @app.route('/hello')
    def hello():
        return "Hello, World!"

    return app




app = create_app() 

# app.run(port=8000, debug=True)


