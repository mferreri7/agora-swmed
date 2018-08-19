module ApplicationHelper
  def universiity_picture(note)
    university = note.university.upcase
    if university == "CES"
      image_tag "ces.jpeg", alt: "Eafit", class: "avatar"
    elsif university == "EAFIT"
      image_tag "Eafit.jpeg", alt: "alttext", class: "avatar"
    elsif university == "EIA"
      image_tag "EIA.jpeg", alt: "alttext", class: "avatar"
    elsif university == "POLITÉCNICO COLOMBIANO JAIME ISAZA CADAVID" || university == "POLITECNICO JAIME ISAZA CADAVID"
      image_tag "poli.jpeg", alt: "alttext", class: "avatar"
    elsif university == "UNIVERSIDAD DE ANTIOQUIA"
      image_tag "udea.jpeg", alt: "alttext", class: "avatar"
    elsif university == "UPB"
      image_tag "upb.jpeg", alt: "alttext", class: "avatar"
    elsif university == "ces"
      image_tag "upb.jpeg", alt: "alttext", class: "avatar"
    else
      image_tag "meta-pic.jpeg", alt: "alttext", class: "avatar"
    end
  end
end
