Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:36713 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbdBHV3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 16:29:44 -0500
Date: Wed, 8 Feb 2017 15:28:53 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        mark.rutland@arm.com, laurent.pinchart+renesas@ideasonboard.com,
        geert+renesas@glider.be, pawel.moll@arm.com,
        ijc+devicetree@hellion.org.uk, joro@8bytes.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, galak@codeaurora.org,
        horms+renesas@verge.net.au
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add r8a7795 DT binding
Message-ID: <20170208212853.ktjytopt6nr2azd5@rob-hp-laptop>
References: <20160229143309.28517.77269.sendpatchset@little-apple>
 <2144135.6kAFTUafxi@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2144135.6kAFTUafxi@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 03, 2017 at 04:10:30PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Monday 29 Feb 2016 23:33:09 Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> > 
> > Update the IPMMU DT binding documentation to include the r8a7795 compat
> > string as well as the "renesas,ipmmu-main" property that on r8a7795 will
> > be used to describe the topology and the relationship between the various
> > cache IPMMU instances and the main IPMMU.
> > 
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> This DT binding has been merged already, but isn't used upstream (nor in the 
> dts nor in the drivers). We plan to start using it, and I'd like to seize this 
> last opportunity to change it if needed and ask you for a review.

Looks pretty standard.

Rob
