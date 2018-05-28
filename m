Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56738 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754090AbeE1JjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:39:21 -0400
Date: Mon, 28 May 2018 11:39:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 00/16] R-Car DU: Convert LVDS code to bridge driver
Message-ID: <20180528093916.dmju4nuvvqrsbeaj@verge.net.au>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
 <4836167.5WJIe64jjV@avalon>
 <20180525101319.icwp2uzqucrgjynu@verge.net.au>
 <1527247074.On16LTaIee@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527247074.On16LTaIee@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 25, 2018 at 01:23:53PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Friday, 25 May 2018 13:13:20 EEST Simon Horman wrote:
> > On Thu, May 24, 2018 at 11:00:52AM +0300, Laurent Pinchart wrote:
> > > On Wednesday, 21 February 2018 18:39:25 EEST Simon Horman wrote:
> > >> On Wed, Feb 21, 2018 at 01:10:30AM +0200, Laurent Pinchart wrote:
> 
> [snip]
> 
> > >>> Laurent Pinchart (11):
> > >>>   dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
> > >>>   dt-bindings: display: renesas: Deprecate LVDS support in the DU
> > >>>     bindings
> > >>>   drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
> > >>>   drm: rcar-du: Convert LVDS encoder code to bridge driver
> > >>>   ARM: dts: r8a7790: Convert to new LVDS DT bindings
> > >>>   ARM: dts: r8a7791: Convert to new LVDS DT bindings
> > >>>   ARM: dts: r8a7792: Convert to new DU DT bindings
> > >>>   ARM: dts: r8a7793: Convert to new LVDS DT bindings
> > >>>   ARM: dts: r8a7794: Convert to new DU DT bindings
> > >>>   arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
> > >>>   arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings
> > >> 
> > >> I have marked the dts patches above as deferred as they depend
> > >> on the driver changes not to cause a regression. Please repost them
> > >> or otherwise ping me once the driver dependencies are present in an rc
> > >> release.
> > > 
> > > The driver changes have made it to v4.17-rc1. Is it too late for v4.18 ?
> > 
> > Unfortunately it is. Shall I apply them for v4.19?
> 
> Please do.

Hi Laurent,

I'm sorry to have to ask this, but in the light of Olof Johansson's recent
comments in ("Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.18")
please consider squashing the DTS patches and reposting.
