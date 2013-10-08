# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Category.delete_all
    Subcategory.delete_all
    Item.delete_all
    Photo.delete_all
    User.delete_all

    Category.create([
      { name: 'seating'}, 
      { name: 'case pieces'},
      { name: 'tables' },
      { name: 'misc' },
      { name: 'fine art' }
    ])

    # Category: Seating
    seating = Category.find_by_name('seating')
    seating_subcategories = [
      Subcategory.new({:name => 'side chairs'}),
      Subcategory.new({:name => 'arm chairs'}),
      Subcategory.new({:name => 'bergeres'}),
      Subcategory.new({:name => 'sofas & daybeds'}),
      Subcategory.new({:name => 'stools'})
    ]
    seating_subcategories.each do |subcat|
      seating.subcategories << subcat
    end

    # Category: Case Pieces
    case_pieces = Category.find_by_name('case pieces')
    case_pieces_subcategories = [
      Subcategory.new({:name => 'cabinets'}),
      Subcategory.new({:name => 'vitrines & etageres'}),
      Subcategory.new({:name => 'buffets'}),
      Subcategory.new({:name => 'commodes'})
    ]
    case_pieces_subcategories.each do |subcat|
      case_pieces.subcategories << subcat
    end
    
    # Category: Tables
    tables = Category.find_by_name('tables')
    tables_subcategories = [
      Subcategory.new({:name => 'center tables'}),
      Subcategory.new({:name => 'side tables'}),
      Subcategory.new({:name => 'dining tables'}),
      Subcategory.new({:name => 'coffee & cocktail tables'}),
      Subcategory.new({:name => 'desks'}),
      Subcategory.new({:name => 'consoles'})
    ]
    tables_subcategories.each do |subcat|
      tables.subcategories << subcat
    end

    # Category: MISC
    misc = Category.find_by_name('misc')
    misc_subcategories = [
      Subcategory.new({:name => 'Decorative Arts'}),
      Subcategory.new({:name => 'Lighting'}),
      Subcategory.new({:name => 'Mirrors'})
    ]
    misc_subcategories.each do |subcat|
      misc.subcategories << subcat
    end

    # Category: Fine Art
    fine_art = Category.find_by_name('fine art')
    fine_art_subcategories = [
      Subcategory.new({:name => 'Norman Mooney'}),
      Subcategory.new({:name => 'Landscapes'})
    ]
    fine_art_subcategories.each do |subcat|
      fine_art.subcategories << subcat
    end

    user = User.new
    user.email = "zpopovic@combraygallery.com"
    user.password = "p@ssword"
    user.password_confirmation = "p@ssword"
    user.admin = true
    user.save
