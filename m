Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45608 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751661AbdISL16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 07:27:58 -0400
Date: Tue, 19 Sep 2017 13:27:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/12] ARM: dts: renesas: Update DTS for CMT DT
 binding rework
Message-ID: <20170919112737.GF7933@verge.net.au>
References: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 18, 2017 at 03:48:23PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series updates the CMT device nodes in the various Renesas DTS
> files sh_cmt clocksource driver for the recent DT binding rework that was
> merged in v4.14-rc1.
> 
> This series is an evolutionary improvement of Magnus Damm's series "[PATCH
> v2 00/11] clocksource: sh_cmt: DT binding rework V2".
> It complements Magnus' series "[PATCH v3 00/06] clocksource: sh_cmt: DT 
> binding rework V3" and "[PATCH v4 00/06] clocksource: sh_cmt: DT binding 
> rework V4", which included DT binding updates only.
> 
>   - Patches 1-5 update the compatible values for the CMT0 and CMT1 device
>     nodes on R-Mobile APE6 and R-Car Gen2,
>   - Patches 6-12 remove the now obsolete "renesas,channels-mask" properties
>     from the CMT device nodes on all affected SoCs.
> 
> Changes compared to v2:
>   - Take over from Magnus,
>   - Update compatible values,
>   - Split in per-SoC patches,
> 
> Dependencies:
>   - This patch series has a runtime dependency on "[PATCH v3 0/7]
>     clocksource: sh_cmt: Update driver for DT binding rework", and thus
>     must not be applied yet,
>   - Patches were created against renesas-devel-20170918-v4.14-rc1.

Thanks, I have marked these as deferred pending acceptance of that
dependency. Please ping me once that is in place. I guess that will be
v4.16 timing.
