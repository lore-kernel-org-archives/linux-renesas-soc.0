Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:41581 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752919AbeBEPBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 10:01:25 -0500
MIME-Version: 1.0
In-Reply-To: <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2018 16:01:22 +0100
Message-ID: <CAMuHMdXNoeG7r0knw8Rc=nA2hJpHJDi3JSx_eci=KoiHdBmQrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: add R8A77980 CPG core clock definitions
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 31, 2018 at 9:27 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by the device tree sources to reference the R8A77980
> CPG core clocks by index. The data come from the table 8.2e of the R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
> however I had to add the Z2 clock which is somehow present only on the
> figure 8.1e...
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
