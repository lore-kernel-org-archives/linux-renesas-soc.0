Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Date: Fri, 12 Jan 2018 12:59:53 +0000
Message-ID: <KL1PR06MB170210E1BF374BF5FC05531CB8170@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> Subject: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS enco=
der
> DT bindings
>
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
>
> Signed-off-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,lvds.txt       | 54
> ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvd=
s.txt
> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> new file mode 100644
> index 000000000000..459c56822eda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,54 @@
> +Renesas R-Car LVDS Encoder
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas
> +R-Car Gen2 and Gen3 SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> +encoders

Typo. It should be R8A7743 .

Regards,
Biju




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
