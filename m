Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:39453 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752162AbdK1UJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 15:09:46 -0500
Received: by mail-qt0-f194.google.com with SMTP id k19so1492752qtj.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2017 12:09:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201711290403.hmerW2DH%fengguang.wu@intel.com>
References: <201711290403.hmerW2DH%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2017 21:09:45 +0100
Message-ID: <CAMuHMdXLT88+nb2_hyZ8evVxEg=R+YRKqkO1uajPu1++4yAFFg@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/renesas-overlays 14/88]
 drivers//of/unittest.c:1970:2: error: implicit declaration of function 'of_overlay_create_indirect'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 9:05 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
> head:   1b3280e42a0063f04f3ab7c9f8bbe4b5c65c51d9
> commit: 71f8b1178fc334bfb92d8f2c6296a6c83c276b18 [14/88] of: unittest: Add indirect overlay target test
> config: xtensa-allmodconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 71f8b1178fc334bfb92d8f2c6296a6c83c276b18
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa
>
> All errors (new ones prefixed by >>):
>
>    drivers//of/unittest.c: In function 'of_unittest_overlay_16':
>>> drivers//of/unittest.c:1970:2: error: implicit declaration of function 'of_overlay_create_indirect' [-Werror=implicit-function-declaration]
>      ret = of_overlay_create_indirect(np, "unittest16");
>      ^
>    cc1: some warnings being treated as errors

Thanks, I forgot to rename the functions in the unittests. Will fix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
