{
  byebug = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nx3yjf4xzdgb8jkmk2344081gqr22pgjqnmjg2q64mj5d6r9194";
      type = "gem";
    };
    version = "11.1.3";
  };
  coderay = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jvxqxzply1lwp7ysn94zjhh57vc14mcshw1ygw14ib8lhc00lyw";
      type = "gem";
    };
    version = "1.1.3";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14r3zp2q75lrzpy2nz7hbhzqp8nsykd5ffy18d34xr32722i2ifr";
      type = "gem";
    };
    version = "3.17.0.2";
  };
  method_source = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnyh44qycnf9mzi1j6fywd5fkskv3x7nmsqrrws0rjn5dd4ayfp";
      type = "gem";
    };
    version = "1.0.0";
  };
  prettier_print = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ib4359rkwqplzxg3gzd0shizz5na6nkvjsgrx9npp8w0q20ajzx";
      type = "gem";
    };
    version = "1.1.0";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m445x8fwcjdyv2bc0glzss2nbm1ll51bq45knixapc7cl3dzdlr";
      type = "gem";
    };
    version = "0.14.1";
  };
  pry-byebug = {
    dependencies = ["byebug" "pry"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y41al94ks07166qbp2200yzyr5y60hm7xaiw4lxpgsm4b1pbyf8";
      type = "gem";
    };
    version = "3.10.1";
  };
  pry-doc = {
    dependencies = ["pry" "yard"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wyvql6pb6m8jl8bsamabxhxhd86bnqblspaxzz05sl0fm2ynj0r";
      type = "gem";
    };
    version = "1.3.0";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "sorbet-runtime" "syntax_tree"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l3msnfv2p0z9cpvx5rvvx4bfnps24g93mz6qbwj1wj1vp4095wa";
      type = "gem";
    };
    version = "0.3.7";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1q0847h9xywm7j6ajw59cn40isb63a85k18vhw17p489qlkys3pv";
      type = "gem";
    };
    version = "0.5.10597";
  };
  stackprof = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02r3a3ny27ljj19bzmxscw2vlmk7sw1p4ppbl2i69g17khi0p4sw";
      type = "gem";
    };
    version = "0.2.23";
  };
  syntax_tree = {
    dependencies = ["prettier_print"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1im3kskcrmwa12q4pxilps7dyf9jlc82saasp6lkn5q7zqi7ilfh";
      type = "gem";
    };
    version = "4.3.0";
  };
  webrick = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d4cvgmxhfczxiq5fr534lmizkhigd15bsx5719r5ds7k7ivisc7";
      type = "gem";
    };
    version = "1.7.0";
  };
  yard = {
    dependencies = ["webrick"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p1if8g9ww6hlpfkphqv3y1z0rbqnnrvb38c5qhnala0f8qpw6yk";
      type = "gem";
    };
    version = "0.9.28";
  };
}
