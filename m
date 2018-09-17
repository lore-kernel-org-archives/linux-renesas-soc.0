Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33378 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbeIQQt2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:49:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id y12-v6so2634827vsm.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 04:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <153717356234.480.6698281193817518888.sendpatchset@octo> <153717357933.480.16204445206291701317.sendpatchset@octo>
In-Reply-To: <153717357933.480.16204445206291701317.sendpatchset@octo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 13:22:22 +0200
Message-ID: <CAMuHMdVzxOvxuO9UCbhkpFd-fj9mhE_j53uFVEULa03=8c5rXQ@mail.gmail.com>
Subject: Re: [PATCH 02/03] arm: dts: Include R-Car Gen2 product name in DTSI files
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 10:39 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Improve the user friendliness of the DTS code base by including the
> R-Car product name in each R-Car Gen2 DTSI file.
>
> The product names are taken from:
> Documentation/devicetree/bindings/arm/shmobile.txt
>
> Signed-off-by: Magnus Damm <damm@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
