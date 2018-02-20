Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:33910 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750732AbeBTN6S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 08:58:18 -0500
Received: by mail-qt0-f181.google.com with SMTP id d14so16432795qtg.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 05:58:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 14:58:17 +0100
Message-ID: <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups
 and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Thu, Feb 15, 2018 at 1:01 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This patch adds VIN4 and VIN5 pins, groups and functions for the
> R8A7796 SoC.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I guess you can use union vin_data and VIN_DATA_PIN_GROUP() to
reduce duplication, like on R-Car Gen2?

Would there be a use case for vin4_data4 and vin5_data4, or is that
mode only supported on R-Car H2?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
