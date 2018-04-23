Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:45870 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753109AbeDWHu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 03:50:27 -0400
Received: by mail-ua0-f195.google.com with SMTP id j18so9563550uae.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Apr 2018 00:50:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152439169549.19829.11796550786939315157.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple> <152439169549.19829.11796550786939315157.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Apr 2018 09:50:25 +0200
Message-ID: <CAMuHMdWHQdCwL_FuaDBnzB1rO=eHa_V2-n-Nm_4TgEtr-wDEvg@mail.gmail.com>
Subject: Re: [PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 22, 2018 at 12:08 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
> in DT on the r8a7795 SoC.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
