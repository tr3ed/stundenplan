module Web.Controller.CourseHours where

import Web.Controller.Prelude
import Web.View.CourseHours.Index
import Web.View.CourseHours.New
import Web.View.CourseHours.Edit
import Web.View.CourseHours.Show

instance Controller CourseHoursController where
    action CourseHoursAction = do
        courseHours <- query @CourseHour |> fetch
        render IndexView { .. }

    action NewCourseHourAction { courseId } = do
        let courseHour = newRecord
        courses <- query @Course |> fetch
        render NewView { .. }

    action ShowCourseHourAction { courseHourId } = do
        courseHour <- fetch courseHourId
        render ShowView { .. }

    action EditCourseHourAction { courseHourId } = do
        courseHour <- fetch courseHourId
        courses <- query @Course |> fetch
        render EditView { .. }

    action UpdateCourseHourAction { courseHourId } = do
        courseHour <- fetch courseHourId
        let courseId = get #courseId courseHour
        courseHour
            |> buildCourseHour
            |> ifValid \case
                Left courseHour -> do
                    courses <- query @Course |> fetch
                    render EditView { .. }
                Right courseHour -> do
                    courseHour <- courseHour |> updateRecord
                    setSuccessMessage "Kursstunde gespeichert"
                    redirectTo EditCourseAction { .. }

    action CreateCourseHourAction = do
        let courseHour = newRecord @CourseHour
        let courseId = param @(Id Course) "courseId"
        courseHour
            |> buildCourseHour
            |> ifValid \case
                Left courseHour -> do
                    courses <- query @Course |> fetch
                    render NewView { .. } 
                Right courseHour -> do
                    courseHour <- courseHour |> createRecord
                    setSuccessMessage "Kursstunde erstellt"
                    redirectTo EditCourseAction { .. }

    action DeleteCourseHourAction { courseHourId } = do
        courseHour <- fetch courseHourId
        let courseId = get #courseId courseHour
        deleteRecord courseHour
        setSuccessMessage "Kurstelle gelöscht"
        redirectTo EditCourseAction { .. }

buildCourseHour courseHour = courseHour
    |> fill @["hour","day","courseId","room"]
