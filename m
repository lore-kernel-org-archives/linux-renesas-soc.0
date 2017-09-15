Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35064 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbdIORf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 13:35:58 -0400
Received: by mail-pf0-f196.google.com with SMTP id i23so1525165pfi.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2017 10:35:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201709152238.zUqYhmzi%fengguang.wu@intel.com>
References: <201709152238.zUqYhmzi%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Sep 2017 19:35:56 +0200
Message-ID: <CAMuHMdVCShib1g+QU3yNKnR+30_ySYimmHJeOb=7F=pD-rdZqQ@mail.gmail.com>
Subject: Re: [renesas:arm64-dt-for-v4.15 47/48] Error: arch/arm64/boot/dts/renesas/r8a77995.dtsi:153.27-28
 syntax error
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 15, 2017 at 4:10 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git arm64-dt-for-v4.15
> head:   815e3b5923c6a8c6614d0d4d3bcba532402b1de4
> commit: ddd7da4b39f805a8050ee662cc72a2c7f53160f5 [47/48] arm64: dts: renesas: r8a77995: add GPIO device nodes
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ddd7da4b39f805a8050ee662cc72a2c7f53160f5
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/renesas/r8a77995.dtsi:153.27-28 syntax error

The definition of R8A77995_PD_ALWAYS_ON doesn't exist yet in that branch.
It will have to be rebased on top of v4.14-rc1 on Monday.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
