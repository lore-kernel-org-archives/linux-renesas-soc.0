Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:56725 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753141AbdJaPbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 11:31:01 -0400
Received: by mail-lf0-f68.google.com with SMTP id 90so19500616lfs.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2017 08:31:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201710312324.062oHRLg%fengguang.wu@intel.com>
References: <201710312324.062oHRLg%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2017 16:30:58 +0100
Message-ID: <CAMuHMdXZWCBravc4WdtdwswsVEQhvD9wzE4AJFKOv0ubf-zGzg@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/phy-reset-v3 1/4] drivers//of/of_mdio.c:60:10:
 error: implicit declaration of function 'fwnode_get_named_gpiod'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 31, 2017 at 4:18 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/phy-reset-v3
> head:   a1d46e588cf5f3554d849614ae91db6f30933ea5
> commit: 155bdea9cfe35268946786014dc01998acb7edbd [1/4] phylib: Add device reset GPIO support
> config: powerpc-mpc8315_rdb_defconfig (attached as .config)
> compiler: powerpc-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 155bdea9cfe35268946786014dc01998acb7edbd
>         # save the attached .config to linux build tree
>         make.cross ARCH=powerpc
>
> All errors (new ones prefixed by >>):
>
>    drivers//of/of_mdio.c: In function 'of_mdiobus_register_phy':
>>> drivers//of/of_mdio.c:60:10: error: implicit declaration of function 'fwnode_get_named_gpiod' [-Werror=implicit-function-declaration]

Thanks, adding #include <linux/gpio/consumer.h> to drivers/of/of_mdio.c
fixes this.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
