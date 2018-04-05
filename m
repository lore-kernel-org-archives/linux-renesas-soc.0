Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:52764 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751195AbeDEJk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 05:40:56 -0400
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a77470
 support
To: Biju Das <biju.das@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1522318628-52821-1-git-send-email-biju.das@bp.renesas.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <45271088-4b7f-d714-d868-417a4c328fd4@arm.com>
Date: Thu, 5 Apr 2018 10:40:52 +0100
MIME-Version: 1.0
In-Reply-To: <1522318628-52821-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29/03/18 11:17, Biju Das wrote:
> Renesas RZ/G SoC have the R-Car gen2 compatible IRQC interrupt
> controllers. Document RZ/G1C (also known as R8A77470) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> index 20f121d..1d5891a 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> @@ -7,6 +7,7 @@ Required properties:
>      - "renesas,irqc-r8a73a4" (R-Mobile APE6)
>      - "renesas,irqc-r8a7743" (RZ/G1M)
>      - "renesas,irqc-r8a7745" (RZ/G1E)
> +    - "renesas,irqc-r8a77470" (RZ/G1C)
>      - "renesas,irqc-r8a7790" (R-Car H2)
>      - "renesas,irqc-r8a7791" (R-Car M2-W)
>      - "renesas,irqc-r8a7792" (R-Car V2H)
> 

Queued with Simon and Geert's RB tags.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
