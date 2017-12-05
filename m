Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44748 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753171AbdLEJkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 04:40:00 -0500
MIME-Version: 1.0
In-Reply-To: <20171205103835.6fb9192f@windsurf.lan>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
 <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
 <607df840-613e-b86c-2224-43815b50627c@cogentembedded.com> <CAMuHMdVzzVZcR+oCJsHeuP-nyav=kMbjmipiJGfrY7s_DZ5qnQ@mail.gmail.com>
 <20171205103835.6fb9192f@windsurf.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2017 10:39:57 +0100
Message-ID: <CAMuHMdVG4X2E-FCVOxv+N_2gxwM=6RCmz8RS8FmZrXZadrFuXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling
 DMA mapping functions
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thomas,

On Tue, Dec 5, 2017 at 10:38 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 5 Dec 2017 09:39:35 +0100, Geert Uytterhoeven wrote:
>> >    Using 'ndev->dev.parent' (as in ravb) also should work... not sure which
>> > is better
>>
>> That was going to be my comment, too. I also haven't checked which
>> generates the smallest code.
>
> Using ndev->dev.parent actually generates bigger code (44 bytes larger) :

Thanks a lot for checking!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
