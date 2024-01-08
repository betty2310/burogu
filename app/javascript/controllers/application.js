import { Application } from "@hotwired/stimulus";
import Tabs_controller from "./tabs_controller";

const application = Application.start();

application.register("tabs", Tabs_controller);

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
