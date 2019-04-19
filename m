Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10283C282E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 23:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A449D2171F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 23:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f68TGReb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbfDSXbB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 19:31:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43402 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfDSXbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 19:31:01 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B9FF2F3;
        Sat, 20 Apr 2019 01:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555716658;
        bh=iMPF8XrXM0zwxZUdk7LstrzBwNMNzjWVy/2MwqaHGvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f68TGRebhBAcvEN4am4Wo4kby6dm6BMsiWkEktQBcHIn1NtvRuaEjHiQCWF+jsKMY
         nI0MkJTrm8inxBwG0FwgGeBhNxJ7sHtQ73MfD47dpysWhRztCVwqk91+JKS+sLpnqH
         mY3n9rhpKd3n2JDPGqnq+KWsDyu7N2wCjPbrowqg=
Date:   Sat, 20 Apr 2019 02:30:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: draak: Remove unecessary index from
 vin4 port
Message-ID: <20190419233049.GA6250@pendragon.ideasonboard.com>
References: <20190313105118.23245-1-horms+renesas@verge.net.au>
 <20190313134628.GB24848@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190313134628.GB24848@bigcity.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Mar 13, 2019 at 02:46:28PM +0100, Niklas Söderlund wrote:
> On 2019-03-13 11:51:18 +0100, Simon Horman wrote:
> > The ports node of vin4 only has one sub-node and thus does
> > not need #address-cells/#size-cells and the sub-node does
> > not need an exit.
> 
> I agree that the warning should be silenced however I have a feeling 
> this might need to be tested. The VIN bindings assigns special meaning 
> to which port reg an endpoint is described in and handles each of them 
> differently, see the biding documentation.
> 
> As the single port described here is port 0 I think removing the reg 
> property will probably work but is it correct? If someone with a Draak 
> board could test this patch it would be great!

I've tested this patch, and the media-ctl -p output is identical before
and after applying it.

# media-ctl -p -d /dev/media2
Media controller API version 5.1.0

Media device information
------------------------
driver          rcar_vin
model           renesas,vin-r8a77995
serial
bus info        platform:e6ef4000.video
hw revision     0x0
driver version  5.1.0

Device topology
- entity 1: adv7180 0-0020 (1 pad, 1 link)
            type V4L2 subdev subtype Decoder flags 0
            device node name /dev/v4l-subdev6
        pad0: Source
                [fmt:UYVY8_2X8/720x240 field:alternate]
                -> "VIN4 output":0 []

- entity 5: VIN4 output (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video5
        pad0: Sink
                <- "adv7180 0-0020":0 []


Please let me know if I should conduct other tests.

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > This addresses the following warning:
> > 
> >  # make dtbs W=1
> >  ...
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts:492.8-503.4: Warning (graph_child_address): /soc/video@e6ef4000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> > 
> > Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
> > Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> >  Developed on top of renesas-devel-20190308-v5.0
> >  Compile tested only
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > index 244b0dda03ed..8fba6cde5905 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > @@ -490,12 +490,7 @@
> >  	status = "okay";
> >  
> >  	ports {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		port@0 {
> > -			reg = <0>;
> > -
> > +		port {
> >  			vin4_in: endpoint {
> >  				remote-endpoint = <&adv7180_out>;
> >  			};

-- 
Regards,

Laurent Pinchart
