Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59718 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752317AbdGJI3D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 04:29:03 -0400
Date: Mon, 10 Jul 2017 10:28:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs
 descending order
Message-ID: <20170710082857.GD13680@verge.net.au>
References: <1499393373-11514-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXVoEHNfq_-JX5dodC4cCQzDx9BFjqR-j1kBF9yJTO8bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVoEHNfq_-JX5dodC4cCQzDx9BFjqR-j1kBF9yJTO8bA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 10:08:25AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> >
> > It will be used ADG clock initial settings, and will be
> > sound codec's initial system clock which needs maximum clock frequency.
> > Thus, descending order is required.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> Cfr. commit 5e2feac330953fe7 ("arm64: renesas: salvator-common: sound
> clock-frequency needs descending order")
> 
> Fixes: 9f22774c214ada7b ("arm64: dts: ulcb: add 12288000 for sound ADG")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have applied the following as a fix for v4.13.

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs
 descending order

Correct order of sound clock frequencies for ULCB boards
used with r8a7795 and r8a7796 SoCs.

These sounds clock frequencies are used as the ADG clock (output clocks
for audio module) initial setting and sound codec's initial system clock
which needs the maximum clock frequency. Thus, descending order is
required.

Fixes: 9f22774c214ada7b ("arm64: dts: ulcb: add 12288000 for sound ADG")
Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: rewrote changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index b5c6ee07d7f9..d1a3f3b7a0ab 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -281,7 +281,7 @@
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
-	clock-frequency = <11289600 12288000>;
+	clock-frequency = <12288000 11289600>;
 
 	status = "okay";
 
-- 
2.1.4
