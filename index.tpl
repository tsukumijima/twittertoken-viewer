<!DOCTYPE html>
<html lang="ja">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Twitter API のアクセストークンを確認するやつ</title>
  <link rel="icon" type="image/png" href="{$site_url}logo.png">

  <!-- OGP -->
  <meta property="og:type" content="article">
  <meta property="description" content="自分の Twitter API のアクセストークンを確認できます。Bot 作成などに使ってください。">
  <meta property="og:description" content="自分の Twitter API のアクセストークンを確認できます。Bot 作成などに使ってください。">
  <meta property="og:title" content="Twitter API のアクセストークンを確認するやつ">
  <meta property="og:image" content="{$site_url}logo.png">
  <meta property="og:locale" content="ja_JP">
  <!-- /OGP -->

  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary">
  <meta name="twitter:description" content="自分の Twitter API のアクセストークンを確認できます。Bot 作成などに使ってください。">
  <meta name="twitter:title" content="Twitter API のアクセストークンを確認するやつ">
  <meta name="twitter:image" content="{$site_url}logo.png">
  <!-- /Twitter Card -->

  <!-- JavaScript -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css">
  <link rel="stylesheet" type="text/css" href="{$site_url}style.css">

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-173935293-1"></script>
  <script>

    window.dataLayer = window.dataLayer || [];
    function gtag(){
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-173935293-1');

    function copyToClipboard(id) {

      // コピー対象を取得
      var copyTarget = document.getElementById(id);

      // コピー対象のテキストを選択する
      copyTarget.select();

      // 選択しているテキストをクリップボードにコピーする
      document.execCommand('Copy');

      alert('クリップボードにコピーしました。');

    }

  </script>

</head>
<body>

  <nav id="navigation" class="navbar navbar-expand-md navbar-dark bg-info">
    <a class="ml-sm-2 ml-lg-5 navbar-brand text-white" href="./">
      <img src="{$site_url}logo.png" class="d-inline-block align-top">
      Twitter API のアクセストークンを確認するやつ
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar" class="collapse navbar-collapse">
      <div class="container">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <!--<a class="nav-link text-light" href="/" target="_blank"><i class="fas fa-home"></i></a>-->
          </li>
        </ul>
      </div>
    </div>
  </nav>

{if $type == 'normal'}

  <div class="container mt-4">
    <div class="card">
      <div class="card-header font-weight-bold"><i class="fas fa-info-circle"></i>About</div>
      <div class="card-body">
        <p>
          任意の Twitter API アプリとログインしている Twitter アカウントでアプリ連携を行い、Twitter API 用のアクセストークン・アクセストークンシークレットを取得するためのツールです。<br>
          このツールを使うと、<b>一度別のアカウントで開発者登録をしていれば、Twitter の開発者登録をしていないアカウントでも Bot 用のアカウントにしたり自動ツイートを行うようにできます。</b><br>
        </p>
        <p>
          最近、Twitter のスパム対策の一環で、Twitter API の開発者登録の審査が厳しくなり、登録手順も複雑になっています。<br>
          このため、「Bot にしたいアカウントごとに開発者登録をする」ことが難しくなってきているのが実情です。<br>
        </p>
        <p class="mb-2">
          プログラムから Twitter にツイートを投稿する（Twitter API にアクセスする）ためには、Twitter の開発者登録をした後 Twitter Developer アプリケーション（以下 Twitter API アプリ）を作成し、
          <ul>
            <li><b>コンシューマーキー (Consumer Key)</b></li>
            <li><b>コンシューマーシークレット (Consumer Secret)</b></li>
            <li><b>アクセストークン (Access Token)</b></li>
            <li><b>アクセストークンシークレット (Access Token Secret)</b></li>
          </ul>
          の4つを取得する必要があります。<br>
          それらを各言語の Twitter API ライブラリに設定し、Twitter API を操作する流れになっています（例: ツイート投稿）。<br>
        </p>
        <p>
          このうち、Consumer Key・Consumer Secret は Twitter API アプリごとに固有のもので、別の Twitter API アプリでは値が異なります。<br>
Access Token・Access Token Secret は Twitter API アプリ とアプリ連携した Twitter アカウントごとに固有のもので、同じユーザーでもアプリ連携した Twitter API アプリが違うと値が異なります。<br>
          ユーザーがアプリ連携を取り消すとキー自体が無効化されますが、同じユーザーの他の Twitter API アプリの Access Token・Access Token Secret は無効化されません。その Twitter API アプリ専用の特殊なログインパスワード、とイメージするとわかりやすいでしょうか。<br>
        </p>
        <p>
          これを踏まえた上で、<b>「Twitter API を利用したアカウントの操作（ツイートの投稿、削除など）は開発者登録をしたアカウントでないと行えない」というのは誤りです。</b><br>
          Twitter Developper アプリ設定画面の Keys and tokens からは Consumer Key・Consumer Secret と Access Token・Access Token Secret を取得できますが、このうち Access Token・Access Token Secret は開発者登録をしたアカウントのものが表示されます。<br>
          裏を返せば、たとえば Bot を作りたい場合、<b>Bot にしたい Twitter アカウントとアプリ連携して Access Token・Access Token Secret が取得できれば、開発者登録をしたアカウント以外でも Bot 用のアカウントにできる、</b>とも言えます。<br>
        </p>
        <p class="mb-2">
          このツールは、<b>指定した Consumer Key・Consumer Secret で現在ログインしている Twitter アカウントとアプリ連携を行い、取得した Access Token・Access Token Secret をそのまま表示するもの</b>です。<br>
          指定した Consumer Key・Consumer Secret と表示された Access Token・Access Token Secret を Twitter API ライブラリに設定すると、<b>アプリ連携したアカウントでツイートなどの Twitter API の操作が行えるようになります。</b><br>
          Bot などの通常アプリ連携が必要ないアプリケーションではそのためだけにアプリ連携機能を実装するのは面倒ですが、このツールを使うことで開発者アカウントを使い回しでき、また実装の手間を減らせると考えています。<br>
          <b>取得した Access Token・Access Token Secret は画面に表示する処理のみに利用し、<u>保存は一切行いません。</u>（セッションはアクセストークン表示後にすべて破棄されます）</b><br>
          ツールの性質が性質なので、コードは <a href="https://github.com/tsukumijima/twittertoken-viewer" target="_blank">GitHub</a> にて公開しています。もし信用できない場合は適宜サイトの URL を変更した上でローカル環境で動かしてみても良いと思います。<br>
        </p>
      </div>
    </div>
  </div>

  <div class="container mt-4">
      <div class="card">
        <div class="card-header font-weight-bold"><i class="fas fa-question-circle"></i>つかいかた</div>
        <div class="card-body">
          <ol class="mb-0">
            <li>自分の Twitter API アプリの <b>Consumer Key・Consumer Secret を入力する</b></li>
            <li>自分の Twitter API アプリ設定画面の <b>Callback URLs 欄に {$site_url} を登録する</b></li>
            <ul>
              <li>これを行わないと認証に失敗します…</li>
              <li>また、[Enable Sign With Twitter] にチェックを入れてください。</li>
              <li><b>Callback URLs はアプリ連携するための一時的な登録で構いません</b>（確認後は削除してしまっても大丈夫です）。</li>
              </ul>
            </ul>
            <li>下の［認証してアクセストークンを確認する］をクリックする</li>
            <li>Consumer Key・Consumer Secret に紐付いている Twitter API アプリの連携画面が表示されるので、アプリ連携を行う</li>
            <ul>
              <li>あらかじめアプリ連携を行いたいアカウントにログインしている状態で［連携アプリを認証］をクリックしてください。</li>
              <li>［キャンセル］をクリックするとアプリ連携がキャンセルされます。</li>
            </ul>
            <li>自分の Twitter API アプリで先ほどアプリ連携したアカウントにアクセスするための Access Token と Access Token Secret が表示されるので、クリップボードにコピーして適宜 Twitter API を使うソフトや Bot 等に設定する</li>
            <ul>
              <li><b>Access Token・Access Token Secret は絶対に他人に教えないようにしてください！</b></li>
              <li>Access Token・Access Token Secret が漏洩した場合、<b><u>他人がアカウントを操作できてしまう可能性があります。</u></b></li>
            </ul>
          </ol>
        </div>
      </div>
    </div>

  <div class="container mt-4 mb-4">
    <div class="card">
      <div class="card-header font-weight-bold"><i class="fas fa-key"></i>アクセストークンを確認する</div>
      <form class="card-body" method="POST" action="./?auth" autocomplete="off">
        <p>
          <span style="display: block;" class="mb-2">コンシューマーキー：</span>
          <input name="consumer_key" type="text" class="form-control text-dark mb-2" placeholder="Consumer Key" required />
        </p> 
        <p>
          <span style="display: block;" class="mb-2">コンシューマーシークレット：</span>
          <input name="consumer_secret" type="text" class="form-control text-dark mb-2" placeholder="Consumer Secret" required />
        </p>
        <button type="submit" class="btn btn-primary text-white">
          <i class="fas fa-key"></i>認証してアクセストークンを確認する
        </button>
      </form>
    </div>
  </div>

{/if}
{if $type == 'result'}

  <div class="container mt-4 mb-4">
    <div class="card">
      <div class="card-header font-weight-bold"><i class="fas fa-key"></i>アクセストークンを確認する</div>
      <div class="card-body">
        <p>
          <span style="display: block;" class="mb-2">アクセストークン：</span>
          <input id="access-token" type="text" class="form-control text-dark mb-2" value="{$access_token['oauth_token']}" readonly />
          <button type="button" class="btn btn-info text-white" onclick="copyToClipboard('access-token')">
            <i class="fas fa-paste"></i>クリップボードにコピーする
          </button>
        </p>
        <p>
          <span style="display: block;" class="mb-2">アクセストークンシークレット：</span>
          <input id="access-token-secret" type="text" class="form-control text-dark mb-2" value="{$access_token['oauth_token_secret']}" readonly />
          <button type="button" class="btn btn-info text-white" onclick="copyToClipboard('access-token-secret')">
            <i class="fas fa-paste"></i>クリップボードにコピーする
          </button>
        </p>
        <p class="mb-1">
          <button type="button" class="btn btn-primary text-white" onclick="location.href='./'">
          <i class="fas fa-reply"></i>トップに戻る
          </button>
        </p>
      </div>
    </div>
  </div>

{/if}
{if $type == 'error'}

  <div class="container mt-4 mb-4">
    <div class="card">
      <div class="card-header font-weight-bold">{$error_title}</div>
      <div class="card-body">
        <div class="alert alert-danger" role="alert">
          {foreach from=$error item="error_item"}
            {$error_item}
          {/foreach}
        </div>
        <p class="mb-1">
          <button type="button" class="btn btn-primary text-white" onclick="location.href='./'">
          <i class="fas fa-reply"></i>トップに戻る
          </button>
        </p>
      </div>
    </div>
  </div>

{/if}

  <footer id="footer" class="footer bg-dark pt-3 pb-3">
    <div class="container d-flex flex-column align-items-center align-items-sm-end">
      <div class="d-inline text-white text-center text-sm-right">
        <a class="mr-1">© 2019 - {date('Y')}</a>
        <br class="d-inline d-sm-none">
        <img id="counter" src="/dream/dream.cgi?id=twittertoken_viewer&gif=1">
      </div>
    </div>
  </footer>

</body>
</html>
