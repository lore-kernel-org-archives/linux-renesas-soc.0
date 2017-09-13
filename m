Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38865 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdIMILc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 04:11:32 -0400
MIME-Version: 1.0
In-Reply-To: <20170912210514.517628239@cogentembedded.com>
References: <20170912210514.517628239@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 10:11:31 +0200
Message-ID: <CAMuHMdUgVX719XfgM+7gwkmrfhjc-JjqKOadFz1asNUP+6apUg@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 12, 2017 at 10:37 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by the device tree sources to reference R8A77970 SYSC
> power domains by index.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
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
