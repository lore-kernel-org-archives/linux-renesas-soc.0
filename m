Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36364 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbeJSViZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Oct 2018 17:38:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI doesn't work on ULCB board
Date: Fri, 19 Oct 2018 16:32:14 +0300
Message-ID: <3722468.eqoLKTHVsi@avalon>
In-Reply-To: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com>
References: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thursday, 18 October 2018 05:12:14 EEST Kuninori Morimoto wrote:
> Hi Vladimir, Laurent
> 
> I'm testing ULCB board, and I noticed that HDMI doen't work on it.

Which ULCB board is this ?

> 	- Sometimes kernel panic happen (I lost log, but it said "get crc"
> something error), - Often, kernel doesn't boot with below log if I
> connected HDMI cable when booting
> 	- Monitor say "No signal" if I connected cable *after* booting
> 
> I'm using Geert's renesas-drivers-2018-10-09-v4.19-rc7 branch.
> It seems salvator HDMI is working correctly on it.
> I attached my .config
> 
> ------ kernel log ---------
> ...
> [    1.728010] renesas_irqc e61c0000.interrupt-controller: driving 6 irqs
> [    1.739166] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.745851] [drm] No driver support for vblank timestamp query.
> [    1.787533] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.794226] [drm] No driver support for vblank timestamp query.
> [    1.821091] rcar-dmac e6700000.dma-controller: ignoring dependency for
> device, assuming no driver
> [    1.835807] rcar-dmac e7300000.dma-controller: ignoring dependency for
> device, assuming no driver
> [    1.850397] rcar-dmac e7310000.dma-controller: ignoring dependency for
> device, assuming no driver
> [    1.864799] rcar-dmac ec700000.dma-controller: ignoring dependency for
> device, assuming no driver
> [    1.879168] rcar-dmac ec720000.dma-controller: ignoring dependency for
> device, assuming no driver
> [    1.894102] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.900788] [drm] No driver support for vblank timestamp query.
> [    1.907851] ravb e6800000.ethernet: ignoring dependency for device,
> assuming no driver
> [    1.917038] libphy: ravb_mii: probed
> [    1.922342] ravb e6800000.ethernet eth0: Base address at 0xe6800000,
> 2e:09:0a:00:83:2b, IRQ 116.
> [    1.931494] rcar-fcp fe950000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.939736] rcar-fcp fe951000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.947894] rcar-fcp fe96f000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.956044] rcar-fcp fe92f000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.964206] rcar-fcp fe9af000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.972359] rcar-fcp fe9bf000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.980517] rcar-fcp fea27000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.988669] rcar-fcp fea2f000.fcp: ignoring dependency for device,
> assuming no driver
> [    1.996825] rcar-fcp fea37000.fcp: ignoring dependency for device,
> assuming no driver
> [    2.040729] rcar_sound ec500000.sound: probed
> [    2.045763] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    2.052441] [drm] No driver support for vblank timestamp query.
> 	/* here kernel stop */

I will have a look.

-- 
Regards,

Laurent Pinchart
