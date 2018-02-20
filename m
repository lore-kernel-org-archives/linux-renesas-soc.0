Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:41484 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751344AbeBTRw3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 12:52:29 -0500
Received: by mail-qt0-f169.google.com with SMTP id a9so17418753qtj.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 09:52:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518791104-13928-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518791104-13928-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 18:52:28 +0100
Message-ID: <CAMuHMdXqWjunuVx+L6ogfr4=2-EzY0PycAGa9EZPUhgRF3EYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin
 assignment for SSI pins group
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 16, 2018 at 3:25 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes MOD_SEL1 bit20 and MOD_SEL2 bit20, bit21 pin assignment
> for SSI pins group.
>
> This is a correction to the incorrect implementation of MOD_SEL register
> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.
>
> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queueing in sh-pfc-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
