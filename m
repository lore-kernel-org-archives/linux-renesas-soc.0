Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41039 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984AbcFPFTP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 01:19:15 -0400
Date: Thu, 16 Jun 2016 14:19:11 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Obtain extal frequency from DT
Message-ID: <20160616051910.GC10590@verge.net.au>
References: <1465813777-11837-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465813777-11837-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 13, 2016 at 12:29:37PM +0200, Geert Uytterhoeven wrote:
> On some R-Car Gen2 SoCs, the frequency of the ARM architecture timer
> depends on the frequency of the external clock crystal.  Currently the
> latter is determined indirectly from the state of the mode pins, which
> is a relic predating DT.
> 
> Obtain the external clock crystal frequency from DT instead, removing
> the dependency on the mode pins.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against renesas-devel-20160613-v4.7-rc3.
> Tested on r8a7790/lager and r8a7791/koelsch.

Thanks, I have queued this up.
