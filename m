Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:41791 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750915AbeBTOJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 09:09:12 -0500
Received: by mail-qk0-f176.google.com with SMTP id h129so16501285qke.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 06:09:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518696091-23561-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518696091-23561-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 15:09:11 +0100
Message-ID: <CAMuHMdUwVW72rn_mwhvHVKQgY9Zw_Adx9KBne+=YP-52BZCToA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a77995: Add VIN4 pins, groups and function
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 1:01 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This patch adds VIN4 pins, groups and function for the
> R8A77995 (D3) SoC.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But same comments as for r8a779[56].

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
