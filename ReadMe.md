# Quickstart guide for GovHack

This project provides a template, instructions and solutions to some of the issues we suspect we will hit when setting up a simple Meteor app that utilises Australian energy rating datasets to do simple analysis.

Datasets:
Looks like we might need to incorporate something to cater for models getting superseded; e.g. Electrolux ETM4200S fridge is in the spreadsheet twice, with quite different energy consumption. Offer the user a choice of year if there’s more than one match perhaps?

## Air conditioners
Energy figures seem to be based on number of hours p.a. cooling and heating. Calculation seems to be:
- Power input x cost per KwH x hours p.a.
Power inputs have two separate columns, for cooling and heating:
- C-Power-inp-rated (cooling)
- H-power-inp-rated (heating)

## Clothes dryers
Energy figures (KwH) for 52 uses per year is in the New CEC column.

## Dishwashers
Energy figures (KwH) for 365 uses per year are in the “CEC-“ column.

## Washing machines
Energy figures (KwH) for 365 warm washes per year are in the “CEC-“ column.
Energy figures (KwH) for 365 cold washes per year are in the “CEC-Cold” column.
A good number of machines (1/3?) have no figure for cold wash energy consumption; and quite a few have 0, which is obviously not correct.

## Fridges and freezers
Energy figures (KwH) for a year’s usage is in the “CEC-“ column.

## Televisions
Energy figures (KwH) for a year’s usage are in the “CEC” column. [http://www.energyrating.gov.au/products-themes/home-entertainment/televisions/star-rating/]says that the figures are based on 10 hours a day ON and 14 hours a day in standby.
Figures are shown for standby (pasv-stnd-power) and ON energy consumption (avg-mode-power). These are in Watts, I think per hour. 
Figures don’t quite add up though, calculating from the power figures we always get a little less than the CEC.
It’s probably not a big deal as costs p.a. for TVs are not high (even with 10 hours a day usage!) so we may not want to bother allowing usage adjustment for TVs.
But, we may want to **ask the data expert what the deal is** nevertheless.



1. Create meteor project
2. Add .gitignore
3. Create git repository and do initial commit
3. Add standard packages (meteor add)
	- underscore
	- jquery
	- coffeescript
	- less
4. Add meteorite packages then commit _(if you get a “there was a problem checking out tag” error, use mrt uninstall —system to kill the .meteorite directory, then try again)_
	- bootstrap3-less ([https://github.com/simison/bootstrap3-less/], [http://getbootstrap.com])
	- npm
	- select2
	- select2-bootstrap3-css
	- iron-router ([https://github.com/EventedMind/iron-router])
5. Add the csvtojson npm package ([https://github.com/Keyang/node-csvtojson]) by editing the packages.json file: "csvtojson": "0.3.11"
6. Bring in the bootstrap stylesheet and link to the fonts:
	- Create a styles.less file in the root folder and add @import "/packages/bootstrap3-less/bootstrap.import.less";
	- cd public
	- ln -s ../packages/bootstrap3-less/lib/fonts ./
7. Setup our directory structure and delete the boilerplate example files
	- client
		- lib
		- pages
	- lib
	- methods
	- models
	- server
		- methods
8. Create a head.html file in a new client/pages/layout directory
'' <head>
	'' <title>GovHack</title>
	'' <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
'' </head>
'' 
'' <body>
'' <!-- empty body -->
'' </body>
9. Create home and admin page templates and .coffee files with simple routing: e.g.
`Router.map ->`
`	@route 'admin',`
`		path: '/admin'`
`		template: 'admin'`
10. Add a “categories” collection and prepopulate it
11. Add file upload code to the admin page front and backends
12. Remove the insecure and autopublish packages and setup publish and subscribe rules for categories and energyRatings
13. Add some category row counts to the admin screen
14. Pick and add a (free) bootstrap theme
	- [http://bootswatch.com/] (lumen, united, flatly are nice)
	- [http://www.bootstrapzero.com/bootstrap-templates]
	- [http://startbootstrap.com] (grayscale is nice and might work OK - [http://startbootstrap.com/templates/grayscale/])
	- [http://gratisography.com/] open source images
15. Assuming we decide to go with the “grayscale” theme, we will need to install jquery easing:
	- $ mrt add jquery-easing
16. Change the background images from the grayscale theme to something more appropriate
17. $ mrt install chartjs ([http://www.chartjs.org])
	- this one seems to be the best supported
	- there’s also c3 ([http://c3js.org])
18. $ mrt add bootstrap-slider