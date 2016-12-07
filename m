Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35579 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcLGJir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 04:38:47 -0500
Received: by mail-io0-f196.google.com with SMTP id h133so27024714ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 01:38:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201612071706.S7KfGDNg%fengguang.wu@intel.com>
References: <201612071706.S7KfGDNg%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Dec 2016 10:38:28 +0100
Message-ID: <CAMuHMdXYeJOPscg1qgwTLOiw4GD=J=X+PWRO9YSbsd-O4Eo=AQ@mail.gmail.com>
Subject: Re: [renesas:soc-for-v4.11 3/8] make[4]: *** No rule to make target
 'drivers/soc/renesas/renesas-soc.o', needed by 'drivers/soc/renesas/built-in.o'.
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 7, 2016 at 10:28 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git soc-for-v4.11
> head:   d22b40a6a05125debadedf78d35ce172e92b96f5
> commit: 68122e60d3a6d1e7e312909108b8459489393894 [3/8] Merge branch 'rcar-rst' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into soc-for-v4.11
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 68122e60d3a6d1e7e312909108b8459489393894
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All errors (new ones prefixed by >>):
>
>>> make[4]: *** No rule to make target 'drivers/soc/renesas/renesas-soc.o', needed by 'drivers/soc/renesas/built-in.o'.
>    make[4]: Target '__build' not remade because of errors.

That seems to be an incorrect merge conflict resolution in the above commit.
drivers/soc/renesas/renesas-soc.c does not exist there, so the line to build
it should not have been added to the Makefile.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
