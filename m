Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34406 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751026AbdGRGoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 02:44:20 -0400
Received: by mail-it0-f66.google.com with SMTP id o202so1443304itc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2017 23:44:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201707180130.B5VCWALQ%fengguang.wu@intel.com>
References: <201707180130.B5VCWALQ%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2017 08:44:18 +0200
Message-ID: <CAMuHMdWdsLBRC0ZfpwExXLk6as01c5Xix8PN9yHxOid6s6p5iQ@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/renesas-overlays 1/86] drivers//of/configfs.c:48:2:
 error: implicit declaration of function 'of_fdt_unflatten_tree'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 17, 2017 at 7:58 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
> head:   8361d7e7432d1937f94e1863211fb3f852e37f36
> commit: 1ba23467c1d052c0b5c35436c034f0fb7103eeaf [1/86] OF: DT-Overlay configfs interface (v7)
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 1ba23467c1d052c0b5c35436c034f0fb7103eeaf
>         # save the attached .config to linux build tree
>         make.cross ARCH=sparc64
>
> All errors (new ones prefixed by >>):
>
>    drivers//of/configfs.c: In function 'create_overlay':
>>> drivers//of/configfs.c:48:2: error: implicit declaration of function 'of_fdt_unflatten_tree' [-Werror=implicit-function-declaration]
>      of_fdt_unflatten_tree(blob, NULL, &overlay->overlay);
>      ^~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Apparently OF_OVERLAY should depend on OF_FLATTREE.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
