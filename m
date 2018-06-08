Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60094 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751643AbeFHQt1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 12:49:27 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: renesas: Fix VSPD registers range
Date: Fri, 08 Jun 2018 19:49:43 +0300
Message-ID: <2285616.K3iSyOB0te@avalon>
In-Reply-To: <2a6247d0-6224-f2b0-b6ac-7116c8bc0cae@cogentembedded.com>
References: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com> <2a6247d0-6224-f2b0-b6ac-7116c8bc0cae@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

(CC'ing Olof)

On Friday, 8 June 2018 19:41:01 EEST Sergei Shtylyov wrote:
> On 06/08/2018 03:21 PM, Laurent Pinchart wrote:
> > The VSPD and FCPVD nodes have overlapping register ranges, as the FCPVD
> > devices are mapped in the memory range usually used by the VSP LUT and
> > CLU, which are not present in the VSPD. Fix this by shortening the VSPD
> > registers range to 0x5000.
> > 
> > Fixes: 9f8573e38a0b ("arm64: dts: renesas: r8a7795: Add VSP instances")
> > Fixes: 291e0c4994d0 ("arm64: dts: r8a7795: Add support for R-Car H3
> > ES2.0")
> > Fixes: f06ffdfbdd90 ("arm64: dts: r8a7796: Add VSP instances")
> > Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
> > Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> > Fixes: 85cb3229218a ("arm64: dts: renesas: r8a77965: Add VSP instances")
> 
> That'd be a nightmare for the -stable maintainers -- all those commits
> were made in the different time, so constant rejects are warranted.
> 
> > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Fix H3, M3-W and M3-N in addition to V3H and D3
> > - Don't touch the VSPBS instance of D3 as there's no overlap
> > - Squash all patches together
> 
>  Don't think that was a good idea in this case. Other opinions?

We have been requested ([1]) to try and group the DT changes, hence this 
change. No clear rule has been set, and this might be a case where a split is 
better. Olof, what would you prefer ?

[1] https://www.spinics.net/lists/arm-kernel/msg657208.html

-- 
Regards,

Laurent Pinchart
