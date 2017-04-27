Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36455 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031888AbdD0MkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 08:40:10 -0400
Received: by mail-it0-f65.google.com with SMTP id x188so1947315itb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Apr 2017 05:40:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201704261750.NjGZWMo1%fengguang.wu@intel.com>
References: <201704261750.NjGZWMo1%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2017 14:40:08 +0200
Message-ID: <CAMuHMdUBF_nxp2h5A0-Eo+p8GB6JUvO8dN-ph+CxSLaB5UkZ4A@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/rcar2-cpg-mssr 5/32] arch/mips//lantiq/clk.c:163:13:
 error: redefinition of 'of_clk_get_from_provider'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        John Crispin <blogic@openwrt.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 26, 2017 at 11:50 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar2-cpg-mssr
> head:   bd948f4b8c455dfdbc8175b5c2bc29c91b048971
> commit: 647a9d3c4f83250fd1f4e6519cf785319c9afe4c [5/32] clk: Provide dummy of_clk_get_from_provider() for compile-testing
> config: mips-xway_defconfig (attached as .config)
> compiler: mips-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 647a9d3c4f83250fd1f4e6519cf785319c9afe4c
>         # save the attached .config to linux build tree
>         make.cross ARCH=mips
>
> All errors (new ones prefixed by >>):
>
>>> arch/mips//lantiq/clk.c:163:13: error: redefinition of 'of_clk_get_from_provider'
>     struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
>                 ^~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/mips//lantiq/clk.c:14:0:
>    include/linux/clk.h:542:27: note: previous definition of 'of_clk_get_from_provider' was here
>     static inline struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
>                               ^~~~~~~~~~~~~~~~~~~~~~~~

Bummer, Lantiq defines its own dummy. Will fold its removal into my patch.

> vim +/of_clk_get_from_provider +163 arch/mips//lantiq/clk.c
>
> 287e3f3f John Crispin 2012-04-17  157
> 287e3f3f John Crispin 2012-04-17  158   if (clk->deactivate)
> 287e3f3f John Crispin 2012-04-17  159           clk->deactivate(clk);
> 287e3f3f John Crispin 2012-04-17  160  }
> 287e3f3f John Crispin 2012-04-17  161  EXPORT_SYMBOL(clk_deactivate);
> 287e3f3f John Crispin 2012-04-17  162
> b902d9a9 John Crispin 2012-07-22 @163  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
> b902d9a9 John Crispin 2012-07-22  164  {
> b902d9a9 John Crispin 2012-07-22  165   return NULL;
> b902d9a9 John Crispin 2012-07-22  166  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
