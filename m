Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35745 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752252AbdFOObt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 10:31:49 -0400
Received: by mail-it0-f67.google.com with SMTP id f20so2094920itb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 07:31:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170615142040.GC22158@verge.net.au>
References: <201706141946.RByoFGXO%fengguang.wu@intel.com> <CAMuHMdUkhpGGJPNLKmWn1znNcLFL7e7nqp6QK59qCd0Y8i22-w@mail.gmail.com>
 <20170615134541.GA22158@verge.net.au> <CAMuHMdUmkU-e2wWAYgKZ48u8HYE1VO7jSP0NRAqJafAzdZbwPA@mail.gmail.com>
 <20170615142040.GC22158@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jun 2017 16:31:48 +0200
Message-ID: <CAMuHMdXU-VPi-kVPjSXT2VdAc53DkGzqbWerUjparSyH+B10fQ@mail.gmail.com>
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

On Thu, Jun 15, 2017 at 4:20 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Jun 15, 2017 at 04:08:56PM +0200, Geert Uytterhoeven wrote:
>> On Thu, Jun 15, 2017 at 3:45 PM, Simon Horman <horms@verge.net.au> wrote:
>> depends on commit ffaa42e8a40b7f10 ("PM / Domains: Enable users of genpd
>> to specify always on PM domains") in v4.12-rc1.
>>
>> It does not depend on anything else that's only in fixes-for-v4.12.
>
> Ok, that is clear. But for some reason I thought that
>
> "soc: renesas: Rework Kconfig and Makefile logic" depends on
> "soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing"

Yes, it does, as the former reworks the dummy provided by the latter.

But "soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON" does not depend
on any of these.

But now I understand the issue you're facing: drivers-for-v4.13 depends both on
commits in v4.12-rc1, and on fixes still destined for v4.12.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
