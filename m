Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60701 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753077AbdHBMVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 08:21:01 -0400
Date: Wed, 2 Aug 2017 14:20:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 27/31] arm64: dts: renesas: r8a7795: Add usb companion
 property in EHCI
Message-ID: <20170802122059.GA20012@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
 <1c422b4c501ec329802a5d00f664821d3b58e11d.1501509526.git.horms+renesas@verge.net.au>
 <b18c9692-bcbf-a24b-10a9-4a79a74bcead@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b18c9692-bcbf-a24b-10a9-4a79a74bcead@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 31, 2017 at 07:40:23PM +0300, Sergei Shtylyov wrote:
> On 07/31/2017 06:03 PM, Simon Horman wrote:
> 
> >From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >
> >This patch adds the "companion" property in the EHCI ch0, ch1 and
> >ch2 nodes to wait for the usb companion controller startup at resume.
> >
> >Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >[remove ch3 node and revise the commit log]
> >Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> >Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >---
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >index d73d986039c8..7246e689b619 100644
> >--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >@@ -1583,6 +1583,7 @@
> >  			clocks = <&cpg CPG_MOD 703>;
> >  			phys = <&usb2_phy0>;
> >  			phy-names = "usb";
> >+			companion= <&ohci0>;
> >  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> >  			resets = <&cpg 703>;
> >  			status = "disabled";
> >@@ -1595,6 +1596,7 @@
> >  			clocks = <&cpg CPG_MOD 702>;
> >  			phys = <&usb2_phy1>;
> >  			phy-names = "usb";
> >+			companion= <&ohci1>;
> >  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> >  			resets = <&cpg 702>;
> >  			status = "disabled";
> >@@ -1607,6 +1609,7 @@
> >  			clocks = <&cpg CPG_MOD 701>;
> >  			phys = <&usb2_phy2>;
> >  			phy-names = "usb";
> >+			companion= <&ohci2>;
> >  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> >  			resets = <&cpg 701>;
> >  			status = "disabled";
> 
>    Looks like a space before = is missing in all 3 cases.

Thanks.

I'll post a follow-up patch for that. I don't think it warrants respinning
this pull request at this point.
