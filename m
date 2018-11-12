Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbeKLNO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Nov 2018 08:14:29 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI doesn't work on ULCB board
Date: Mon, 12 Nov 2018 05:23:30 +0200
Message-ID: <2543588.B3IkU2QDWW@avalon>
In-Reply-To: <878t1z80g2.wl-kuninori.morimoto.gx@renesas.com>
References: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com> <2882874.cFkjQ8NM4n@avalon> <878t1z80g2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Monday, 12 November 2018 05:09:13 EET Kuninori Morimoto wrote:
> Hi Laurent
> 
> >> I noticed Salvator can't boot if .config has CONFIG_COMMON_CLK_VC5.
> >> This means, Salvator and ULCB can't use same binary so far for me
> >> (= all modules are =y on .config).
> >> I'm using previous attached .config + your patch + CONFIG_COMMON_CLK_VC5
> 
> (snip)
> 
> > I'm afraid I can't reproduce this. I checked out
> > renesas-drivers-2018-10-09- v4.19-rc7, applied the fix I've submitted,
> > took your configuration, enabled CONFIG_COMMON_CLK_VC5, and my
> > Salvator-XS H3 boots fine.
> 
> I'm deeply sorry, it was my fault.
> I'm using ES1.x board, but I used XS dtb

I've done worse mistakes, and many times, so I can't blame you :-) I'm glad it 
works now.

-- 
Regards,

Laurent Pinchart
