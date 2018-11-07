Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:45549 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbeKGSv4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 13:51:56 -0500
Received: by mail-vk1-f193.google.com with SMTP id n126so3336326vke.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Nov 2018 01:22:26 -0800 (PST)
MIME-Version: 1.0
References: <201811071730.l9oHq1qJ%fengguang.wu@intel.com>
In-Reply-To: <201811071730.l9oHq1qJ%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Nov 2018 10:22:14 +0100
Message-ID: <CAMuHMdVO1kAVnsGFD6mc2Z-0RqT=w=mP4Et0iBRzhbBrF7CF3A@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/pinctrl-rza2-v2 1/2] drivers//pinctrl/pinctrl-rza2.c:25:43:
 error: 'RZA2_NPORTS' undeclared here (not in a function); did you mean 'RZA2_NPINS'?
To: kbuild test robot <lkp@intel.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 7, 2018 at 10:12 AM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/pinctrl-rza2-v2
> head:   bb0f488fb2907f47250f7f34af60a482fd3dbfe4
> commit: feac9e8cb1ad7b4979e4b553fcdf2d8582049227 [1/2] pinctrl: Add RZ/A2 pin and gpio controller
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout feac9e8cb1ad7b4979e4b553fcdf2d8582049227
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=mips
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from arch/mips/include/asm/ptrace.h:19:0,
>                     from include/linux/irq.h:24,
>                     from include/linux/gpio/driver.h:7,
>                     from include/asm-generic/gpio.h:13,
>                     from include/linux/gpio.h:62,
>                     from drivers//pinctrl/pinctrl-rza2.c:14:
> >> arch/mips/include/uapi/asm/ptrace.h:17:13: error: expected identifier before numeric constant
>     #define PC  64
>                 ^

Great, so MIPS defines PC, precluding it use in any driver that includes
<asm/ptrace.h> in some way.

However, it looks like <linux/gpio/driver.h> doesn't really need <linux/irq.h>.
Will send a patch to try that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
