# -*- encoding : utf-8 -*-
module UsersHelper
  
  def fejl_users
    session[:fejl] = error_messages_for :user,
    						:object => nil,
    						:object_name => nil,
    						#:header_message => 	nil,
    						:message => nil
    
    # Nedenfor du bestemme hvilken tekst du vil bruge som erstatning for den normale. Husk at nulstille session[:fejl] 
    # når f.eks. brugeren er oprettet som i dette tilfælde.						
    # if session[:fejl].length > 0
    #       session[:fejl] = 
    #       '<div id="errorExplanation" class="errorExplanation"><ul>
    #       <li>Felter markeret med rødt, skal udfyldes!<br/>Login skal være min. 3 karakterer og password min. 4</li></ul></div>'
    #     else
    #       session[:fejl] = nil
    #     end

  end
  
  def error_messages_for(*params)
    options = params.extract_options!.symbolize_keys
    if object = options.delete(:object)
      objects = [object].flatten
    else
      objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
    end
    count   = objects.inject(0) {|sum, object| sum + object.errors.count }
    unless count.zero?
      html = {}
      [:id, :class].each do |key|
        if options.include?(key)
          value = options[key]
          html[key] = value unless value.blank?
        else
          html[key] = 'errorExplanation'
        end
      end
      options[:object_name] ||= params.first
      #options[:header_message] = "#{pluralize(count, 'error')} prohibited this #{options[:object_name].to_s.gsub(/\w{1}/, ' ')} from being saved" unless options.include?(:header_message)
      options[:header_message] = "#{count} fejl opstod" unless options.include?(:header_message)
      options[:message] ||= 'Følgende fejl opstod:' unless options.include?(:message)
      error_messages = objects.sum {|object| object.errors.full_messages.map {|msg| content_tag(:li, msg) } }.join
      contents = ''
      contents << content_tag(options[:header_tag] || :h2, options[:header_message]) unless options[:header_message].blank?
      contents << content_tag(:p, options[:message]) unless options[:message].blank?
      error_messages = error_messages.gsub(/Password confirmation/, '"Bekræft adgangskode"')
      error_messages = error_messages.gsub(/Password/, 'Adgangskode')
      error_messages = error_messages.gsub(/minimum is/, 'min. er')
      error_messages = error_messages.gsub(/is too short/, 'er for kort')
      error_messages = error_messages.gsub(/can\'t be blank/, 'må ikke være tom')
      error_messages = error_messages.gsub(/characters/, 'karakterer')
      error_messages = error_messages.gsub(/has already been taken/, 'er allerede taget')
      error_messages = error_messages.gsub(/doesn\'t match confirmation/, 'passer ikke med det bekræftede')
      
      contents << content_tag(:ul, error_messages) 

      content_tag(:div, contents, html)
    else
      ''
    end
  end
  
end
