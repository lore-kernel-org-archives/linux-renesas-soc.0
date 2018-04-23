Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:42024 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751216AbeDWHwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 03:52:03 -0400
Received: by mail-ua0-f194.google.com with SMTP id f3so4030812uan.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Apr 2018 00:52:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152439171246.19829.15567089587915785015.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple> <152439171246.19829.15567089587915785015.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Apr 2018 09:52:02 +0200
Message-ID: <CAMuHMdW17kCXxYnVVu2U7L3hSG5PeFQ-86YYjOO76bho-ecm8A@mail.gmail.com>
Subject: Re: [PATCH 03/04] arm64: dts: renesas: r8a77970: Enable IPMMU devices
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
> in DT on the r8a77970 SoC.
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
