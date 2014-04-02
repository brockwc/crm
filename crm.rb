require './contact.rb'
require './rolodex.rb'

class CRM

  def initialize
    @rolodex = Rolodex.new
  end

  def main_menu
    puts "1. Add a new contact"
    puts "2. Modify an existing contact"
    puts "3. Delete a contact"
    puts "4. Display all contacts"
    puts "0. Exit"
  end

  def run
    done = false
    while !done
      main_menu
      input = gets.chomp.to_i
      if input == 0
        done = true
      elsif input == 1
        add_contact
      elsif input == 2
        modify_contact
      elsif input == 3
        remove_contact
      elsif input == 4
        show_all_contacts
      elsif input == 5
        display_attribute
      end
    end
  end

  def add_contact
    puts "\e[H\e[2J"
    puts "Enter first name:"
    first_name = gets.chomp
    puts "\e[H\e[2J"
    puts "Enter last name:"
    last_name = gets.chomp
    puts "\e[H\e[2J"
    puts "Enter email address:"
    email = gets.chomp
    puts "\e[H\e[2J"
    puts "Enter a note for this customer:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add(contact)
  end

  def modify_contact
    puts "\e[H\e[2J"
    puts "Enter the ID of the contact you wish to edit:"
    id = gets.chomp.to_i
    @rolodex.edit(id)
  end

  def remove_contact
    puts "\e[H\e[2J"
    puts "Enter the contact id you want to remove:"
    id = gets.chomp.to_i
    @rolodex.remove(id)
  end

  def show_all_contacts
    @rolodex.contacts.each do |contact|
    puts "-------------"
    puts "ID: #{contact.id}" 
    puts "Name: #{contact.first_name} #{contact.last_name}"
    puts "Email: #{contact.email}"
    puts "Notes: #{contact.note}"
    end
    puts "-------------"
  end
  
end

crm = CRM.new
crm.run