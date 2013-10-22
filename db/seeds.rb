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

    # Items
    cct = Subcategory.find_by_name('coffee & cocktail tables')
    item = Item.new
    item.code = '1234'
    item.name = 'round pedestal swivel table'
    item.description = 'Table top in elm and elm root resting on round channeled baluster pedestal in birch, with elm and birch cross base ending in birch channeled feet. Iron swivel mechanism allows the table top to be rotated between the heights of 24" and 30". Takes one 18" extension leaf (original not available, new one to be custom made upon a sale).'
    item.subcategory_id = cct.id
    cct.items << item

    desks = Subcategory.find_by_name('desks')
    item = Item.new
    item.code = '2345'
    item.name = 'rectangular flame birch writing table'
    item.description = 'Table top with canted corners, lined with (new) leather, resting on an apron with three drawers. Four long saber legs. Made for free-standing.'
    item.subcategory_id = desks.id
    desks.items << item

    cabinets = Subcategory.find_by_name('cabinets')
    item = Item.new
    item.code = '3456'
    item.name = 'biedermeier period birch root and birch architectural armoire'
    item.description = 'Ebonized pediment resting on rectangular birch architrave with ebonized frieze molding on top of the birch structure with a pair of doors on top of a faux drawer, flanked by swollen ebonized columns with maple bases and capitals. Ebonized apron molding, block feet.'
    item.subcategory_id = cabinets.id
    cabinets.items << item

    user = User.new
    user.email = "zpopovic@combraygallery.com"
    user.password = "p@ssword"
    user.password_confirmation = "p@ssword"
    user.admin = true
    user.save

    # pages
    about = Page.new
    about.title = "about"
    about.text = "Prior to launching Combray Gallery in 2013, Zoran Popovic spent 15 years in the Manhattan antiques market. Former gallery manager of Ritter Antik, Zoran is a USPAP qualified appraiser and a founder of Popovic Appraisal & Consulting, a full service appraisal and collection management firm."
    about.save

    home = Page.new
    home.title = "home"
    home.text = "Combray Gallery offers authentic European continental furniture and decorative arts from 18th through 20th Century, with a special focus on Sweden, Austria, Germany and France."
    home.save
