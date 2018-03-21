Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:45800 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751947AbeCUJaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 05:30:55 -0400
Received: by mail-qk0-f194.google.com with SMTP id s9so4688251qke.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 02:30:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
References: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Mar 2018 10:30:53 +0100
Message-ID: <CAMuHMdWgrhoM60Vpko59dGLFPcCL9suPws26FUrsA4nXBkUs4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit number
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 8:51 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
> for [R-Car V3M] the DS1 bit field should be bit 0.
>
> Update the ipmmu-main property to make it match the data sheet.
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
