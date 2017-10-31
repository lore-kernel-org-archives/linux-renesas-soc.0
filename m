Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:49661 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751876AbdJaPcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 11:32:42 -0400
Received: by mail-lf0-f68.google.com with SMTP id w21so19547628lfc.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2017 08:32:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201710312307.I7VJqnd9%fengguang.wu@intel.com>
References: <201710312307.I7VJqnd9%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2017 16:32:40 +0100
Message-ID: <CAMuHMdUDRJ1hrxd7iq1CtuP6V+4a-MgiyE7WdvG4-LKUpRArpg@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/phy-reset-v3 1/4] drivers/of/of_mdio.c:65:10:
 warning: 'return' with a value, in function returning void
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 31, 2017 at 4:14 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/phy-reset-v3
> head:   a1d46e588cf5f3554d849614ae91db6f30933ea5
> commit: 155bdea9cfe35268946786014dc01998acb7edbd [1/4] phylib: Add device reset GPIO support
> config: x86_64-randconfig-x019-201744 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         git checkout 155bdea9cfe35268946786014dc01998acb7edbd
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> All warnings (new ones prefixed by >>):
>
>    drivers/of/of_mdio.c: In function 'of_mdiobus_register_phy':
>>> drivers/of/of_mdio.c:65:10: warning: 'return' with a value, in function returning void

Sorry, I based topic/phy-reset-v3 on v4.14-rc1, while it depends on a change
in v4.14-rc6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
