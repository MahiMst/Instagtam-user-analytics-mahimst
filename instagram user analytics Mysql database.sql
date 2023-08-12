-- Marketing analysius


-- Find five oldest instagram users.

select username,created_at from users order by created_at limit 5;

-- Identify users who have never posted a single photo on Instagram.

select * from photos,users;
select * from users as u left join photos as p on user_id = u.id where image_url is null order by username;







-- Determine the winner of the contest and provide their details to the team

select * from likes, photos, users;
select likes.photo_id,users.username, count(likes.user_id) as numbersoflikes from likes 
inner join photos on likes.photo_id = photos.id
inner join users on photos.user_id = users.id
group by likes.photo_id, users.username
order by numbersoflikes desc; 

-- Identify and suggest the top five most commonly used hashtags

select * from photo_tags,tags;
select t.tag_name,count(p.photo_id) as hastages from photo_tags p inner join tags t on t.id = p.tag_id 
group by t.tag_name
order by hastages desc limit 5; 


-- Day of the week when most users register on Instagram

select * from users;
select date_format((created_at), '%W') as dow, count(username) from users group by 1 order by 2 desc;




-- INVESTER MATRICS

-- Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.

SELECT * FROM photos,users;
with temp_table as(
select u.id as userid,count(p.id) as photoid from users u left join photos p on p.user_id=u.id
group by u.id)
select sum(photoid) as totalphotos,count(userid) as total_users,sum(photoid)/count(userid)
as photoperuser from temp_table;



-- Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.

select * from users,likes;
with temp_table as(
select u.username,count(l.photo_id) as likess from likes l inner join users u on u.id = l.user_id
group by u.username)
select username,likess from  temp_table where likess = (select count(*) from photos) order by username





--





-- precticing



-- Determine the winner of the contest and provide their details to the team.

select * from likes, photos, users


--precticing

select * from users


select * from users, photos;
select * from photos as p Right join users as u on u.id = user_id where image_url is null order by username;

