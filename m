Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751340AbdH3HvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 03:51:08 -0400
Date: Wed, 30 Aug 2017 09:51:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] ARM: Add definition for monitor mode
Message-ID: <20170830075103.GN10398@verge.net.au>
References: <1500387987-9240-1-git-send-email-geert+renesas@glider.be>
 <1500387987-9240-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500387987-9240-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 04:26:25PM +0200, Geert Uytterhoeven wrote:
> <asm/ptrace.h> provides *_MODE definitions for the various processor
> modes, but monitor mode was missing.
> 
> Add MON_MODE to avoid code using the hardcoded value.
> 
> Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> ARM maintainers: Please provide your ack, as this is a dependency for a
> mach-shmobile patch.
> 
> v2:
>   - New.
> ---
>  arch/arm/include/uapi/asm/ptrace.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
> index 5af0ed1b825a2aa9..70ff6bf489f31193 100644
> --- a/arch/arm/include/uapi/asm/ptrace.h
> +++ b/arch/arm/include/uapi/asm/ptrace.h
> @@ -53,6 +53,7 @@
>  #endif
>  #define FIQ_MODE	0x00000011
>  #define IRQ_MODE	0x00000012
> +#define MON_MODE	0x00000016
>  #define ABT_MODE	0x00000017
>  #define HYP_MODE	0x0000001a
>  #define UND_MODE	0x0000001b

Coming back to this after somewhat of a hiatus.
It seems that we are still waiting on an Ack to allow this
series to proceed.
