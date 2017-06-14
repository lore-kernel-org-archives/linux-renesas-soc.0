Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34537 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbdFNLbn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 07:31:43 -0400
Received: by mail-it0-f67.google.com with SMTP id 201so15373304itu.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jun 2017 04:31:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201706141946.RByoFGXO%fengguang.wu@intel.com>
References: <201706141946.RByoFGXO%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2017 13:31:41 +0200
Message-ID: <CAMuHMdUkhpGGJPNLKmWn1znNcLFL7e7nqp6QK59qCd0Y8i22-w@mail.gmail.com>
Subject: Re: [renesas:drivers-for-v4.13 3/3] drivers/soc/renesas/rcar-sysc.c:209:19:
 error: 'GENPD_FLAG_ALWAYS_ON' undeclared
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        kbuild test robot <fengguang.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 14, 2017 at 1:04 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git drivers-for-v4.13
> head:   895c7e91d84c0f0e207ad909482ed70b5f3c806f
> commit: 895c7e91d84c0f0e207ad909482ed70b5f3c806f [3/3] soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 895c7e91d84c0f0e207ad909482ed70b5f3c806f
>         # save the attached .config to linux build tree
>         make.cross ARCH=ia64
>
> All errors (new ones prefixed by >>):
>
>    drivers/soc/renesas/rcar-sysc.c: In function 'rcar_sysc_pd_setup':
>>> drivers/soc/renesas/rcar-sysc.c:209:19: error: 'GENPD_FLAG_ALWAYS_ON' undeclared (first use in this function)
>       genpd->flags |= GENPD_FLAG_ALWAYS_ON;

Looks like your drivers-for-v4.13 is based on v4.11-rc1
(renesas-fixes-for-v4.12) instead of v4.12-rc1.
Can you please rebase it?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
