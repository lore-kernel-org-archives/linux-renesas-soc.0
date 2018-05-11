Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:37133 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750722AbeEKDRP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 23:17:15 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
Date: Fri, 11 May 2018 03:17:12 +0000
Message-ID: <OSBPR01MB2293B7074A7F3169F29A08E8D89F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526008386-26420-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008386-26420-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi All,

I'm sorry I submitted this patch to incorrect addresses.
So, would you delete this?

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda, Sent: Friday, May 11, 2018 12:13 PM
>=20
> Add documentation for r8a77990 compatible string to renesas ravb device
> tree bindings documentation.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> index 890526d..fac897d 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -21,6 +21,7 @@ Required properties:
>        - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
>        - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
>        - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
> +      - "renesas,etheravb-r8a77990" for the R8A77990 SoC.
>        - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
>        - "renesas,etheravb-rcar-gen3" as a fallback for the above
>  		R-Car Gen3 devices.
> --
> 1.9.1
