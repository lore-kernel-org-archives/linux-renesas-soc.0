Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:40331 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdLDM3J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 07:29:09 -0500
Received: by mail-qt0-f195.google.com with SMTP id u42so20848873qte.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 04:29:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201712041943.jvXqnIA5%fengguang.wu@intel.com>
References: <201712041943.jvXqnIA5%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2017 13:29:08 +0100
Message-ID: <CAMuHMdXyPGC0YiDOQB_nbPZJF+x_CEJJka951LesggjsP4TJ9w@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/phy-reset-v4 1/4] include/linux/err.h:31:9:
 warning: 'gpiod' may be used uninitialized in this function
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 4, 2017 at 12:05 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/phy-reset-v4
> head:   8999caba1f624814c0e3e2a6fabfdab70ae44e9e
> commit: 8274c902dc09564722a4ef7e1364bb3f3f2f9f79 [1/4] phylib: Add device reset GPIO support
> config: i386-randconfig-x076-201749 (attached as .config)
> compiler: gcc-7 (Debian 7.2.0-12) 7.2.1 20171025
> reproduce:
>         git checkout 8274c902dc09564722a4ef7e1364bb3f3f2f9f79
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/x86/include/asm/processor.h:32:0,
>                     from arch/x86/include/asm/cpufeature.h:5,
>                     from arch/x86/include/asm/thread_info.h:53,
>                     from include/linux/thread_info.h:38,
>                     from arch/x86/include/asm/preempt.h:7,
>                     from include/linux/preempt.h:81,
>                     from include/linux/spinlock.h:51,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:6,
>                     from include/linux/slab.h:15,
>                     from drivers/net/phy/mdio_bus.c:20:
>    drivers/net/phy/mdio_bus.c: In function 'mdiobus_register_device':
>>> include/linux/err.h:31:9: warning: 'gpiod' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      return (long) ptr;
>             ^~~~~~~~~~
>    drivers/net/phy/mdio_bus.c:52:20: note: 'gpiod' was declared here
>      struct gpio_desc *gpiod;
>                        ^~~~~

Thanks!

Silly KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
