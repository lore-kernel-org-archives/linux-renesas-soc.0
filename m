Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 17 Feb 2016 14:58:54 +0900
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	robh@kernel.org, daniel.lezcano@linaro.org,
	linux-renesas-soc@vger.kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v3 01/06] devicetree: bindings: Remove sh7372 CMT binding
Message-ID: <20160217055854.GG11534@verge.net.au>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
 <20160216071731.25461.77388.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160216071731.25461.77388.sendpatchset@little-apple>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 16, 2016 at 04:17:31PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Remove the sh7372 CMT compat string to reduce maintenance burden.
> 
> It should be fine to break DT compatibility because:
> 1) The sh7372 SoC support has been removed from upstream
> 2) The sh7372 CMT DT binding was never part of upstream DTS
> 3) The CMT driver never matches on the sh7372 binding

A trifecta!

> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>

I'd like to join this Ack-party!

Acked-by: Simon Horman <horms+renesas@verge.net.au>
