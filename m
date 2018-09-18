Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42849 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbeIRQnw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 12:43:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id s188-v6so470644vss.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 04:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180918100932.16304-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180918100932.16304-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 13:11:34 +0200
Message-ID: <CAMuHMdXXTOmCEGb+=b9y4vFBBhesk-QvTgdYgwGSXo5TkX_TNA@mail.gmail.com>
Subject: Re: [PATCH RFT] serial: sh-sci: Add r8a77990 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Sep 18, 2018 at 12:09 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>
> This patch adds the R-Car E3 serial documentation.
>
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>
> I cannot test this. But we have other devices added for E3 meanwhile, so
> people surely used a console to do that? Can somebody confirm this?
> After that I'll send a proper patch to linux-serial list, too.

SCIF is definitely working.
HSCIF0 can be muxed to the same pins as the console (SCIF2), so you
can actually test this using remote access, after upporting the pfc part ;-)

For local users: on E3, the QSPI pins (on 2.54mm headers on Ebisu) are
not single-use, but can be muxed to HSCIF, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
