Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40921 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbeKFDok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 22:44:40 -0500
Received: by mail-ua1-f68.google.com with SMTP id n7so3544365uao.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 10:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com> <20181105180829.GA966@kunai>
In-Reply-To: <20181105180829.GA966@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 19:23:33 +0100
Message-ID: <CAMuHMdX6Eqc9QPrh00v00uhjMnaoT_f5rnKfo-VKJwF4W1mOmA@mail.gmail.com>
Subject: Re: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
To: Wolfram Sang <wsa@the-dreams.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, Nov 5, 2018 at 7:08 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Is there any chance this can start to bite us in the future?
>
> Well, there is always a chance but to the best of our current knowledge,
> we can't see it for Gen3. And even then, we can still fix it.
>
> I was entering SDHI hackfest with the attitude of representing the
> hardware which means exposing SDHn. Yet, I got convinced that getting
> and keeping highspeed modes stable means turning a lot of knobs
> currently. This is not only true for HS400, but also HS200 and SDR50 and
> SDR104.
>
> This simple approach here allows us to have a stable base on which we
> can evaluate the other BSP patches on top. Especially those which modify
> the tuning procedure.
>
> So, because this change does not prevent SDHn exposure in the future, I
> suggest to go this way for now, so we can spend our (limited) manpower
> on evaluating the tuning next.

OK. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
