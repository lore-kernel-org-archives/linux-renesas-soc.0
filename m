Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34104 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdENKBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2017 06:01:25 -0400
Received: by mail-io0-f195.google.com with SMTP id 12so9272363iol.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 03:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513231618.1715-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com> <20170513231618.1715-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 14 May 2017 12:01:23 +0200
Message-ID: <CAMuHMdWScaonLkABdn-PrefdciLOi7wXENx9KkhFkC113_QjdQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: renesas: r8a7795-salvator-x: Add DU
 external dot clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 14, 2017 at 1:16 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU1 and DU2 external dot clocks are provided by the fixed frequency
> clock generators X21 and X22, while the DU0 and DU3 clocks are provided
> by the programmable Versaclock5 clock generator.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
