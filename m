Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:38663 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752342AbeBTS2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 13:28:37 -0500
Received: by mail-qt0-f196.google.com with SMTP id k13so17584669qtg.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 10:28:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518791171-14162-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791171-14162-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518791171-14162-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 19:28:36 +0100
Message-ID: <CAMuHMdWDgY3di1yHYTc8N6cX_a-i93BVBHoN6AA3nK0hd-wSCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7796: Add TMU pins, groups and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 16, 2018 at 3:26 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds TMU TCLK{1,2} pins, groups and functions to
> the R8A7796 SoC.
>
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
