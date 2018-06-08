Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56548 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751178AbeFHIBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 04:01:50 -0400
Date: Fri, 8 Jun 2018 10:01:47 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add secondary CA53 CPU
 core
Message-ID: <20180608080146.akpbrzbb3tnpi7fi@verge.net.au>
References: <1528219033-28788-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528219033-28788-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 05, 2018 at 07:17:13PM +0200, Geert Uytterhoeven wrote:
> Add a device node for the second Cortex-A53 CPU core on the Renesas
> R-Car E3 (r8a77990) SoC, and adjust the interrupt delivery masks for ARM
> Generic Interrupt Controller and Architectured Timer.
> 
> Based on a patch in the BSP by Takeshi Kihara.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note that the PSCI implementation on Ebisu may be a preliminary version
> with some familiar quirks:
>   - SMP bringup works, and both CPUs can be used,
>   - CPU1 can be offlined, but trying to bring it online again crashes
>     the system.
> 
> I'm confident this will be fixed in future firmware versions, just like
> on H3/Salvator-X.

Thanks Geert, applied.
