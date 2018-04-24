Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:45587 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751417AbeDXPBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 11:01:31 -0400
Received: by mail-vk0-f65.google.com with SMTP id 203so11818330vka.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 08:01:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com> <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 17:01:29 +0200
Message-ID: <CAMuHMdVmaAGZmSyXq+5F4pcL-=ytZMZEBM2TVMUVFNCrwxxtxA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: renesas: r8a7790: Add FDP1 instances
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 22, 2018 at 12:35 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The r8a7790 has three FDP1 instances.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1606,6 +1606,33 @@
>                         resets = <&cpg 128>;
>                 };
>
> +               fdp1@fe940000 {

Just wondering: should we go for "display-processor@foo"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
