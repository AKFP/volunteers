// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
import VolunteersController from "./volunteers_controller"
import PlacesController from "./places_controller"
import ActivitiesController from "./activities_controller"
import DashboardController from "./dashboard_controller"

application.register("hello", HelloController)
application.register("volunteers", VolunteersController)
application.register("places", PlacesController)
application.register("activities", ActivitiesController)
application.register("dashboard", DashboardController)
