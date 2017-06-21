Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33306 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdFULSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 07:18:00 -0400
Received: by mail-io0-f195.google.com with SMTP id j200so286321ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 04:18:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621093133.5677-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com> <20170621093133.5677-7-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jun 2017 13:17:58 +0200
Message-ID: <CAMuHMdU1zj1qxq7_udTjOEBGm3v0CmAtnEmCVEth1BSkYn4xmg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a7796-salvator-x: Add DU
 external dot clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 11:31 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU1 external dot clock is provided by the fixed frequency clock
> generator X21, while the DU0 and DU2 clocks are provided by the
> programmable Versaclock5 clock generator.
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
