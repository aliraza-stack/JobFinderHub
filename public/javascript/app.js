// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict';

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation');

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms).forEach((form) => {
        form.addEventListener('submit', (event) => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();

function togglePassword(eye, input) {
    $(eye).on('click', function () {
        let newType = input.attr('type') === "password" ? "text" : "password";
        input.attr('type', newType);
        this.classList.toggle("fa-eye");
        this.classList.toggle("fa-eye-slash");
    })
}

togglePassword('#eye1', $('#password1'));
togglePassword('#eye2', $('#password2'));

setTimeout(function () {
    $(".fade-out-alert").fadeOut("slow");
}, 6000);


function changeAlertIcon(alertType) {
    let iconClass = "fas fa-info-circle";
    if (alertType === "notice") {
        iconClass = "fas fa-check-circle text-success fa-fw me-2";
    } else if (alertType === "alert") {
        iconClass = "fas fa-exclamation-circle text-danger fa-fw me-2";
    }
    document.querySelector(".alert-icon").className = iconClass;
}

function changeClass(key) {
    if (key === "notice") {
        document.getElementById("liveToast").className = "toast toast-success show fade";
        document.getElementById("liveToastHead").className = "toast-header toast-success pb-1";
    } else if (key === "alert") {
        document.getElementById("liveToast").className = "toast toast-danger show fade";
        document.getElementById("liveToastHead").className = "toast-header toast-danger pb-1";
    }
}

$(function () {
    $('#phone').on('keypress paste', function (e) {
        if (e.keyCode < 48 || e.keyCode > 57) {
            e.preventDefault();
        }
    })
});



function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
});



// Start upload preview image
// $(".gambar").attr("src", "https://api.dicebear.com/5.x/adventurer-neutral/svg?seed=Angel");
// var $uploadCrop,
//     tempFilename,
//     rawImg,
//     imageId;
// function readFile(input) {
//     if (input.files && input.files[0]) {
//         var reader = new FileReader();
//         reader.onload = function (e) {
//             $('.upload-demo').addClass('ready');
//             $('#cropImagePop').modal('show');
//             rawImg = e.target.result;
//         }
//         reader.readAsDataURL(input.files[0]);
//     }
//     else {
//         swal("Sorry - you're browser doesn't support the FileReader API");
//     }
// }
//
// $uploadCrop = $('#upload-demo').croppie({
//     viewport: {
//         width: 200,
//         height: 200,
//         type: 'circle'
//     },
//     enforceBoundary: true,
//     enableExif: true
// });
// $('#cropImagePop').on('shown.bs.modal', function(){
//     // alert('Shown pop');
//     $uploadCrop.croppie('bind', {
//         url: rawImg
//     }).then(function(){
//         console.log('jQuery bind complete');
//     });
// });
//
// $('.item-img').on('change', function () { imageId = $(this).data('id'); tempFilename = $(this).val();
//     $('#cancelCropBtn').data('id', imageId); readFile(this); });
// $('#cropImageBtn').on('click', function (ev) {
//     $uploadCrop.croppie('result', {
//         type: 'base64',
//         format: 'jpeg'|'png'|'jpg',
//         size: {width: 200, height: 200}
//     }).then(function (resp) {
//         $('#item-img-output').attr('src', resp);
//         $('#cropImagePop').modal('hide');
//     });
// });

$('#avatar-icon').on('click', function () {
    $('#avatar-input').click();
});

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude.toFixed(4);
        var lng = position.coords.longitude.toFixed(4);
        $('#latitude').val(lat);
        $('#longitude').val(lng);
    });
} else {
    $('#location').val("Geolocation is not supported by this browser.")
}



if ($('#map').length !== 0) {
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude.toFixed(4);
        var lng = position.coords.longitude.toFixed(4);
        var userName = currentUser.name;
        var userPhone = currentUser.phone;
        var userEmail = currentUser.email;
        var userRole = currentUser.role;
    let map = L.map('map').setView([lat, lng], 15);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap | Labor Marketplace</a>'
    }).addTo(map);


    let popup = L.popup();

    function onMapClick(e) {
        popup
            .setLatLng(e.latlng)
            .setContent("You clicked the map at " + e.latlng.toString())
            .openOn(map);
    }
    map.on('click', onMapClick)

    let marker = L.marker([lat, lng]).addTo(map);

    let user = marker;

    user.bindPopup(
        "<div class=''>" + userName + "<br> " + userRole + "<br>" + userEmail + "<br>" + userPhone +"</div>"
    ).openPopup();
    laborUsers.forEach(function(user) {
        // Plot marker on the map for each user
        let marker = new L.Marker([user.latitude.toFixed(4), user.longitude.toFixed(4)]).addTo(map);

        marker.bindPopup("<div class=''>" + user.name + "<br> " + user.skill + "<br>" + user.email + "<br>" + user.phone +"</div>").openPopup();

    });
    });
}
