# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Guest', email: 'guest@guest1234.com', password: '1234')
User.create(name: 'A Poet', email: 'a@guest1234.com', password: '5678')
Post.create(
  title: 'My favorite poems!',
  content: "e.e. cumming's [i carry your heart with me(i carry it in] (online at http://www.poetryfoundation.org/poetrymagazine/poem/179622);
    Rainer Marie Rilke's The Archaic Torso of Apollo (online at http://www.poets.org/poetsorg/poem/archaic-torso-apollo);
    Anything by Shel Silverstein! (Some poems online at http://thewhynot100.blogspot.com/2014/05/46-short-and-sweet-shel-silverstein.html)",
  user_id: 2)
Post.create(
  title: 'My first poem!',
  content: "Line breaks/ essential things/ I cannot/ make meaning of a poem/ with no line breaks",
  user_id: 2)
Comment.create(
  content: 'Yay poetry!',
  user_id: 1,
  post_id: 1)
