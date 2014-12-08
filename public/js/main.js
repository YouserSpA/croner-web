// $(document).on('ready', function() {

// /* API Google Maps*/
//     var $map = $('#map')
//       , map
//       , center = new google.maps.LatLng(-33.430009,-70.625485)
//       , marker_position = new google.maps.LatLng(-33.43224,-70.623055)
//       , infowindow = new google.maps.InfoWindow()
    
//     var mapOptions = {
//         zoom: 17,
//         center: center,
//         mapTypeControl: false,
//         panControl: false,
//         zoomControl: true,
//         scrollwheel:false,
//         draggable: (Modernizr.touch)? false : true,
//         zoomControlOptions: {
//             style: google.maps.ZoomControlStyle.LARGE,
//             position: google.maps.ControlPosition.RIGHT_CENTER
//         },
//         streetViewControl: false
//     }
    
//     map = new google.maps.Map(document.getElementById("map"),mapOptions)
//     marker = new google.maps.Marker({ position: marker_position, map: map, title: 'Requies'})
//     infowindow.setContent('<span class="dark">Cuéntanos tus ideas!</span>')
//     infowindow.open(map, marker)
    
//     google.maps.event.addListener(marker , 'click', function () {
//         infowindow.open(map, marker)
//     })


// })