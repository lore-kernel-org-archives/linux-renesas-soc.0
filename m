Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:45300 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750773AbeBTN65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 08:58:57 -0500
Received: by mail-qt0-f181.google.com with SMTP id v90so13616602qte.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 05:58:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518696091-23561-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518696091-23561-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 14:58:56 +0100
Message-ID: <CAMuHMdVBMasfKKVjqoHBUnufX7O8By491zuhV1RbOx6ROttSmQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7795: Add VIN4, VIN5 pins, groups
 and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 1:01 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This patch adds VIN4 and VIN5 pins, groups and functions for the
> R8A7795 SoC.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But same comments as for r8a7796.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
