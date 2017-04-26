Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35822 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1429985AbdDZMoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 08:44:20 -0400
Received: by mail-io0-f194.google.com with SMTP id d203so303634iof.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Apr 2017 05:44:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201704260231.UPwOcr7f%fengguang.wu@intel.com>
References: <201704260231.UPwOcr7f%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2017 14:44:18 +0200
Message-ID: <CAMuHMdWXQ3U4umjWFjpPDZm6=9rk=NgG+bBqeMfnu1pLMkZJkA@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/rcar2-cpg-mssr 10/32] drivers/clk/renesas/renesas-cpg-mssr.c:323:14-21:
 ERROR: PTR_ERR applied after initialization to constant on line 260
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fengguang,

On Tue, Apr 25, 2017 at 8:52 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> First bad commit (maybe != root cause):

Indeed, it's exposed by broadening compile-testing.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar2-cpg-mssr
> head:   bd948f4b8c455dfdbc8175b5c2bc29c91b048971
> commit: bb107dc7b20e9c63fb44a9fa132d6581a6b69944 [10/32] [RFC] clk: renesas: Rework Kconfig and Makefile logic
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         git checkout bb107dc7b20e9c63fb44a9fa132d6581a6b69944
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/renesas/clk-sh73a0.c: In function 'sh73a0_cpg_clocks_init':
>>> drivers/clk/renesas/clk-sh73a0.c:155:10: warning: 'parent_name' may be used uninitialized in this function [-Wmaybe-uninitialized]
>       return clk_register_fixed_factor(NULL, name, parent_name, 0,
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            mult, div);
>            ~~~~~~~~~~
>    drivers/clk/renesas/clk-sh73a0.c:82:14: note: 'parent_name' was declared here
>      const char *parent_name;
>                  ^~~~~~~~~~~

This is indeed a false positive. Some code reorganization may silence this.

> coccinelle warnings: (new ones prefixed by >>)
>
>>> drivers/clk/renesas/renesas-cpg-mssr.c:323:14-21: ERROR: PTR_ERR applied after initialization to constant on line 260
>
> vim +323 drivers/clk/renesas/renesas-cpg-mssr.c
>
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  254  }
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  255
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  256  static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  257                                           const struct cpg_mssr_info *info,
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  258                                           struct cpg_mssr_priv *priv)
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  259  {
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16 @260     struct clk *clk = NULL, *parent;

Ah, Coccinelle doesn't like NULL error pointers.
Probably it should be initialized to PTR_ERR(-ENOTSUPP) here...

> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  304     default:
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  305             if (info->cpg_clk_register)
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  306                     clk = info->cpg_clk_register(dev, core, info,
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  307                                                  priv->clks, priv->base);
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  308             else
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  309                     dev_err(dev, "%s has unsupported core clock type %u\n",
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  310                             core->name, core->type);

... or here.

> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  311             break;
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  312     }
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  313
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  314     if (IS_ERR_OR_NULL(clk))
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  315             goto fail;
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  316
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  317     dev_dbg(dev, "Core clock %pC at %pCr Hz\n", clk, clk);
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  318     priv->clks[id] = clk;
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  319     return;
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  320
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  321  fail:
> 1b9fe703 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven 2016-10-18  322     dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16 @323             core->name, PTR_ERR(clk));
> f793d1e5 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven 2015-10-16  324  }

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
