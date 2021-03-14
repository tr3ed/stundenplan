module Web.View.Static.Home where
import Web.View.Prelude

data HomeView = HomeView
    { user :: User
    , courses :: [Course]
    , teachers :: [User]
    , courseHours :: [CourseHour]
    }

instance View HomeView where
    html HomeView { .. } = [hsx|
        <h1 class="mb-5">Stundenplan</h1>
        {renderSchedule courses}

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
                    data-rooms={getCourseRooms courses}
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


            getCourseTeachers :: [Course] -> Text
            getCourseTeachers courses = "[" <> intercalate "," (map (showTeacher . get #teacherId) courses) <> "]"

            showTeacher teacherId = case find (\t -> get #id t == teacherId) teachers of
                Just teacher -> tshow (get #lastname teacher)
                Nothing -> tshow ""

            tableRow hour = [hsx|
            <tr>
                <th>{hour}</th>
                <td class="course" id={"1-" <> hour}></td>
                <td class="course" id={"2-" <> hour}></td>
                <td class="course" id={"3-" <> hour}></td>
                <td class="course" id={"4-" <> hour}></td>
                <td class="course" id={"5-" <> hour}></td>
            </tr>|]

            getCourseHoursDB :: Course -> [CourseHour]
            getCourseHoursDB course = (filter (\c -> get #courseId c == get #id course) courseHours)

            getCourseName :: Course -> Text
            getCourseName course = intercalate "," (map (\c -> tshow $ get #name course) (getCourseHoursDB course))

            getCourseNames :: [Course] -> Text 
            getCourseNames courses = "[" <> intercalate "," (map getCourseName courses) <> "]"

            getCourseHour :: Course -> Text
            getCourseHour course = intercalate "," (map (\c -> show $ get #hour c) (getCourseHoursDB course))

            getCourseHours :: [Course] -> Text 
            getCourseHours courses = "[" <> intercalate "," (map getCourseHour courses) <> "]"

            getCourseDay :: Course -> Text
            getCourseDay course = intercalate "," (map (\c -> show $ get #day c) (getCourseHoursDB course))

            getCourseDays :: [Course] -> Text 
            getCourseDays courses = "[" <> intercalate "," (map getCourseDay courses) <> "]"

            getCourseRoom :: Course -> Text
            getCourseRoom course = intercalate "," (map (\c -> tshow $ get #room c) (getCourseHoursDB course))

            getCourseRooms :: [Course] -> Text 
            getCourseRooms courses = "[" <> intercalate "," (map getCourseRoom courses) <> "]"
            

            