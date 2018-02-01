Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36828 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754703AbeBAUCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 15:02:48 -0500
Received: by mail-qk0-f195.google.com with SMTP id d21so21032768qkj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2018 12:02:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4bf1d0e3-7389-cd24-ff6a-c750d8ea42d6@cogentembedded.com>
References: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com> <4bf1d0e3-7389-cd24-ff6a-c750d8ea42d6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Feb 2018 21:02:47 +0100
Message-ID: <CAMuHMdXDDe3Ss0hz8Ve=AM3RB7fReGpvLqx-yuJj2c3YVFcp5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: add Renesas R8A77980 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 31, 2018 at 8:59 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add a configuration option for the R-Car V3H (R8A77980) SoC.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
