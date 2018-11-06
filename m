Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44374 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388509AbeKFX2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 18:28:09 -0500
Date: Tue, 6 Nov 2018 15:02:41 +0100
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: r8a77990: Add VIN and CSI-2 device
 nodes
Message-ID: <20181106140241.5q7cqlcd44rxa6be@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1710077.PM4SUf1Toz@avalon>
 <20181030101431.GG15991@w540>
 <2028792.V3DFnOZWZP@avalon>
 <20181031124812.vig3zim5ilht44m6@verge.net.au>
 <20181031131840.GL15991@w540>
 <20181031143738.w6gfnxq76mw2wqrn@verge.net.au>
 <20181105103237.GI20885@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105103237.GI20885@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 05, 2018 at 11:32:37AM +0100, jacopo mondi wrote:
> Hi Simon,
> 
> On Wed, Oct 31, 2018 at 03:37:39PM +0100, Simon Horman wrote:
> > On Wed, Oct 31, 2018 at 02:18:40PM +0100, jacopo mondi wrote:
> > > Hi Simon,
> > >
> > > On Wed, Oct 31, 2018 at 01:48:13PM +0100, Simon Horman wrote:
> > > > On Tue, Oct 30, 2018 at 02:57:59PM +0200, Laurent Pinchart wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > On Tuesday, 30 October 2018 12:14:31 EET jacopo mondi wrote:
> > > > > > On Mon, Sep 10, 2018 at 05:12:30PM +0300, Laurent Pinchart wrote:
> > > > > > > On Wednesday, 5 September 2018 18:29:43 EEST Jacopo Mondi wrote:
> > > > > > >> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > > > > > >>
> > > > > > >> Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device
> > > > > > >> tree.
> > > > > > >>
> > > > > > >> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > > > > > >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > > > >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > > >> ---
> > > > > > >>
> > > > > > >>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 79 ++++++++++++++++++++++++
> > > > > > >>  1 file changed, 79 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > > >> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index ae89260..0ae7bbe
> > > > > > >> 100644
> > > > > > >> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > > >> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > > >> @@ -337,6 +337,85 @@
> > > > > > >>
> > > > > > >>  			status = "disabled";
> > > > > > >>
> > > > > > >>  		};
> > > > > > >>
> > > > > > >> +		csi40: csi2@feaa0000 {
> > > > > > >
> > > > > > > I believe Simon would like to keep the nodes sorted by address
> > > > > > >
> > > > > > >> +			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
> > > > > > >> +			reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > >
> > > > > > > 0x10000 seems pretty large to me.
> > > > > >
> > > > > > It seems to me that all Gen3 SoC have this lenght specified
> > > > > >
> > > > > > $git grep -A 10 'csi[2|4][0|1]: csi' arch/arm64/boot/dts/renesas/ | grep reg
> > > > > > arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfea80000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfeab0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a7796.dtsi-    reg = <0 0xfea80000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a7796.dtsi-    reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77965.dtsi-   reg = <0 0xfea80000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77965.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77970.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77980.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77980.dtsi-   reg = <0 0xfeab0000 0 0x10000>;
> > > > > > arch/arm64/boot/dts/renesas/r8a77990.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
> > > > > >
> > > > > > Am I missing something?
> > > > >
> > > > > Cargo-cult programming ? :-) This will likely not hurt, but such a large
> > > > > memory area is not required, and we'll save a bit of memory if we reduce the
> > > > > mapping from 64kB to 4kB (or less)
> > > >
> > > > Can we please update this patch, and existing dtsi files,
> > > > to use an appropriately small register window?
> > > >
> > >
> > > What if we keep this one as it is and we change all the DTSIs in one
> > > go?
> >
> > I would rather we correct this patch than add it with a known problem.
> 
> Sorry, I was confused. This patch is already in v4.20.
> 
> If we want to fix this, a single follow-up patch that changes the
> memory area size for all SoCs is required.

Thanks, I was also confused.

Your proposal sounds good to me.
