# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

Kruby::Application.config.session_store :cookie_store, :key => '_kruby_session'

Kruby::Application.config.action_controller.session = {
   :session_key => '_kruby_session',
   :secret      => '91f0b56bd7ce225451d290b92e3df757bed98bad7f1c22fec3e91056108b6db73be4725563b754e3d06c8c42fb80b297d3d5672d5aca43728442fd255c7028c5'
 }

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Kruby::Application.config.session_store :active_record_store
