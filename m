Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36717 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753243AbdFPKG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 06:06:27 -0400
MIME-Version: 1.0
In-Reply-To: <20170615073031.11199-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170615073031.11199-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 12:06:25 +0200
Message-ID: <CAMuHMdUyyo1aPGz+KN7D8QHJeeKqDpGrD9ALiqgEUbdBVUG8QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU parallel RGB output support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 15, 2017 at 9:30 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The H3 ES1.x and H3 ES2.0 have identical pinmuxing for the parallel RGB
> output support.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
