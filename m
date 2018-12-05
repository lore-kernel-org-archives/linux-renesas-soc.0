Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36466 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727679AbeLETrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 14:47:39 -0500
Date: Wed, 5 Dec 2018 11:47:36 -0800
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
Message-ID: <20181205194735.k4qczn2q6shhna2l@verge.net.au>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181125144031.4407-5-laurent.pinchart+renesas@ideasonboard.com>
 <8308294.3zTFQA3UeO@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8308294.3zTFQA3UeO@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Dec 04, 2018 at 06:57:10PM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> Could you please consider taking this patch in your tree ? It's independent 
> from the rest of the series.

sure, applied for v4.21.

> 
> On Sunday, 25 November 2018 16:40:30 EET Laurent Pinchart wrote:
> > Add the backlight device for the LVDS1 output, in preparation for panel
> > support.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../arm64/boot/dts/renesas/r8a77995-draak.dts | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index
> > 2405eaad0296..cd067319e6f3 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > @@ -24,6 +24,17 @@
> >  		stdout-path = "serial0:115200n8";
> >  	};
> > 
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pwm1 0 50000>;
> > +
> > +		brightness-levels = <256 128 64 16 8 4 0>;
> > +		default-brightness-level = <6>;
> > +
> > +		power-supply = <&reg_12p0v>;
> > +		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> >  	composite-in {
> >  		compatible = "composite-video-connector";
> > 
> > @@ -104,6 +115,15 @@
> >  		regulator-always-on;
> >  	};
> > 
> > +	reg_12p0v: regulator1 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "D12.0V";
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +	};
> > +
> >  	vga {
> >  		compatible = "vga-connector";
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
