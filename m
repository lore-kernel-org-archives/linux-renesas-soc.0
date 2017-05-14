Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33380 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdENKB5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2017 06:01:57 -0400
Received: by mail-io0-f196.google.com with SMTP id m4so9318651ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 03:01:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513231618.1715-6-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com> <20170513231618.1715-6-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 14 May 2017 12:01:55 +0200
Message-ID: <CAMuHMdXrYm7BU0LmW-ztsiiyUBDVnXRQvptXhwvmrjODGYxavw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: renesas: r8a7795-salvator-x: Enable
 HDMI outputs
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 14, 2017 at 1:16 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Enable the HDMI encoders for the H3 Salvator-X board. The number of
> encoders varies between the H3 and M3-W SoCs, so they can't be enabled
> in the common salvator-x.dtsi file.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
