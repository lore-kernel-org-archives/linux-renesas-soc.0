Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34583 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbcEXBm4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 23 May 2016 21:42:56 -0400
Date: Tue, 24 May 2016 10:42:53 +0900
From: Simon Horman <horms@verge.net.au>
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
Message-ID: <20160524014249.GA22751@verge.net.au>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
 <1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
 <5742B66C.7080102@rvc.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5742B66C.7080102@rvc.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 23, 2016 at 02:51:08PM +0700, Khiem Nguyen wrote:
> Hi Simon, Geert,
> 
> On 5/23/2016 2:07 PM, Geert Uytterhoeven wrote:
> >On Mon, May 23, 2016 at 3:28 AM, Simon Horman
> ><horms+renesas@verge.net.au> wrote:
> >>Basic support for the Gen 3 R-Car M3-W SoC.
> >>
> >>Based on work for the r8a7795 and r8a7796 SoCs by
> >>Takeshi Kihara, Dirk Behme and Geert Uytterhoeven.
> >>
> >>Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> >>--- /dev/null
> >>+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >>@@ -0,0 +1,120 @@
> >>+       psci {
> >>+               compatible = "arm,psci-1.0";
> >
> >Do we want to use 1.0 on r8a7795, too?
> 
> I think we should apply same setting as r8a7795.
> i.e compatible = "arm,psci-0.2";
> 
> Using 1.0 will open Suspend-to-RAM support if secure firmware supports that
> feature.
> However, we might need additional work in drivers to support suspend/resume
> handlers.
> So, I suggest that we keep using 0.2 until Suspend-to-RAM feature is
> confirmed in r8a7795/r8a7796.

Sure, I will use 0.2.
