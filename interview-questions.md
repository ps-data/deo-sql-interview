### Data Model

#### ClipView (fact)
- `Date`
- `User`
- `Clip`
- `StartTime`
- `EndTime`
- `WatchSeconds`

#### User (dim)
- `UserId`
- `UserHandle`
- `UserName`
- `CreateDate`
- `Country`

#### Clip (dim) (hierarchy - Course / Module / Clip)
- `ClipId`
- `Course`
- `Module`
- `Subject` (Python, Java, Postgres, etc.)
- `PublishDate`

#### Date (dim)
- `DateId`
- `Date`
- `Month`
- `Year`

### Questions

1. **What course was watched by the most users in January 2020?**

2. **Which user consumed the most content (by watchSeconds) in January 2020? Display the user’s name, total number of courses consumed, and total seconds watched.**

3. **How would you return all days of January 2020 with the viewtime and distinct user count for each (if any)?**

4. **Bonus points: How many views were for 90% of the actual duration of the clip (meaning the user watched all or almost all of the clip)?**

5. **Which users viewed courses in at least 2 consecutive months?**
