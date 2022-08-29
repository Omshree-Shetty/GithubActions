
resource "aws_iam_user" "user1" {
  name = "User1"
}

resource "aws_iam_user" "user2" {
  name = "User2"
}

resource "aws_iam_group" "grp" {
  name = "demo-group"
}

resource "aws_iam_policy_attachment" "admin-attach" {
  name = "admin-attach"
  groups = [ aws_iam_group.grp.name ]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "grp" {
 name = "admin-users"
  users = [ aws_iam_user.user1.name ,
  aws_iam_user.user2.name ]
group = aws_iam_group.grp.name
}

