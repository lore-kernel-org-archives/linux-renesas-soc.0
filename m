Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36181 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdFUHdh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 03:33:37 -0400
Received: by mail-it0-f68.google.com with SMTP id 185so18131570itv.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 00:33:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1497965482-10785-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1497965482-10785-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jun 2017 09:33:35 +0200
Message-ID: <CAMuHMdWCigBOoc0P8oV1+PWMbx7NWg1D7mMaN60waRzcCOvjCA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: Add SCIF1 and SCIF2 pin groups
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Tue, Jun 20, 2017 at 3:31 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Add SCIF1 and SCIF2 pin groups to the R8A7792 PFC driver.

Thanks for the update!

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I.e. queuing in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
