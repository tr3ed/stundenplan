module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = HomeAction deriving (Eq, Show, Data)

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)


instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User
data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)

data CoursesController
    = CoursesAction
    | NewCourseAction
    | ShowCourseAction { courseId :: !(Id Course) }
    | CreateCourseAction
    | EditCourseAction { courseId :: !(Id Course) }
    | UpdateCourseAction { courseId :: !(Id Course) }
    | DeleteCourseAction { courseId :: !(Id Course) }
    deriving (Eq, Show, Data)

data CourseHoursController
    = CourseHoursAction
    | NewCourseHourAction { courseId :: !(Id Course) }
    | ShowCourseHourAction { courseHourId :: !(Id CourseHour) }
    | CreateCourseHourAction
    | EditCourseHourAction { courseHourId :: !(Id CourseHour) }
    | UpdateCourseHourAction { courseHourId :: !(Id CourseHour) }
    | DeleteCourseHourAction { courseHourId :: !(Id CourseHour) }
    deriving (Eq, Show, Data)

data CoursesRelationsController
    = CoursesRelationsAction
    | NewCoursesRelationAction
    | ShowCoursesRelationAction { coursesRelationId :: !(Id CoursesRelation) }
    | CreateCoursesRelationAction
    | EditCoursesRelationAction { coursesRelationId :: !(Id CoursesRelation) }
    | UpdateCoursesRelationAction { coursesRelationId :: !(Id CoursesRelation) }
    | DeleteCoursesRelationAction { courseId :: !(Id Course), userId :: !(Id User) }
    | AddUserToCourseAction { courseId :: !(Id Course), userId :: !(Id User) }
    deriving (Eq, Show, Data)
