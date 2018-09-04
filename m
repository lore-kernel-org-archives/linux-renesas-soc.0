Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:37147 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbeIDS6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Sep 2018 14:58:05 -0400
Received: by mail-vk0-f68.google.com with SMTP id 79-v6so1417890vkm.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Sep 2018 07:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com> <20180904121027.24031-13-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180904121027.24031-13-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Sep 2018 16:32:32 +0200
Message-ID: <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
Subject: Re: [PATCH 12/16] arm64: dts: renesas: r8a77990: Add I2C device nodes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 4, 2018 at 2:10 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
> tree.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

My

    Reviewed-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
    Tested-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>

are still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
