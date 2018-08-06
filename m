Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:47042 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbeHFRat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 13:30:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id l16-v6so9325493lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 08:21:13 -0700 (PDT)
Subject: Re: [PATCH 11/14] dt-bindings: can: rcar_can: document r8a77965 can
 support
To: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-12-erosca@de.adit-jv.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4cc3afe1-199c-3a15-9525-d2498299e4b6@cogentembedded.com>
Date: Mon, 6 Aug 2018 18:21:09 +0300
MIME-Version: 1.0
In-Reply-To: <20180804231114.21420-12-erosca@de.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 08/05/2018 02:11 AM, Eugeniu Rosca wrote:

> After adding CAN support to arch/arm64/boot/dts/renesas/r8a77965.dtsi,
> checkpatch complained that the new compatible string
> "renesas,can-r8a77965" is not documented. Fix the warning.
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> index 94a7f33ac5e9..23264451a5a4 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
[...]
> @@ -28,9 +29,8 @@ Required properties:
>  - pinctrl-0: pin control group to be used for this controller.
>  - pinctrl-names: must be "default".
>  
> -Required properties for "renesas,can-r8a7795" and "renesas,can-r8a7796"
> -compatible:
> -In R8A7795 and R8A7796 SoCs, "clkp2" can be CANFD clock. This is a div6 clock
> +Required properties for compatibles [A], [B] and [C]:

   I'd suggest to avoid the footnotes:

Required properties for compatibles R8A7795, R8A7796, and R8A77965:

> +For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock
>  and can be used by both CAN and CAN FD controller at the same time. It needs to
>  be scaled to maximum frequency if any of these controllers use it. This is done
>  using the below properties:
[...]

MBR, Sergei
