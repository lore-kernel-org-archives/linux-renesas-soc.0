Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:51604 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730688AbeKGBFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 20:05:44 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI doesn't work on ULCB board
Date: Tue, 06 Nov 2018 17:40:06 +0200
Message-ID: <11422106.UDNRqNEHC1@avalon>
In-Reply-To: <2572640.8aYrqOtQfk@avalon>
References: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com> <2572640.8aYrqOtQfk@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tuesday, 6 November 2018 16:30:35 EET Laurent Pinchart wrote:
> On Thursday, 18 October 2018 05:12:14 EET Kuninori Morimoto wrote:
> > Hi Vladimir, Laurent
> > 
> > I'm testing ULCB board, and I noticed that HDMI doen't work on it.
> > 
> > 	- Sometimes kernel panic happen (I lost log, but it said "get crc"
> > 
> > something error), - Often, kernel doesn't boot with below log if I
> > connected HDMI cable when booting
> > 
> > 	- Monitor say "No signal" if I connected cable *after* booting
> > 
> > I'm using Geert's renesas-drivers-2018-10-09-v4.19-rc7 branch.
> > It seems salvator HDMI is working correctly on it.
> > I attached my .config
> 
> I tried to reproduce the problem, starting with drm-next which seems to work
> fine, moving to renesas-drivers-2018-10-09-v4.19-rc7 which also didn't
> exhibit any issue. I then used your kernel configuration, and got a WARN_ON
> \o/

Investigations revealed that you're missing the CONFIG_COMMON_CLK_VC5=y option 
in your kernel configuration. It also revealed a bug in the error handling 
code of the DU driver, for which I have just sent "[PATCH] drm: rcar-du: Fix 
external clock error checks".

-- 
Regards,

Laurent Pinchart
