import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateAddDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateListDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostAddDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/screens/CommentPage.dart';
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
  var likeColors = Map<String, Color>();

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
    profileDto.post.sort((a, b) => b.publishDate.compareTo(a.publishDate));
    loginResponseDto = await StorageService.getAuth();
    mainPageWidget = _mainPageWidgetCompleted();
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
      child: GestureDetector(
        onDoubleTap: () {
          _like(post);
        },
        child: Image.network(
          post.postImageUrl,
          height: 280,
          cacheHeight: 280,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
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

  bool _isLiked(PostListDto dto) {
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && rate.isLike);
    return isLike;
  }

  bool _isDisliked(PostListDto dto) {
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && !rate.isLike);
    return isLike;
  }

  void _removeRate(PostListDto dto) {
    ApiService.deleteRate(dto.postId, loginResponseDto.id);
    var willDeleted = this
        .profileDto
        .post
        .firstWhere((p) => p.postId == dto.postId)
        .rates
        .firstWhere((rate) =>
            rate.ownerId == loginResponseDto.id && rate.postId == dto.postId);
    this
        .profileDto
        .post
        .firstWhere((p) => p.postId == dto.postId)
        .rates
        .remove(willDeleted);
  }

  void _switchRate(PostListDto dto, bool isLike) {
    if (isLike) {
      var dislikeColor = likeColors["DislikeButton_${dto.postId}"];
      if (dislikeColor == Colors.red) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      var likeColor = likeColors["LikeButton_${dto.postId}"];
      if (likeColor == Colors.green) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    }
  }

  void _like(PostListDto dto) {
    _switchRate(dto, true);
    var currentColor = likeColors["LikeButton_${dto.postId}"];

    if (currentColor == Colors.green) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(true, dto.postId);
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.green;
      });
    }
  }

  void _dislike(PostListDto dto) {
    var currentColor = likeColors["DislikeButton_${dto.postId}"];

    _switchRate(dto, false);

    if (currentColor == Colors.red) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(false, dto.postId);
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.red;
      });
    }
  }

  _rateRequest(bool isLike, String postId) {
    PostRateAddDto postRateAddDto = new PostRateAddDto();
    postRateAddDto.isActive = true;
    postRateAddDto.isLike = isLike;
    postRateAddDto.ownerId = loginResponseDto.id;
    postRateAddDto.postId = postId;
    postRateAddDto.rateDate = DateTime.now();

    var dto = new PostRateListDto();
    dto.isActive = true;
    dto.isLike = isLike;
    dto.ownerId = loginResponseDto.id;
    dto.postId = postId;
    dto.rateDate = DateTime.now();
    this.profileDto.post.firstWhere((p) => p.postId == postId).rates.add(dto);

    ApiService.addRate(postRateAddDto);
  }

  _buildPostActionButtons(PostListDto dto) {
    var likeColor = _isLiked(dto) ? Colors.green : Colors.blueGrey;
    var dislikeColor = _isDisliked(dto) ? Colors.red : Colors.blueGrey;
    likeColors.putIfAbsent("LikeButton_${dto.postId}", () => likeColor);
    likeColors.putIfAbsent("DislikeButton_${dto.postId}", () => dislikeColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.mood),
          iconSize: 24,
          color: likeColors["LikeButton_${dto.postId}"],
          onPressed: () {
            _like(dto);
          },
        ),
        IconButton(
          icon: Icon(Icons.mood_bad),
          onPressed: () {
            _dislike(dto);
          },
          iconSize: 24,
          color: likeColors["DislikeButton_${dto.postId}"],
        ),
        IconButton(
          icon: Icon(Icons.comment),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentPage(postId: dto.postId,),fullscreenDialog: true,),
            );
          },
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

  _buildPostLikes(PostListDto post) {
    return Padding(
      child: Row(
        children: <Widget>[
          Text(
            "${this.profileDto.post.firstWhere((p) => p.postId == post.postId).rates.where((data) => data.isLike).toList().length} Likes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 0.1,
            width: 5,
          ),
          Text(
            "${this.profileDto.post.firstWhere((p) => p.postId == post.postId).rates.where((data) => data.isLike == false).toList().length} Dislikes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
    );
  }

  _buildPostInfo(PostListDto post) {
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
