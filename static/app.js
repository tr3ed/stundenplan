document.addEventListener("ihp:load", () => {
    $("#searchbar").on("keyup", function() {
        var value = $(this).val().toLowerCase().replace(/\s+/g, '')
        $("tbody tr").filter(function() {
            $(this).toggleClass("search-d-none",$(this).text().toLowerCase().trim().indexOf(value) <= -1)
        });
    });

    var timetable = document.getElementById('timetable')
    var courseNames = $('#timetable').data("names");
    var courseHours = $('#timetable').data("hours");
    var courseDays = $('#timetable').data("days");
    var courseRooms = $('#timetable').data("rooms");
    var courseTeachers = $('#timetable').data("teachers");
    for (var i = 0; i < courseNames.length; i++) {
        var text = courseNames[i] + ' - ' + courseRooms[i]
        $('#'+courseDays[i]+'-'+courseHours[i]).text(text)
        $('#'+courseDays[i]+'-'+courseHours[i]).prop('title', courseTeachers[i])
        $('#'+courseDays[i]+'-'+courseHours[i]).css("background-color", stringToColour(text))
    }

    function stringToColour (str) {
        var hash = 0;
        for (var i = 0; i < 6; i++) {
            hash = str.charCodeAt(i) + ((hash << 5) - hash);
        }
        var colour = '#';
        for (var i = 0; i < 3; i++) {
            var value = (hash >> (i * 8)) & 0xFF;
            colour += ('00' + value.toString(16)).substr(-2);
        }
        return convertHex(colour, 20);
    }

    function convertHex(hexCode,opacity){
        var hex = hexCode.replace('#','');
    
        if (hex.length === 3) {
            hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
        }
    
        var r = parseInt(hex.substring(0,2), 16),
            g = parseInt(hex.substring(2,4), 16),
            b = parseInt(hex.substring(4,6), 16);
    
        return 'rgba('+r+','+g+','+b+','+opacity/100+')';
    }
});