Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:32787 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdIKOio (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2017 10:38:44 -0400
MIME-Version: 1.0
In-Reply-To: <20170908213418.823028011@cogentembedded.com>
References: <20170908213418.823028011@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2017 16:38:43 +0200
Message-ID: <CAMuHMdUy_UGZsa87e-=SuYutt5sXd4ZTiZKLfLGfD2css3RPcw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Renesas R8A77970 CPG/MSSR clock support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 8, 2017 at 11:34 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>    Here's the set of 2 patches against the 'clk-next' branch of CLK group's
> 'linux.git' repo.

Thank you, looks good!

> As the DT patches in the R8A77970/Eagle board support series
> depend on the patch #1 of this series, it might make sense to merge this patch
> to the 'renesas.git' repo as well...
>
> [1/2] dt-bindings: clock: add R8A77970 CPG core clock definitions

The modern way to avoid this dependency is to use hardcoded numbers in
the initial submission of the DTS, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=arm64-dt-for-v4.15&id=d917e0b24811eadeba419ba7318b967ee15933b3

After the definitions have hit upstream, you can replace the hardcoded
numbers by symbols, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/r8a77995-integration&id=d3f6987db28a4657bf3304eeeb8e2cd8dd510ad0
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/r8a77995-integration&id=81426223583d5575767c77684be28c40034785bd

So I don't think Simon will merge the core clock definitions patch, unless
you plan to submit a full DTS describing the whole SoC in the initial
submissiong.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
