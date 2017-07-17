Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36414 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751284AbdGQN3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 09:29:55 -0400
Received: by mail-it0-f65.google.com with SMTP id k3so17939571ita.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2017 06:29:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201707172139.e03IbTqo%fengguang.wu@intel.com>
References: <201707172139.e03IbTqo%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 15:29:54 +0200
Message-ID: <CAMuHMdU3k_vpTN2OiANrEjrw7gKSJW=Q73Zn0eS9XsRmq0wi+g@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/renesas-overlays 20/86]
 drivers//of/unittest.c:2586:3: error: implicit declaration of function '__of_attach_node_sysfs'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 17, 2017 at 3:13 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
> head:   21b4ee226c68bdaba9db7f6fc7cbdfab58db40b9
> commit: 3b480353c59beefd9537feca3febda56339bbb21 [20/86] of: rename *_node_sysfs to _node_post
> config: x86_64-randconfig-x013-201729 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         git checkout 3b480353c59beefd9537feca3febda56339bbb21
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> All errors (new ones prefixed by >>):
>
>    drivers//of/unittest.c: In function 'of_unittest_overlay_high_level':
>>> drivers//of/unittest.c:2586:3: error: implicit declaration of function '__of_attach_node_sysfs' [-Werror=implicit-function-declaration]
>       __of_attach_node_sysfs(np);
>       ^~~~~~~~~~~~~~~~~~~~~~

Upstream got one more user of __of_attach_node_sysfs() to be converted...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
