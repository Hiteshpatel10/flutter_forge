import 'package:flutter/cupertino.dart';

class GistModal {
  GistModal({
    this.url,
    this.forksUrl,
    this.commitsUrl,
    this.id,
    this.nodeId,
    this.gitPullUrl,
    this.gitPushUrl,
    this.htmlUrl,
    this.files,
    this.public,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.comments,
    this.user,
    this.commentsUrl,
    this.owner,
    this.forks,
    this.history,
    this.truncated,
  });

  GistModal.fromJson(dynamic json) {
    url = json['url'];
    forksUrl = json['forks_url'];
    commitsUrl = json['commits_url'];
    id = json['id'];
    nodeId = json['node_id'];
    gitPullUrl = json['git_pull_url'];
    gitPushUrl = json['git_push_url'];
    htmlUrl = json['html_url'];

    if ( json['files'] != null  ) {
      files = [];
      // debugPrint("--------------- ${json['files'].runtimeType}");

      json['files'].forEach((filename, fileInfo) {
        // debugPrint("--------------- $filename");
        files?.add(File.fromJson(fileInfo));
      });
    }

    // files = json['files'] != null ? Files.fromJson(json['files']) : null;
    public = json['public'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    comments = json['comments'];
    user = json['user'];
    commentsUrl = json['comments_url'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    // if (json['forks'] != null) {
    //   forks = [];
    //   json['forks'].forEach((v) {
    //     forks?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history?.add(History.fromJson(v));
      });
    }
    truncated = json['truncated'];
  }
  String? url;
  String? forksUrl;
  String? commitsUrl;
  String? id;
  String? nodeId;
  String? gitPullUrl;
  String? gitPushUrl;
  String? htmlUrl;
  List<File>? files;
  bool? public;
  String? createdAt;
  String? updatedAt;
  String? description;
  num? comments;
  dynamic user;
  String? commentsUrl;
  Owner? owner;
  List<dynamic>? forks;
  List<History>? history;
  bool? truncated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['forks_url'] = forksUrl;
    map['commits_url'] = commitsUrl;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['git_pull_url'] = gitPullUrl;
    map['git_push_url'] = gitPushUrl;
    map['html_url'] = htmlUrl;
    if (files != null) {
      // map['files'] = files?.toJson();
    }
    map['public'] = public;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['description'] = description;
    map['comments'] = comments;
    map['user'] = user;
    map['comments_url'] = commentsUrl;
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    if (forks != null) {
      map['forks'] = forks?.map((v) => v.toJson()).toList();
    }
    if (history != null) {
      map['history'] = history?.map((v) => v.toJson()).toList();
    }
    map['truncated'] = truncated;
    return map;
  }
}

class History {
  History({
    this.user,
    this.version,
    this.committedAt,
    this.changeStatus,
    this.url,
  });

  History.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    version = json['version'];
    committedAt = json['committed_at'];
    changeStatus =
        json['change_status'] != null ? ChangeStatus.fromJson(json['change_status']) : null;
    url = json['url'];
  }
  User? user;
  String? version;
  String? committedAt;
  ChangeStatus? changeStatus;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['version'] = version;
    map['committed_at'] = committedAt;
    if (changeStatus != null) {
      map['change_status'] = changeStatus?.toJson();
    }
    map['url'] = url;
    return map;
  }
}

class ChangeStatus {
  ChangeStatus({
    this.total,
    this.additions,
    this.deletions,
  });

  ChangeStatus.fromJson(dynamic json) {
    total = json['total'];
    additions = json['additions'];
    deletions = json['deletions'];
  }
  num? total;
  num? additions;
  num? deletions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['additions'] = additions;
    map['deletions'] = deletions;
    return map;
  }
}

class User {
  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  User.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }
  String? login;
  num? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['followers_url'] = followersUrl;
    map['following_url'] = followingUrl;
    map['gists_url'] = gistsUrl;
    map['starred_url'] = starredUrl;
    map['subscriptions_url'] = subscriptionsUrl;
    map['organizations_url'] = organizationsUrl;
    map['repos_url'] = reposUrl;
    map['events_url'] = eventsUrl;
    map['received_events_url'] = receivedEventsUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    return map;
  }
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  Owner.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }
  String? login;
  num? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['followers_url'] = followersUrl;
    map['following_url'] = followingUrl;
    map['gists_url'] = gistsUrl;
    map['starred_url'] = starredUrl;
    map['subscriptions_url'] = subscriptionsUrl;
    map['organizations_url'] = organizationsUrl;
    map['repos_url'] = reposUrl;
    map['events_url'] = eventsUrl;
    map['received_events_url'] = receivedEventsUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    return map;
  }
}

// class Files {
//   Files({
//     this.cupertinoDateSelectdart,
//     this.cupertinoDateSelectExampledart,
//   });
//
//   Files.fromJson(dynamic json) {
//     cupertinoDateSelectdart = json['cupertino_date_select.dart'] != null
//         ? File.fromJson(json['cupertino_date_select.dart'])
//         : null;
//     cupertinoDateSelectExampledart = json['cupertino_date_select_example.dart'] != null
//         ? CupertinoDateSelectExampleDart.fromJson(json['cupertino_date_select_example.dart'])
//         : null;
//   }
//   File? cupertinoDateSelectdart;
//   CupertinoDateSelectExampleDart? cupertinoDateSelectExampledart;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (cupertinoDateSelectdart != null) {
//       map['cupertino_date_select.dart'] = cupertinoDateSelectdart?.toJson();
//     }
//     if (cupertinoDateSelectExampledart != null) {
//       map['cupertino_date_select_example.dart'] = cupertinoDateSelectExampledart?.toJson();
//     }
//     return map;
//   }
// }

class CupertinoDateSelectExampleDart {
  CupertinoDateSelectExampleDart({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
    this.truncated,
    this.content,
  });

  CupertinoDateSelectExampleDart.fromJson(dynamic json) {
    filename = json['filename'];
    type = json['type'];
    language = json['language'];
    rawUrl = json['raw_url'];
    size = json['size'];
    truncated = json['truncated'];
    content = json['content'];
  }
  String? filename;
  String? type;
  String? language;
  String? rawUrl;
  num? size;
  bool? truncated;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filename'] = filename;
    map['type'] = type;
    map['language'] = language;
    map['raw_url'] = rawUrl;
    map['size'] = size;
    map['truncated'] = truncated;
    map['content'] = content;
    return map;
  }
}

class File {
  File({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
    this.truncated,
    this.content,
  });

  File.fromJson(dynamic json) {
    filename = json['filename'];
    type = json['type'];
    language = json['language'];
    rawUrl = json['raw_url'];
    size = json['size'];
    truncated = json['truncated'];
    content = json['content'];
  }
  String? filename;
  String? type;
  String? language;
  String? rawUrl;
  num? size;
  bool? truncated;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filename'] = filename;
    map['type'] = type;
    map['language'] = language;
    map['raw_url'] = rawUrl;
    map['size'] = size;
    map['truncated'] = truncated;
    map['content'] = content;
    return map;
  }
}
