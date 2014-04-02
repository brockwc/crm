class Rolodex
  attr_accessor :contacts

  @@id = 1000

  def initialize
    @contacts = []
  end

  def add(contact)
    contact.id = @@id
    @contacts << contact
    @@id += 1
  end

  def remove(id)
    @contacts.delete_if { |a| a.id == id }
  end

  def edit_menu
    puts "Please choose a field to edit.."
    puts "'1' - for first name:"
    puts "'2' - for last name:"
    puts "'3' - for email address:"
    puts "'4' - for notes:"
    puts "'0' - to return to the main menu"
  end

  def edit(id)
    edit_menu
    input = gets.chomp.to_i
    if input == 1
      puts "Enter a new first name:"
      new_first_name = gets.chomp
      @contacts.each do |contact|
        contact.first_name = new_first_name if contact.id == id
      end
    elsif input == 2
      puts "Enter a new last name:"
      new_last_name = gets.chomp
      @contacts.each do |contact|
        contact.last_name = new_last_name if contact.id == id
      end
    elsif input == 3
      puts "Enter a new email address:"
      new_email = gets.chomp
      @contacts.each do |contact|
        contact.email = new_email if contact.id == id
      end
    elsif input == 4
      puts "Enter a new note:"
      new_note = gets.chomp
      @contacts.each do |contact|
        contact.note = new_note if contact.id == id
      end
    elsif input == 0
      nil 
    else
      puts "Please choose one of the five options."
    end
  end

end
