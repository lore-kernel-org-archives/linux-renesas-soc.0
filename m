Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43248 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbeLDQ2M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 11:28:12 -0500
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <CAMuHMdX-kqoVRs-VouhwEwv+gHmUsyHcUH9iyAaZyRQE-VWJ9A@mail.gmail.com>
 <TY1PR01MB15623456678425BFE93461568AAF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15623456678425BFE93461568AAF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 17:27:58 +0100
Message-ID: <CAMuHMdWwjbVYAd6no50eiZVM=yRGZ_4ATQkaSk5d7T52w-Om7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Tue, Dec 4, 2018 at 5:25 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Besides, this board will only boot as XIP_KERNEL which is an impossible
> configuration in the mainline kernel, so this .dts file is mostly for
> checking the .dtsi file.

Let's hope we can fix that anytime soon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
