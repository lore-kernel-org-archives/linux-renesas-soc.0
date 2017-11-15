Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:47510 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753381AbdKOQwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:52:30 -0500
MIME-Version: 1.0
In-Reply-To: <1510146540-31881-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1510146540-31881-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2017 17:52:29 +0100
Message-ID: <CAMuHMdWLXyj=WaeacPpOohP0Th2Puwszri4t4YjNgceTuBcU5Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: add dr_mode property for USB2.0
 channel 0
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 8, 2017 at 2:09 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> ULCB-KF has a USB2.0 dual-role channel (CN13).
> This adds dr_mode property for USB2.0 channel 0 (EHCI/OHCI and HS-USB)
> as "otg".
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
