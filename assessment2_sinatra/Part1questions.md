
# 1. What is Sinatra? Where does it run?
	Sinatra is a server side ruby app.  It allows you to create sites that are responsive to users, that can store information in a db.

# 2. What is a Gemfile? How do you use it in your Sinatra Application? Give step by step instructions.
	Gemfiles list the gems (packets of ruby code) that our application relies on.
	When building a Sinatra app,
	1. Create a Gemfile in the main folder of the application
	2. In side the Gemfile, enter the source and gems you need
		example:
			source 'https://rubygems.org'
			ruby '2.0.0'
			gem 'sinatra'

				group :development do
					gem "shotgun"  #allows us to not have to restart server
					gem "tux"  #debugger for the app, allows interactivity 
				end

	3. In the terminal enter "Bundle install" to make sure you have all the gems versions required as listed in the Gemfile.
	4. You'll now have a Gemfile.lock file and can run your Sinatra app


# 3. What is an ORM? What are the basic features of an ORM? Why is it helpful?
	Object-Relational Mapping (ORM) shapes our database tables into classes. Rails for example comes with ActiveRecord.  Tables map to Classes.  Rows map to objects of the Classes. Columns map to object attributes.

# 4. What is the public folder? What do we use it for?
	The public folder is for items that are meant to be easily accessible from their url, such as images. 

# 5. What is REST? Why is it useful?
	Rest is a method for transfering user input between webpages.  The information is transferred in the params and allows us to modify our databased.  Although convenient, it lacks security.  

# 6. Suppose I, with my browser, send an HTTP get request to the route that will render the view of all the SpaceCats. Walk me through step by step how your application handles that request.
	Request from browser, that need to be matched with route.  The models apply logic, and the data are ran through views.  They return a string that is interpreted by the browser.
