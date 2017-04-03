Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38412 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752371AbdDCKd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 06:33:56 -0400
Date: Mon, 3 Apr 2017 06:33:51 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: rcar-gen2: Correct parent of SSI[0-9]
 clocks
Message-ID: <20170403103350.GH31988@verge.net.au>
References: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 03, 2017 at 11:45:40AM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Morimoto-san,
> 
> The SSI-ALL gate clock is located in between the P clock and the
> individual SSI[0-9] clocks, hence the former should be listed as their
> parent.
> 
> This patch series corrects the parents in the DTSes r8a7790, r8a7791,
> and r8a7793.  The DTS for r8a7794, and the CPG/MSSR-based clock drivers
> for r8a7743, r8a7745, and r8a7795 already describe the correct parent.
> 
> Thanks!

Thanks, I have queued these up.
