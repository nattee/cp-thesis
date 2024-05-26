module ApplicationHelper

  def time_display(time)
    time.strftime('%d-%b-%y %H:%m')
  end

  def thai_date(date)

    month = %i[
    มกราคม กุมภาพันธ์
    มีนาคม เมษายน
    พฤษภาคม มิถุนายน
    กรกฎาคม สิงหาคม
    กันยายน ตุลาคม
    พฤศจิกายน ธันวาคม
    ]

    "#{date.day} #{month[date.month+1]} #{date.year+543}"
  end

  def badge_display(value, mapping = {
    '1' => {label: 'Yes', class: 'badge-subtle-success'},
    '0' => {label: 'No', class: 'badge-subtle-warning'} } )

    class_name = mapping[value][:class]
    label_text = mapping[value][:label] || value.titleize


    "<span class='badge rounded-pill #{class_name}'>#{label_text} </span>".html_safe
  end

end
