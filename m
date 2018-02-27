Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59517 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752993AbeB0KZh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 05:25:37 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 11/16] ARM: dts: r8a7791: Convert to new LVDS DT bindings
Date: Tue, 27 Feb 2018 12:26:25 +0200
Message-ID: <8228792.JG3Xuh41Ml@avalon>
In-Reply-To: <29b21328-c718-91a5-fc49-5034715f5539@cogentembedded.com>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com> <20180220231046.32638-12-laurent.pinchart+renesas@ideasonboard.com> <29b21328-c718-91a5-fc49-5034715f5539@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Friday, 23 February 2018 11:51:59 EET Sergei Shtylyov wrote:
> On 2/21/2018 2:10 AM, Laurent Pinchart wrote:
> > The internal LVDS encoder now has DT bindings separate from the DU. Port
> > the device tree over to the new model.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> [...]
> 
> > diff --git a/arch/arm/boot/dts/r8a7791.dtsi
> > b/arch/arm/boot/dts/r8a7791.dtsi index 008a260f86a5..8660f8a329c7 100644
> > --- a/arch/arm/boot/dts/r8a7791.dtsi
> > +++ b/arch/arm/boot/dts/r8a7791.dtsi
> 
> [...]
> 
> > @@ -1126,6 +1123,33 @@
> >   			port@1 {
> >   				reg = <1>;
> >   				du_out_lvds0: endpoint {
> > +					remote-endpoint = <&lvds0_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	lvds0: lvds@feb90000 {
> 
> I suggest that we use the label "lvds" w/o #, compatible with the manual...

The manual uses "LVDS" in some places (figure 25.1b or table 25.1 for 
instance) and LVDS0 in other (table 25.3 for instance). I don't think this is 
a big deal, and if we need to refer to the LVDS node by phandle, I'd rather 
use lvds0 consistently on all SoCs to make writing shared DT sources easier.

-- 
Regards,

Laurent Pinchart
