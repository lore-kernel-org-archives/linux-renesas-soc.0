Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33389 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935721AbcKWNKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 08:10:49 -0500
MIME-Version: 1.0
In-Reply-To: <1479903264-1909-1-git-send-email-chris.paterson2@renesas.com>
References: <1479903264-1909-1-git-send-email-chris.paterson2@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2016 14:10:23 +0100
Message-ID: <CAMuHMdVsj9XWUNkLTrBMKSLjy_o769j5_vOu7f+zi9pUynkP0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: r8a7796: Add CAN external clock support
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 23, 2016 at 1:14 PM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> Adds external CAN clock node for r8a7796. This clock can be used as
> fCAN clock of CAN and CAN FD controller.
>
> Based on a patch for r8a7795 by Ramesh Shanmugasundaram.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
