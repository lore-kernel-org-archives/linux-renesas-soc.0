Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52449 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdFUJmp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:42:45 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: renesas: r8a7796: Add HDMI encoder instance
Date: Wed, 21 Jun 2017 12:43:08 +0300
Message-ID: <2321635.06pbramJNN@avalon>
In-Reply-To: <503e58db-0a96-7ed0-bd1b-136f793f563f@cogentembedded.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com> <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com> <503e58db-0a96-7ed0-bd1b-136f793f563f@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wednesday 21 Jun 2017 12:35:11 Sergei Shtylyov wrote:
> On 6/21/2017 12:31 PM, Laurent Pinchart wrote:
> > Add the HDMI encoder to the R8A7796 DT in disabled state.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a7796.dtsi index
> > ad9cd1c3199f..25e51d20b7ef 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1532,6 +1532,31 @@
> >  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> >  		};
> > 
> > +		hdmi0: hdmi0@fead0000 {
> 
>     Why not name it just hdmi@fead0000 as required by the DT spec 0.1?

Good point, fixed in my tree. The fix will be included in my pull request, or 
in v3 if other non-trival fixes are required.

-- 
Regards,

Laurent Pinchart
