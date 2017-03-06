Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43040 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752620AbdCFI6H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 03:58:07 -0500
Date: Mon, 6 Mar 2017 09:58:01 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2] arm64: dts: r8a7795: salvator-x: Set drive-strength
 for ravb pins
Message-ID: <20170306085801.GF11468@verge.net.au>
References: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
 <20161208133137.GE7150@verge.net.au>
 <20170305232818.GA20587@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170305232818.GA20587@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 06, 2017 at 12:28:18AM +0100, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2016-12-08 14:31:38 +0100, Simon Horman wrote:
> > On Mon, Dec 05, 2016 at 06:43:10PM +0100, Niklas Söderlund wrote:
> > > The EthernetAVB should not depend on the bootloader to setup correct
> > > drive-strength values. Values for drive-strength where found by
> > > examining the registers after the bootloader has configured the
> > > registers and successfully used the EthernetAVB.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > I believe this patch has run-time dependencies on PFC patches and will
> > result in a regression without them. Please resubmit or otherwise ping me
> > once chose changes are present in an (rc) release or immutable branch.
> 
> The dependency for this DT change is now present in v4.11-rc1, see 1. If 
> it's convenient for you feel free to pick up this patch.
> 
> 1. b25719eb938eb39a ("pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO 
>    and MII pins")

Thanks Niklas,

I am in the process of rebasing my branches on top of v4.11-rc1
and I have queued up this patch. It should appear in the next push
of renesas-next and renesas-revel.
