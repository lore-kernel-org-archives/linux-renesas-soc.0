Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:38307 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbcIBIAL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:00:11 -0400
Received: by mail-it0-f48.google.com with SMTP id c198so24504348ith.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 01:00:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57C92808.1000509@tataelxsi.co.in>
References: <57C56FAA.7090407@tataelxsi.co.in> <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com>
 <57C81DF0.4040308@tataelxsi.co.in> <CAMuHMdUc7XsAUD+tzfsRzb_26J-nKJQ2Rq_uUQ+z6Y38KWabmQ@mail.gmail.com>
 <57C92808.1000509@tataelxsi.co.in>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Sep 2016 10:00:10 +0200
Message-ID: <CAMuHMdUUnr+tTi4FD0QvbtTb9xoB8dCJC6uno=9dAwXaJXi4Bw@mail.gmail.com>
Subject: Re: R-Car E2 Can interface receive issue
To: Roopesh K P <roopeshkp@tataelxsi.co.in>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi RKP,

On Fri, Sep 2, 2016 at 9:19 AM, Roopesh K P <roopeshkp@tataelxsi.co.in> wrote:
> I assume Koelsch and Porter boards have not much difference in their make
> (both are using R-CAR M2 as SoC) and I can boot a Koelsch board with uImage
> and dtb(r8a7791-porter.dtb) made for porter board . I did this for testing
> CAN interface in my Koelsch board.

Using the DTB for Porter on Koelsch means you're lying about the hardware that's
present, and obviously won't work.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
