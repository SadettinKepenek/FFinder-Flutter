import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key) {}

  @override
  State<StatefulWidget> createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  UserDetailDto profileDto;
  Widget _mainPageWidget;
  UserLoginResponseDto loginResponseDto;
  Widget get mainPageWidget {
    if (profileDto == null) {
      return _mainPageWidgetLoading();
    }
    return _mainPageWidgetCompleted();
  }

  set mainPageWidget(Widget widget) {
    if (!mounted) return;
    setState(() {
      _mainPageWidget = widget;
    });
  }

  _loadProfile() async {
    var response = await ApiService.getMyProfile();
    profileDto = response;
    mainPageWidget = _mainPageWidgetCompleted();
    profileDto.post.sort((a, b) => b.publishDate.compareTo(a.publishDate));
    loginResponseDto = await StorageService.getAuth();
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return mainPageWidget;
  }

  _buildTop() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0),
          child: Card(
            child: Column(
              children: <Widget>[
                _buildProfile(),
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildProfilePhoto() {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(profileDto.profilePhotoUrl),
          radius: 50,
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: 0.1,
          width: 10,
        ),
      ],
    );
  }

  _buildProfileInfo() {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width - 150,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Gönderi Sayısı"),
              Text("Takipçi"),
              Text("Takip Edilen"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${profileDto.post.length}"),
              Text("${profileDto.follower.length}"),
              Text("0"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Takip Et"),
                onPressed: () {},
                elevation: 10,
              ),
              SizedBox(
                width: 2,
              ),
              RaisedButton(
                child: Text("Mesaj"),
                onPressed: () {},
                elevation: 10,
              )
            ],
          )
        ],
      ),
    );
  }

  _buildProfile() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_buildProfilePhoto(), _buildProfileInfo()],
        ),
      ],
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[_buildProfilePhoto(), _buildProfileInfo()],
    );
  }

  _buildPostImageTop() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 8, 5),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileDto.profilePhotoUrl),
                    radius: 15,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "berkayalcin",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildPostBody(post) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: .5),
      child: Image.network(
        post.postImageUrl,
        height: 280,
        cacheHeight: 280,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: .5, color: Colors.blueGrey),
              top: BorderSide(width: .5, color: Colors.blueGrey),
              left: BorderSide(width: .5, color: Colors.blueGrey),
              right: BorderSide(width: .5, color: Colors.blueGrey)),
          shape: BoxShape.rectangle),
    );
  }

  bool _isLiked(PostDetailDto dto) {
    assert(loginResponseDto != null);
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && rate.isLike);
    return isLike;
  }

  bool _isDisliked(PostDetailDto dto) {
    assert(loginResponseDto != null);
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && !rate.isLike);
    return isLike;
  }

  _buildPostActionButtons(PostDetailDto dto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.mood),
          iconSize: 24,
          color: _isLiked(dto) ? Colors.green : Colors.black,
          onPressed: () {
            print(dto.postId);
          },
        ),
        IconButton(
          icon: Icon(Icons.mood_bad),
          onPressed: () {},
          iconSize: 24,
          color: _isDisliked(dto) ? Colors.red : Colors.black,
        ),
        IconButton(
          icon: Icon(Icons.comment),
          onPressed: () {},
          iconSize: 24,
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
          iconSize: 24,
        ),
      ],
    );
  }

  _buildPostLikes(PostDetailDto post) {
    return Padding(
      child: Row(
        children: <Widget>[
          Text(
            "${post.rates.where((data) => data.isLike).toList().length} Likes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 0.1,
            width: 5,
          ),
          Text(
            "${post.rates.where((data) => data.isLike == false).toList().length} Dislikes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
    );
  }

  _buildPostInfo(PostDetailDto post) {
    return Padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RichText(
            maxLines: 3,
            text: TextSpan(children: [
              TextSpan(
                text: post.owner.userName,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: post.postBody,
                style: DefaultTextStyle.of(context).style,
              )
            ]),
          ),
          SizedBox(
            height: .5,
          ),
          Text(
            timeago.format(post.publishDate),
            maxLines: 1,
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }

  List<Widget> _buildPostGridItems() {
    assert(profileDto != null && profileDto.post != null);

    var items = List<Widget>();
    for (var post in profileDto.post) {
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildPostImageTop(),
          _buildPostBody(post),
          _buildPostActionButtons(post),
          _buildPostLikes(post),
          _buildPostInfo(post),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 0.35,
          ),
        ],
      );

      items.add(column);
    }
    return items;
  }

  _buildPosts() {
    var grid = GridView.count(
        crossAxisCount: 1,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: (MediaQuery.of(context).size.width / 480),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        children: _buildPostGridItems());

    return Expanded(
      child: grid,
    );
  }

  _mainPageWidgetCompleted() {
    var container = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_buildTop(), _buildPosts()],
    );
    return container;
  }

  _mainPageWidgetLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[LinearProgressIndicator()],
    );
  }
}
