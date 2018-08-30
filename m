Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36881 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbeH3QVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:21:14 -0400
MIME-Version: 1.0
References: <20180828111104.25066-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180828111104.25066-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 14:19:09 +0200
Message-ID: <CAMuHMdXnKTmsRn6e7J+y8kANaSZyLojWu2QeoY7UHhOZ72-XjQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 1:11 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This patch adds DU pins, groups and function for the R8A77990 (E3) SoC.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - Add DU_CLKIN0

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queued in sh-pfc-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
