Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36098 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755241AbdGSQAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 12:00:55 -0400
Received: by mail-it0-f67.google.com with SMTP id r4so188542ith.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2017 09:00:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201707192316.YhI18UVj%fengguang.wu@intel.com>
References: <201707192316.YhI18UVj%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 18:00:52 +0200
Message-ID: <CAMuHMdWHCmPb0WF9fx9WjKF3ERrMYaaCq+-QNKS=n6MJWe7wXg@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/rcar2-cpg-mssr-dt-v2 1/9]
 arch/arm/boot/dts/r8a7790.dtsi:13:48: fatal error: dt-bindings/clock/r8a7790-cpg-mssr.h:
 No such file or directory
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 19, 2017 at 5:54 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar2-cpg-mssr-dt-v2
> head:   719d66878b5366748b076ab8b7e3a0ed6012033c
> commit: 09edb9fc52b0323c57747413da258d35f6a80495 [1/9] ARM: dts: r8a7790: Convert to new CPG/MSSR bindings
> config: arm-at91_dt_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 09edb9fc52b0323c57747413da258d35f6a80495
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/arm/boot/dts/r8a7790-lager.dts:42:0:
>>> arch/arm/boot/dts/r8a7790.dtsi:13:48: fatal error: dt-bindings/clock/r8a7790-cpg-mssr.h: No such file or directory
>     #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
>                                                    ^
>    compilation terminated.

Woops, forgot to merge v4.13-rc1 into Simon's devel branch, which is
still at v4.12.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
