Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1519667836-31330-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1519667836-31330-1-git-send-email-jacopo+renesas@jmondi.org> <1519667836-31330-2-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 19:16:38 +0100
Message-ID: <CAMuHMdWM4-pisr+Yg4FABf0RnY_=2hnCvsmKYdUVe+FwM0T+rQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] arm64: dts: renesas: salvator-common: Override
 EtherAVB phy-mode
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org, netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 26, 2018 at 6:57 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> As the PHY interface installed on the Salvator-X[S] board, provides TX
> channel delay, make the "phy-mode" property a board-specific one, meant
> to override the one specified in the SoC DTSI.
>
> Follow up patches will reset the SoC DTSI to use "rgmii" mode and let
> the board file override that.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
