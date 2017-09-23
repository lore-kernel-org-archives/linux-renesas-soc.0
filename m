Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38116 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbdIWLF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Sep 2017 07:05:27 -0400
Received: by mail-wr0-f195.google.com with SMTP id p37so1792326wrb.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Sep 2017 04:05:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170922213634.084486879@cogentembedded.com>
References: <20170922213634.084486879@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 23 Sep 2017 13:05:25 +0200
Message-ID: <CAMuHMdVwh+G37vWh2qyPbyRjkkv0CfjDR7aATfXP5R7ABvVVdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable R8A77970 SoC
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 22, 2017 at 11:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Enable the Renesas R-Car V3M (R8A77970) SoC in the ARM64 defconfig.
>
> Suggested-by: Simon Horman <horms@verge.net.au>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
