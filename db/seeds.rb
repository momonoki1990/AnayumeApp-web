# frozen_string_literal: true

# ユーザー
guest = User.create!(name: "ゲストユーザー",
                     email: "guest@example.com",
                     password: "sample",
                     password_confirmation: "sample",
                     admin: true,
                     activated: true,
                     activated_at: Time.zone.now,
                     profile: "ゲストユーザーさまです。日常を大切に生きて行きたいと思っています。",
                     picture: File.open("#{Rails.root}/app/assets/images/guest.jpg"))

Masa = User.create!(name: "Masa",
                    email: "Masa@example.com",
                    password: "sample",
                    password_confirmation: "sample",
                    admin: true,
                    activated: true,
                    activated_at: Time.zone.now,
                    profile: "憧れの松本人志さんのようなビッグなお笑いスターになって、コメンテーターでも司会でも俳優でもなんでもこなす、大物になりたい！",
                    picture: File.open("#{Rails.root}/app/assets/images/Masa.jpg"))

Takashi = User.create!(name: "Takashi",
                       email: "Takashi@example.com",
                       password: "sample",
                       password_confirmation: "sample",
                       admin: true,
                       activated: true,
                       activated_at: Time.zone.now,
                       profile: "アニメーターです。アニメーションの制作会社に努めています。某カードゲームのアニメなどを担当しています。",
                       picture: File.open("#{Rails.root}/app/assets/images/Takashi.jpg"))

Ryoma = User.create!(name: "Ryoma",
                     email: "Ryoma@example.com",
                     password: "sample",
                     password_confirmation: "sample",
                     admin: true,
                     activated: true,
                     activated_at: Time.zone.now,
                     profile: "侍です。諸外国からの侵犯という危機的状況にあるこの国を救い、欧米列強と競う豊な国にしたいです。",
                     picture: File.open("#{Rails.root}/app/assets/images/Ryoma.jpg"))

Kounosuke = User.create!(name: "Kounosuke",
                         email: "Kounosuke@example.com",
                         password: "sample",
                         password_confirmation: "sample",
                         admin: true,
                         activated: true,
                         activated_at: Time.zone.now,
                         profile: "実業家です。電気製品メーカーの社長をやっております。家電製品を通して世界の生活を豊かにするのが私の夢です。",
                         picture: File.open("#{Rails.root}/app/assets/images/Kounosuke.jpg"))

Keisuke = User.create!(name: "Keisuke",
                       email: "Keisuke@example.com",
                       password: "sample",
                       password_confirmation: "sample",
                       admin: true,
                       activated: true,
                       activated_at: Time.zone.now,
                       profile: "小学生です。サッカーやってます！世界一のサッカー選手になるのが僕の夢です。というか、なります！",
                       picture: File.open("#{Rails.root}/app/assets/images/Keisuke.jpg"))

Ichiro = User.create!(name: "Ichiro",
                      email: "Ichiro@example.com",
                      password: "sample",
                      password_confirmation: "sample",
                      admin: true,
                      activated: true,
                      activated_at: Time.zone.now,
                      profile: "愛知県に住んでいる小学生です。野球が大好きです。将来は一流の野球選手になりたいです。",
                      picture: File.open("#{Rails.root}/app/assets/images/Ichiro.jpg"))

Haruka = User.create!(name: "Haruka",
                      email: "Haruka@example.com",
                      password: "sample",
                      password_confirmation: "sample",
                      admin: true,
                      activated: true,
                      activated_at: Time.zone.now,
                      profile: "女優です！",
                      picture: File.open("#{Rails.root}/app/assets/images/Haruka.jpg"))

Naomi = User.create!(name: "Naomi",
                     email: "Naomi@example.com",
                     password: "sample",
                     password_confirmation: "sample",
                     admin: true,
                     activated: true,
                     activated_at: Time.zone.now,
                     profile: "テニスプレイヤーです。18歳です。",
                     picture: File.open("#{Rails.root}/app/assets/images/Naomi.jpg"))

Spielberg = User.create!(name: "Spielberg",
                         email: "Spielberg@example.com",
                         password: "sample",
                         password_confirmation: "sample",
                         admin: true,
                         activated: true,
                         activated_at: Time.zone.now,
                         profile: "映画監督です。SFでは負けません。",
                         picture: File.open("#{Rails.root}/app/assets/images/Spielberg.jpg"))

Walt = User.create!(name: "Walt",
                    email: "Walt@example.com",
                    password: "sample",
                    password_confirmation: "sample",
                    admin: true,
                    activated: true,
                    activated_at: Time.zone.now,
                    profile: "アニメーター、プロデューサーです",
                    picture: File.open("#{Rails.root}/app/assets/images/Walt.jpg"))

Jobs = User.create!(name: "Jobs",
                    email: "Jobs@example.com",
                    password: "sample",
                    password_confirmation: "sample",
                    admin: true,
                    activated: true,
                    activated_at: Time.zone.now,
                    profile: "実業家です。プログラミングとデザインが得意です。リンゴが大好きです。",
                    picture: File.open("#{Rails.root}/app/assets/images/Jobs.jpg"))

# 投稿
Haruka.dreamposts.create!(content: "私の夢は、世界平和です。")
Ryoma.dreamposts.create!(content: "人がわかってくれなくても、自分がわかっていればそれでいいんです。")
Spielberg.dreamposts.create!(content: "僕は、夜に夢を見るんじゃない。一日中夢を見ているんだ。生きる糧として、夢を見ている。")
Walt.dreamposts.create!(content: "夢見ることができれば、それは実現できる。")
Ichiro.dreamposts.create!(content: "ぼくの夢は一流のプロ野球選手になることです。")
Ichiro.dreamposts.create!(content: "そのためには、中学高校と全国大会に出て活躍しなければなりません。")
Ichiro.dreamposts.create!(content: "活躍できるためには練習が必要です。")
Ichiro.dreamposts.create!(content: "ぼくは、3歳のときから練習を始めています。3歳から7歳までは半年くらいやっていました。")
Ichiro.dreamposts.create!(content: "3年生の時から今では、365日中360日は激しい練習をやってます。")
Ichiro.dreamposts.create!(content: "だから１週間中で友達と遊べる時間は、5～6時間です。")
Ichiro.dreamposts.create!(content: "そんなに練習をやっているのだから、必ずプロ野球選手になれると思います。")
Kounosuke.dreamposts.create!(content: "「成功の秘訣はなんですか？」とよく聞かれますが、基本的には偶然とご縁の賜物だと思っております。")
Kounosuke.dreamposts.create!(content: "しかし、強いて言わせていただくなら、私は、失敗するかもしれないけれども、やってみようというような事は決してしません。")
Kounosuke.dreamposts.create!(content: "絶対に成功するのだということを、確信してやります。何が何でもやるのだ、という意気込みでやるようにしております。",
                             picture: File.open("#{Rails.root}/app/assets/images/rail.jpg"))
Naomi.dreamposts.create!(content: "最近調子がいい。この前まで、「もう手遅れなんじゃないか」と悩んでいたのに。。。")
Naomi.dreamposts.create!(content: "きっかけは、ある時、ふと「みんな、それぞれ別の道を歩んでいるのかもしれない」と思ったことです。")
Naomi.dreamposts.create!(content: "それからは、自分と他の誰かを比べることもなくなり、練習に集中できるようになり、結果もついてくるようになりました。")
Naomi.dreamposts.create!(content: "誰かと比べて落ち込まれている方も、ぜひ、自分のなすべき努力に集中してみてください！")
Jobs.dreamposts.create!(content: "私の尊敬する実業家の方が「他人の意見で自分の本当の心の声を消してはならない。自分の直感を信じる勇気を持ちなさい。」と仰っていました。")
Jobs.dreamposts.create!(content: "私は、技術の力で、世界を変えられると思っています。")
Jobs.dreamposts.create!(content: "その為には、反逆者と言われようと、いつだって、自分の理性と直感を信じて、前に進まなければならないと思っています。")
Jobs.dreamposts.create!(content: "ということで、今日の朝ごはんは、私の大好きなリンゴでした笑",
                        picture: File.open("#{Rails.root}/app/assets/images/apple.jpg"))
Takashi.dreamposts.create!(content: "僕はなんの為に生まれてなんの為に生きるのか、答えられないなんて、そんなのは嫌だと思っています。")
Takashi.dreamposts.create!(content: "私はまだ駆け出しのアニメーターに過ぎないですが、必ずや、世界の人々の心に届くアニメーションを作り、世界をよりよくすることができると思っています。")
Takashi.dreamposts.create!(content: "偉そうなことを言いましたが、朝会社に遅刻してしまいました笑　破って初めてわかるのですが、規則を守るってすごい大事なことですよね。。。")
Keisuke.dreamposts.create!(content: "今日の練習が終わりました。練習試合に負けて、めっちゃ走らされたけど、あれって意味あるのかなぁ？")
Keisuke.dreamposts.create!(content: "家に帰ってお風呂に入ったら、ストレッチとアイシングをします。世界一のサッカー選手になるには、世界一練習しないとダメで、その為にはからだのケアも大切です。",
                           picture: File.open("#{Rails.root}/app/assets/images/stretch.jpg"))
Keisuke.dreamposts.create!(content: "世界一のサッカー選手になったら、もちろん大金持ちになって、親孝行したいなぁ。。")
Masa.dreamposts.create!(content: "新宿のルミネtheよしもとでライブでした〜。今日は相方が少し風邪気味で、ガラガラ声だったのが逆にウケた笑",
                        picture: File.open("#{Rails.root}/app/assets/images/shinjuku.jpg"))
Masa.dreamposts.create!(content: "みなさんもぜひライブ見にきてくださいー！やっぱり生で見るのとテレビだと印象が全然違いますよ！(ぼくらテレビだとほとんど見られないですしね！笑)")
Masa.dreamposts.create!(content: "それにしても、一緒に出てたあのコンビ、名前なんだったけなぁ、めっちゃおもしろかったなぁ。。。")
guest.dreamposts.create!(content: "みなさんすごい夢をお持ちですよね。私は夢なんて特に。。。日常を大切に過ごしていければいいなと思っています。")

# リレーションシップ
users = User.all
user = users.first
following = users[2..12]
followers = users[3..12]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# 地図
guest.maps.create!(address: "シンガポール", latitude: 1.352, longitude: 103.8198, title: "シンガポール", comment: "一度は行ってみたいアジアの大都市！", picture: File.open("#{Rails.root}/app/assets/images/singapore.jpg"))
guest.maps.create!(address: "バルセロナ", latitude: 41.3816, longitude: 2.1409, title: "バルセロナ", comment: "情熱の国スペイン！クラシコ見てみたいなぁ...", picture: File.open("#{Rails.root}/app/assets/images/barcelona.jpg"))
guest.maps.create!(address: "富士山", latitude: 35.360739, longitude: 138.72732, title: "富士山", comment: "まだ登ったことないんですよね。日本一の山！", picture: File.open("#{Rails.root}/app/assets/images/fuji.jpg"))
guest.maps.create!(address: "館山", latitude: 34.996546, longitude: 139.870044, title: "館山", comment: "館山のリゾートホテルに泊まってみたいなぁ。", picture: File.open("#{Rails.root}/app/assets/images/tateyama.jpg"))
guest.maps.create!(address: "ニュー・デリー", latitude: 28.613939, longitude: 77.209021, title: "ニュー・デリー", comment: "本場のカレーを食べてみたい！", picture: File.open("#{Rails.root}/app/assets/images/delhi.jpg"))
guest.maps.create!(address: "台北", latitude: 25.032969, longitude: 121.565418, title: "台北", comment: "台湾スイーツを食べ尽くしたい...", picture: File.open("#{Rails.root}/app/assets/images/taipei.jpg"))
