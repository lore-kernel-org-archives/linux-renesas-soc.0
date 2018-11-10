Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbeKJSfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Nov 2018 13:35:30 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI doesn't work on ULCB board
Date: Sat, 10 Nov 2018 10:51:30 +0200
Message-ID: <2882874.cFkjQ8NM4n@avalon>
In-Reply-To: <87o9azj8tq.wl-kuninori.morimoto.gx@renesas.com>
References: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com> <87k1loe8j4.wl-kuninori.morimoto.gx@renesas.com> <87o9azj8tq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Friday, 9 November 2018 04:23:36 EET Kuninori Morimoto wrote:
> Hi Laurent
> 
> >>> I tried to reproduce the problem, starting with drm-next which seems
> >>> to work fine, moving to renesas-drivers-2018-10-09-v4.19-rc7 which
> >>> also didn't exhibit any issue. I then used your kernel configuration,
> >>> and got a WARN_ON \o/
> >> 
> >> Investigations revealed that you're missing the CONFIG_COMMON_CLK_VC5=y
> >> option in your kernel configuration. It also revealed a bug in the
> >> error handling code of the DU driver, for which I have just sent
> >> "[PATCH] drm: rcar-du: Fix external clock error checks".
> > 
> > Thanks !!
> > I tried your posted patch, and it solved Oops issue,
> > and CONFIG_COMMON_CLK_VC5 solved HDMI outputs !!
> 
> Hmm...
> 
> I noticed Salvator can't boot if .config has CONFIG_COMMON_CLK_VC5.
> This means, Salvator and ULCB can't use same binary so far for me
> (= all modules are =y on .config).
> I'm using previous attached .config + your patch + CONFIG_COMMON_CLK_VC5
> 
> Kernel will stop here on Salvator
> 
> -----------------
> ....
> rcar-fcp fe9af000.fcp: ignoring dependency for device, assuming no driver
> rcar-fcp fe9bf000.fcp: ignoring dependency for device, assuming no driver
> rcar-fcp fea27000.fcp: ignoring dependency for device, assuming no driver
> rcar-fcp fea2f000.fcp: ignoring dependency for device, assuming no driver
> rcar-fcp fea37000.fcp: ignoring dependency for device, assuming no driver
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] No driver support for vblank timestamp query.
> 
> 	** stop here **

I'm afraid I can't reproduce this. I checked out renesas-drivers-2018-10-09-
v4.19-rc7, applied the fix I've submitted, took your configuration, enabled 
CONFIG_COMMON_CLK_VC5, and my Salvator-XS H3 boots fine.

-- 
Regards,

Laurent Pinchart
