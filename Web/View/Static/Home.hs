module Web.View.Static.Home where
import Web.View.Prelude

data HomeView = HomeView
    { user :: User
    , courses :: [Course]
    , teachers :: [User]
    }

instance View HomeView where
    html HomeView { .. } = [hsx|
        <a>{get #firstname user}</a>
        {renderSchedule courses}

    <script>
        var timetable = document.getElementById('timetable')
        var courseNames = $('#timetable').data("names");
        var courseHours = $('#timetable').data("hours");
        var courseDays = $('#timetable').data("days");
        var courseTeachers = $('#timetable').data("teachers");
        for (var i = 0; i < courseNames.length; i++) {
            $('#'+courseDays[i]+'-'+courseHours[i]).text(courseNames[i])
            $('#'+courseDays[i]+'-'+courseHours[i]).prop('title', courseTeachers[i])
        }
    </script>

|]
        where
            renderSchedule :: [Course] -> Html
            renderSchedule courses = [hsx|
                <table
                    id="timetable"
                    data-names={getCourseNames courses}
                    data-hours={getCourseHours courses}
                    data-days={getCourseDays courses}
                    data-teachers={getCourseTeachers courses}
                    >
                    <thead>
                        <th></th>
                        <th>Montag</th>
                        <th>Dienstag</th>
                        <th>Mittwoch</th>
                        <th>Donnerstag</th>
                        <th>Freitag</th>
                    </thead>
                    <tbody>
                        {forEach [1..10] (\d -> tableRow (show d))}
                    </tbody>
                </table>
            |]

            getCourseNames :: [Course] -> Text
            getCourseNames courses = "[" <> intercalate "," (map (tshow . get #name) courses) <> "]"

            getCourseHours :: [Course] -> Text
            getCourseHours courses = "[" <> intercalate "," (map (show . get #hour) courses) <> "]"

            getCourseDays :: [Course] -> Text
            getCourseDays courses = "[" <> intercalate "," (map (show . get #weekday) courses) <> "]"

            getCourseTeachers :: [Course] -> Text
            getCourseTeachers courses = "[" <> intercalate "," (map (showTeacher . get #teacherId) courses) <> "]"

            showTeacher teacherId = case find (\t -> get #id t == teacherId) teachers of
                Just teacher -> tshow (get #lastname teacher)
                Nothing -> tshow ""

            tableRow hour = [hsx|
            <tr>
                <th>{hour}</th>
                <td id={"1-" <> hour}></td>
                <td id={"2-" <> hour}></td>
                <td id={"3-" <> hour}></td>
                <td id={"4-" <> hour}></td>
                <td id={"5-" <> hour}></td>
            </tr>|]