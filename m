Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34804 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751192AbcLSIij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 03:38:39 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        joro@8bytes.org, geert+renesas@glider.be
Subject: Re: [PATCH v2 02/02] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
Date: Mon, 19 Dec 2016 10:39:06 +0200
Message-ID: <5954981.2Wsi8xXc7F@avalon>
In-Reply-To: <4878065.dMXMQ9htQo@avalon>
References: <148211397261.8020.4659661835061990009.sendpatchset@little-apple> <148211399048.8020.7153630286323992170.sendpatchset@little-apple> <4878065.dMXMQ9htQo@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Monday 19 Dec 2016 09:51:44 Laurent Pinchart wrote:
> On Monday 19 Dec 2016 11:19:50 Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> > 
> > Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.
> 
> I assume you have verified that hooking up a disabled IOMMU doesn't
> adversely affect system operation.

I saw in a reply to v1 that you have verified this on top of the renesas-
drivers tree, so I give it a try on mainline. The DMAC devices get probed 
properly and dmatest completes without failures.

> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > ---
> > 
> >  Changes from V1:
> >  - None
> >  
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)

-- 
Regards,

Laurent Pinchart
