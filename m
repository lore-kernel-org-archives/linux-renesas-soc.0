Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Fri, 12 Jan 2018 16:25:35 +0200
Message-ID: <5566024.kqZ0uEBjNE@avalon>
In-Reply-To: <TY1PR06MB0895E1818ED2399A0402827FC0170@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <5799121.8LYuhfmPRz@avalon> <TY1PR06MB0895E1818ED2399A0402827FC0170@TY1PR06MB0895.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Friday, 12 January 2018 16:00:31 EET Fabrizio Castro wrote:
> Hi Laurent,
> 
> > Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
> > encoder DT bindings
> > On Friday, 12 January 2018 14:59:53 EET Biju Das wrote:
> >> Hi,
> >> 
> >>> Subject: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
> >>> encoder DT bindings
> >>> 
> >>> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> >>> corresponding device tree bindings.
> >>> 
> >>> Signed-off-by: Laurent Pinchart
> >>> <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>> 
> >>>  .../bindings/display/bridge/renesas,lvds.txt       | 54 +++++++++++++++
> >>>  MAINTAINERS                                        |  1 +
> >>>  2 files changed, 55 insertions(+)
> >>>  create mode 100644
> >>> 
> >>> Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> >>> 
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> >>> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> >>> new
> >>> file mode 100644
> >>> index 000000000000..459c56822eda
> >>> --- /dev/null
> >>> +++
> >>> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> >>> @@ -0,0 +1,54 @@
> >>> +Renesas R-Car LVDS Encoder
> >>> +==========================
> >>> +
> >>> +These DT bindings describe the LVDS encoder embedded in the Renesas
> >>> +R-Car Gen2 and Gen3 SoCs.
> >>> +
> >>> +Required properties:
> >>> +
> >>> +- compatible : Shall contain one of
> >>> +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> 
> The following also needs polishing for v2:
> "(R-Car RZ/G1M)" -> "(RZ/G1M)"

I'll fix it too.

> >>> +encoders
> >> 
> >> Typo. It should be R8A7743 .
> > 
> > Oops. Will fix in v2.

-- 
Regards,

Laurent Pinchart

