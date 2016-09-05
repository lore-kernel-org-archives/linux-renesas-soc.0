Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35197 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932286AbcIEJun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 05:50:43 -0400
MIME-Version: 1.0
In-Reply-To: <1994467.CVFvpbaMyF@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com> <1994467.CVFvpbaMyF@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Sep 2016 11:50:41 +0200
Message-ID: <CAMuHMdVezsJ1q0A4TCdhfEEPtnyMeXGGZxRREQucy6kr2BO=EA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7794: fix PWM clock parent
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Sep 4, 2016 at 9:55 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> When removing the non-existing thermal clock I forgot to remove its
> parent from the node's "clocks" property  -- this led to a wrong PWM
> clock's parent clock.
>
> Fixes: 2a29f9d6fea8 ("ARM: dts: r8a7794: add MSTP5 clocks")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
