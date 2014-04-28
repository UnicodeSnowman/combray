pdf.font "#{Rails.root}/public/fonts/Muli-Regular.ttf", :size => 12

pdf.image "#{Rails.root}/app/assets/images/print_letterhead.png", :width => 280, :position => :center, :vposition => :top

pdf.image open("#{@item.photos.first.photo.main_show.url}"), :width => 350, :position => :center

pdf.text "#{@item.name.titleize}", :margin => 60

pdf.move_down(15)

pdf.text "Ref #: #{@item.code}"

pdf.move_down(15)

pdf.text "#{@item.description}", :leading => 3

pdf.move_down(15)

pdf.text "Age: #{@item.age}   Origin: #{@item.origin}   Measurements: #{@item.measurements}"

pdf.move_down(15)

pdf.image "#{Rails.root}/app/assets/images/print_footer.png", :position => :center, :width => 300, :vposition => :bottom
