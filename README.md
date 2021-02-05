# FlightCentreTest

Time spent: 4 hours - I only saw the nature of the test this morning and thought I complete what I can before the weekend. Happy to do another commit and deliver the tests, tableView sections based on date and the detail view

## Completed Tasks

- Installed Alamofire and SwiftyJSON for a future proof backend connection
- Connection to API Endpoint
- Created ressource bundle in .xcassets for our colours.
- Pull JSON from the backend
- Some formatting of the JSON contents
- Convert to array and populate the table
- Trips screen following the design specs
- Reusable UIView subclass for rounded views and shadow
- Auto constraints for the screen and tableviewcell
- Self populating tableviewcell

## Potential issues

- API endpoint and baseURL can't change, otherwise the App will not get any JSON. I have not implemented a backup solution to just load the JSON from the app bundle and there are no tests yet
- Some issues with the navigationbar not always displaying the Title as well as the status bar not showing

## Thoughts and Architecture

### .xcassets
using the .xcassets to define common values for colours will make future changes easier and make sure we always use the right colour.

### FlightService.swift

I decided to use Alamofire to connect to the URL instead of a simple NSURLsession. This is how I would implement a backend connection in a more realistic scenario. 

We define the baseAPIUrl and then attach the API endpoint in the call.

in getFlights we get the JSON and send it to the FlightList class as an array.

### FlightList

FlightList will be our return value. It will hold an array of FlightSearchResults and can be easily modified in the future.

### FlightSearchResult.swift

This is our model for an individual Flight. Here we can apply any formatting and process the information from the JSON. This model will be used to fill in the data in our search results in the table and then be passed on to the detail view.

It is extandable in the future.

### FlightListViewController.swift

Simple View Controller to hold the tableview and populate it.

I decided to design the ViewController in storyboard Main.storyboard. All AutoLayout values are applied in storyboard. 

### FlightResultCell

Designed in storyboard as a prototype cell in Main.Storyboard

This cell is self populating as soon as the FlightSearchResult is passed on to the cell from its parent view controller in "willDisplayCell"

## Challenges and issues

Occasionally I was getting a status 200 from the backend, I had to reformat the URL to resolve this issue and am not sure if the url is static or if the token in it is changing occasionally. If it is changing then the app won't load any data.

I did not check the nature of the test before this morning and was not expecting it to be this complex with a 48hour time frame on it.
I had to shuffle some commitments around and was able to free up a 4hour window to complete everything up to this point.

The design file did not allow me to download the assets for the airoplane icon. Instead I just took a screenshot of it as a quick workaround so the screen looks a bit more like it is supposed to...

Overall I very much enjoyed those 4 hours and it was a good challenge to see how far I could get. 







