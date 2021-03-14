module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Home

instance Controller StaticController where
    action HomeAction = do
        ensureIsUser
        let user = currentUser
        coursesRelations <- query @CoursesRelation
            |> filterWhere (#userId, get #id user)
            |> fetch
        let courseIds = map (get #courseId) coursesRelations
        courses <- query @Course
            |> filterWhereIn (#id, courseIds)
            |> fetch
        let courseIds = map (get #id) courses
        teachers <- query @User |> fetch
        courseHours <- query @CourseHour 
            |> filterWhereIn (#courseId, courseIds)
            |> fetch
        render HomeView { .. }