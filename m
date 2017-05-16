Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34861 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751701AbdEPKeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 06:34:13 -0400
MIME-Version: 1.0
In-Reply-To: <20170428175428.588162131@cogentembedded.com>
References: <20170428175428.588162131@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 12:34:11 +0200
Message-ID: <CAMuHMdU_sTsgHPuJ7oLZA-49O6C5he-XQ1woK7oxXYBJPR-_xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: remove AVB_AVTP_* groups
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 28, 2017 at 7:50 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The ATA_AVTP_* signals are documented as reserved in the recent R-Car E2
> user's manual (the only remaining mention is in the table 5.2 and I believe
> it's a simple overlook).  Remove the AVB_AVTP_* pinmux groups -- we will
> remove the signals themselves in the next patch, along with the other now
> reserved bits...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
