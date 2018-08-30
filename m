Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:41331 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbeH3QmN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:42:13 -0400
Received: by mail-vk0-f68.google.com with SMTP id j14-v6so4149239vke.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 05:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXLxhudW_s-FmtADt0a9-qd501s0Ckm=FTY97mxGH5GBw@mail.gmail.com> <20180821134147.sn4xzw4hn63r2cqm@ninjato>
In-Reply-To: <20180821134147.sn4xzw4hn63r2cqm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 14:40:03 +0200
Message-ID: <CAMuHMdVxuzdORq=dicgaGNfh+8Yzh5w7NoT8_WCFbn7QSad86A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Aug 21, 2018 at 3:41 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > +/* MD12 (SW12-7) must be set 'Off' which is not the default! */
> >
> > Upon reading this again, I think this comment is confusing: the 'Off' refers
> > to the switch position, not to the MD12 logic value, while the parentheses
> > suggest otherwise.
> >
> > What about the following?
> >
> >     SW12-7 must be set 'Off' (MD12 set to 1), which is not the default!
>
> I'd leave the ',' away but otherwise:
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Shall I send an incremental patch or do you want to do it?

Sent, preacked ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
