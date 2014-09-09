# this class responds to a table in the database
# which means we can use it to manipulate the data

class Link

# this makes the instances of this class Datamapper resouces
  Include Datamapper::Resource

# this block describes what resources our model will have
  property :id,     Serial # serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String

end