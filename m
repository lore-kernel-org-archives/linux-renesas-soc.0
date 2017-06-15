Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33392 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751985AbdFOOI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 10:08:58 -0400
Received: by mail-io0-f194.google.com with SMTP id j200so1963161ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 07:08:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615134541.GA22158@verge.net.au>
References: <201706141946.RByoFGXO%fengguang.wu@intel.com> <CAMuHMdUkhpGGJPNLKmWn1znNcLFL7e7nqp6QK59qCd0Y8i22-w@mail.gmail.com>
 <20170615134541.GA22158@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jun 2017 16:08:56 +0200
Message-ID: <CAMuHMdUmkU-e2wWAYgKZ48u8HYE1VO7jSP0NRAqJafAzdZbwPA@mail.gmail.com>
Subject: Re: [renesas:drivers-for-v4.13 3/3] drivers/soc/renesas/rcar-sysc.c:209:19:
 error: 'GENPD_FLAG_ALWAYS_ON' undeclared
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        kbuild test robot <fengguang.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Jun 15, 2017 at 3:45 PM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 14, 2017 at 01:31:41PM +0200, Geert Uytterhoeven wrote:
>> On Wed, Jun 14, 2017 at 1:04 PM, kbuild test robot
>> <fengguang.wu@intel.com> wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git drivers-for-v4.13
>> > head:   895c7e91d84c0f0e207ad909482ed70b5f3c806f
>> > commit: 895c7e91d84c0f0e207ad909482ed70b5f3c806f [3/3] soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON
>> > config: ia64-allmodconfig (attached as .config)
>> > compiler: ia64-linux-gcc (GCC) 6.2.0
>> > reproduce:
>> >         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>> >         chmod +x ~/bin/make.cross
>> >         git checkout 895c7e91d84c0f0e207ad909482ed70b5f3c806f
>> >         # save the attached .config to linux build tree
>> >         make.cross ARCH=ia64
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> >    drivers/soc/renesas/rcar-sysc.c: In function 'rcar_sysc_pd_setup':
>> >>> drivers/soc/renesas/rcar-sysc.c:209:19: error: 'GENPD_FLAG_ALWAYS_ON' undeclared (first use in this function)
>> >       genpd->flags |= GENPD_FLAG_ALWAYS_ON;
>>
>> Looks like your drivers-for-v4.13 is based on v4.11-rc1
>> (renesas-fixes-for-v4.12) instead of v4.12-rc1.
>> Can you please rebase it?
>
> It is based on renesas-fixes-for-v4.12 because I was under the impression
> that the patch there is a dependency for (other) patches in renesas drivers.
> Is that the case? If so I think the correct (new) base would be v4.12-rc2.

"soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON" in drivers-for-v4.13
depends on commit ffaa42e8a40b7f10 ("PM / Domains: Enable users of genpd
to specify always on PM domains") in v4.12-rc1.

It does not depend on anything else that's only in fixes-for-v4.12.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
