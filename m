Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:44068 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934301AbeAXRQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 12:16:46 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Chris Paterson" <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 4/5] dt-bindings: pwm: renesas-tpu: Document r8a774[35]
 support
Date: Wed, 24 Jan 2018 17:16:41 +0000
Message-ID: <SG2PR06MB088652C92964C6FE6959EF1FC0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
References: <1513690500-12165-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513690500-12165-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1513690500-12165-5-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Thierry,

I am sorry to bother you,  just wondering if this patch has any chance to e=
nd up in v4.16?

Thanks,
Fabrizio

> Subject: [PATCH v3 4/5] dt-bindings: pwm: renesas-tpu: Document r8a774[35=
] support
>
> Document r8a774[35] specific compatible strings. No driver change is
> needed as the fallback compatible string "renesas,tpu" activates the
> right code in the driver.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> * No change
>
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
> b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
> index 1aadc80..16e5748 100644
> --- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
> +++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
> @@ -5,8 +5,10 @@ Required Properties:
>    - compatible: should be one of the following.
>      - "renesas,tpu-r8a73a4": for R8A77A4 (R-Mobile APE6) compatible PWM =
controller.
>      - "renesas,tpu-r8a7740": for R8A7740 (R-Mobile A1) compatible PWM co=
ntroller.
> +    - "renesas,tpu-r8a7743": for R8A7743 (RZ/G1M) compatible PWM control=
ler.
> +    - "renesas,tpu-r8a7745": for R8A7745 (RZ/G1E) compatible PWM control=
ler.
>      - "renesas,tpu-r8a7790": for R8A7790 (R-Car H2) compatible PWM contr=
oller.
> -    - "renesas,tpu": for generic R-Car TPU PWM controller.
> +    - "renesas,tpu": for generic R-Car and RZ/G1 TPU PWM controller.
>
>    - reg: Base address and length of each memory resource used by the PWM
>      controller hardware module.
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
