module Web.Controller.Courses where

import Web.Controller.Prelude
import Web.View.Courses.Index
import Web.View.Courses.New
import Web.View.Courses.Edit
import Web.View.Courses.Show

instance Controller CoursesController where
    action CoursesAction = do
        courses <- query @Course |> fetch
        teachers <- query @User |> fetch
        render IndexView { .. }

    action NewCourseAction = do
        let course = newRecord
        teachers <- query @User
            |> filterWhere (#userRole, Teacher)
            |> fetch
        render NewView { .. }

    action ShowCourseAction { courseId } = do
        course <- fetch courseId
        render ShowView { .. }

    action EditCourseAction { courseId } = do
        course <- fetch courseId
        hours <- query @CourseHour
            |> filterWhere (#courseId, get #id course)
            |> fetch
        teachers <- query @User
            |> filterWhere (#userRole, Teacher)
            |> fetch
        coursesRelations <- query @CoursesRelation
            |> filterWhere (#courseId, get #id course)
            |> fetch
        let studentIds = map (get #userId) coursesRelations
        students <- query @User
            |> filterWhereIn (#id, studentIds)
            |> fetch
        otherStudents <- query @User 
            |> filterWhere (#userRole, Student)
            |> filterWhereNotIn (#id, studentIds)
            |> fetch
        render EditView { .. }

    action UpdateCourseAction { courseId } = do
        course <- fetch courseId
        course
            |> buildCourse
            |> ifValid \case
                Left course -> do
                    hours <- query @CourseHour
                        |> filterWhere (#courseId, get #id course)
                        |> fetch
                    teachers <- query @User
                        |> filterWhere (#userRole, Teacher)
                        |> fetch
                    coursesRelations <- query @CoursesRelation
                        |> filterWhere (#courseId, get #id course)
                        |> fetch
                    let studentIds = map (get #userId) coursesRelations
                    students <- query @User
                        |> filterWhereIn (#id, studentIds)
                        |> fetch
                    otherStudents <- query @User 
                        |> filterWhereNotIn (#id, studentIds)
                        |> fetch
                    render EditView { .. }
                Right course -> do
                    course <- course |> updateRecord
                    setSuccessMessage "Kurs gespeichert"
                    redirectTo CoursesAction

    action CreateCourseAction = do
        let course = newRecord @Course
        course
            |> buildCourse
            |> ifValid \case
                Left course -> do
                    teachers <- query @User
                        |> filterWhere (#userRole, Teacher)
                        |> fetch
                    render NewView { .. } 
                Right course -> do
                    course <- course |> createRecord
                    setSuccessMessage "Kurs erstellt"
                    redirectTo CoursesAction

    action DeleteCourseAction { courseId } = do
        course <- fetch courseId
        deleteRecord course
        setSuccessMessage "Kurs gelöscht"
        redirectTo CoursesAction

buildCourse course = course
    |> fill @["name","teacherId"]
