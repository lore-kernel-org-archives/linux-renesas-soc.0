Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51478 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751332AbcKIHea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 02:34:30 -0500
Date: Wed, 9 Nov 2016 08:34:25 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7794: Use SYSC "always-on" PM Domain for
 sound
Message-ID: <20161109073424.GB30093@verge.net.au>
References: <1478545804-1330-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478545804-1330-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 07, 2016 at 08:10:04PM +0100, Geert Uytterhoeven wrote:
> Hook up the Audio-DMAC and sound device nodes to the SYSC "always-on" PM
> Domain, for a more consistent device-power-area description in DT.
> 
> Cfr. commit 0761ff2ad0c581f3 ("ARM: dts: r8a7794: Add SYSC PM Domains").
> 
> Fixes: 320d6c5a08a4abd3 ("ARM: dts: r8a7794: add sound support")
> Fixes: 298e4ee3d213a076 ("ARM: dts: r8a7794: add Audio-DMAC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Due to race condition between audio support and SYSC PM Domains patch
> series.

Thanks, I have queued this up.
