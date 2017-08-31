Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38588 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750974AbdHaKGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 06:06:18 -0400
Received: by mail-pf0-f194.google.com with SMTP id r187so140034pfr.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2017 03:06:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201708300125.36kKJFcZ%fengguang.wu@intel.com>
References: <201708300125.36kKJFcZ%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2017 12:06:17 +0200
Message-ID: <CAMuHMdUrbmq_Dmw_p3Xwex=_xmohD9aXd2r_=rPkJv8JVXbyoQ@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/r8a7794-smp-v2 2/3] arch/arm/mach-shmobile/headsmp-apmu.S:24:
 Error: selected processor does not support `isb' in ARM mode
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fengguang,

On Tue, Aug 29, 2017 at 7:38 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a7794-smp-v2
> head:   28ff1a758639895fd5cea127ba16f92ff3f30628
> commit: 0cc5e107f08f1835b8fcd6bddf91a7259a7298ae [2/3] ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 0cc5e107f08f1835b8fcd6bddf91a7259a7298ae
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All errors (new ones prefixed by >>):
>
>    arch/arm/mach-shmobile/headsmp-apmu.S: Assembler messages:
>>> arch/arm/mach-shmobile/headsmp-apmu.S:24: Error: selected processor does not support `isb' in ARM mode
>    arch/arm/mach-shmobile/headsmp-apmu.S:27: Error: selected processor does not support `isb' in ARM mode
>    arch/arm/mach-shmobile/headsmp-apmu.S:29: Error: selected processor does not support `isb' in ARM mode

Thank you!

For compatibility with arm v6 builds (e.g. allmodconfig), "isb" should be
replaced by "instr_sync".

Will fix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
