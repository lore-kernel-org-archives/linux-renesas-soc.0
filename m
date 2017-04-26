Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35707 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1946495AbdDZNBh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 09:01:37 -0400
Received: by mail-it0-f68.google.com with SMTP id 70so382879ita.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Apr 2017 06:01:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201704261342.ynFfd88A%fengguang.wu@intel.com>
References: <201704261342.ynFfd88A%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2017 15:01:35 +0200
Message-ID: <CAMuHMdXy2mDze2iidgbFKRbtK7AOzUUZd-kCahMTbwK8q_wCTw@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/rcar2-cpg-mssr 11/32] drivers/soc/renesas/rcar-sysc.c:141:11:
 warning: format '%x' expects argument of type 'unsigned int', but argument 5
 has type 'long unsigned int'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fengguang,

On Wed, Apr 26, 2017 at 7:01 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar2-cpg-mssr
> head:   bd948f4b8c455dfdbc8175b5c2bc29c91b048971
> commit: 2cf8d523ad52acbc77845a2634c229a55e849762 [11/32] [RFC] soc: renesas: Rework Kconfig and Makefile logic
> config: m32r-allyesconfig (attached as .config)
> compiler: m32r-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 2cf8d523ad52acbc77845a2634c229a55e849762
>         # save the attached .config to linux build tree
>         make.cross ARCH=m32r
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:13:0,
>                     from include/linux/delay.h:21,
>                     from drivers/soc/renesas/rcar-sysc.c:13:
>    drivers/soc/renesas/rcar-sysc.c: In function 'rcar_sysc_power':
>>> drivers/soc/renesas/rcar-sysc.c:141:11: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
>      pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
>               ^
>    include/linux/printk.h:285:21: note: in definition of macro 'pr_fmt'
>     #define pr_fmt(fmt) fmt
>                         ^~~
>    include/linux/printk.h:333:2: note: in expansion of macro 'dynamic_pr_debug'
>      dynamic_pr_debug(fmt, ##__VA_ARGS__)
>      ^~~~~~~~~~~~~~~~
>>> drivers/soc/renesas/rcar-sysc.c:141:2: note: in expansion of macro 'pr_debug'
>      pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
>      ^~~~~~~~

readl() (actually _readl()) on m32r returns unsigned long instead of
u32 or unsigned int.



-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
