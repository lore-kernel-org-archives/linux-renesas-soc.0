Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35088 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388909AbeIUViP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 17:38:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id p10-v6so12099104ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Sep 2018 08:48:46 -0700 (PDT)
Subject: Re: [PATCH net-next] dt-bindings: net: ravb: Add support for r8a7744
 SoC
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>
References: <1537539943-24712-1-git-send-email-biju.das@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <922d6b1d-764a-ad2d-6a6c-8d992f3fbe15@cogentembedded.com>
Date: Fri, 21 Sep 2018 18:48:42 +0300
MIME-Version: 1.0
In-Reply-To: <1537539943-24712-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 09/21/2018 05:25 PM, Biju Das wrote:

> Document RZ/G1N (R8A7744) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> index da249b7..3530256 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -6,6 +6,7 @@ interface contains.
>  Required properties:
>  - compatible: Must contain one or more of the following:
>        - "renesas,etheravb-r8a7743" for the R8A7743 SoC.
> +      - "renesas,etheravb-r8a7744" for the R8A7744 SoC.

   Mmm, I thought it was decided to go with the full model #s, like with R8A77470 below?

>        - "renesas,etheravb-r8a7745" for the R8A7745 SoC.
>        - "renesas,etheravb-r8a77470" for the R8A77470 SoC.
>        - "renesas,etheravb-r8a7790" for the R8A7790 SoC.

MBR, Sergei
