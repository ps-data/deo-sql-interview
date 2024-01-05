# DE Interview for Pluralsight

## Load Sample Data

*   Navigate to [SQLite Online](https://sqliteonline.com/)
*   Select Postgres in the left rail.
*   Run the scripts in this repository `DE_inteview_script.sql` in the console.
*   Complete the interview questions listed in the `README`.

## Entity Relationship Diagram


[![Lucid Chart](https://lucid.app/publicSegments/view/b66aaa89-0c1f-4b9d-ab94-0bc7df4a215f/image.jpeg "ERD")](https://lucid.app/publicSegments/view/b66aaa89-0c1f-4b9d-ab94-0bc7df4a215f/image.jpeg)

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

- **Bonus points: How many views were for 90% of the actual duration of the clip (meaning the user watched all or almost all of the clip)?**

4. **Which users viewed courses in at least 2 consecutive months?**
