Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43062 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbeKETrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:47:33 -0500
Received: by mail-vs1-f66.google.com with SMTP id k14so4757027vsm.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 02:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <20181031232518.2490-2-niklas.soderlund@ragnatech.se> <20181101193740.GP2433@kunai>
In-Reply-To: <20181101193740.GP2433@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:28:21 +0100
Message-ID: <CAMuHMdUzXV9DaER=HjXg+ibc5F3v4w-_boBQeqHw+VONRe3_Qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rcar-gen3: add documentation for SD clocks
To: Wolfram Sang <wsa@the-dreams.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Nov 1, 2018 at 8:37 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Nov 01, 2018 at 12:25:17AM +0100, Niklas Söderlund wrote:
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Document the known use cases of the different clock settings. This is
> > useful as different SoC and ES versions uses different settings to do
> > the same thing as there are more then one combination to achieve the
> > same SDn clock speed.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Is a Tested-by appropriate for a comment-only patch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
