Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43234 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752360AbdLDKAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 05:00:49 -0500
MIME-Version: 1.0
In-Reply-To: <20171128202105.552196002@cogentembedded.com>
References: <20171128202105.552196002@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2017 11:00:48 +0100
Message-ID: <CAMuHMdW9arTM-JKimPgo3jJ3pQdGG2a1k1wpm2wRKYPGP=aJNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: use CPG core clock macros
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 9:15 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Now that the commit ecadea00f588 ("dt-bindings: clock: Add R8A77970 CPG
> core clock definitions") has hit Linus' tree, we  can replace the bare
> numbers (we had to use to avoid a cross tree dependency) with these macro
> definitions...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
