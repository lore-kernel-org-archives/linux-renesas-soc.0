Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:40966 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750721AbdAXMij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 07:38:39 -0500
Date: Tue, 24 Jan 2017 12:37:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laura Abbott <labbott@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: Use __pa_symbol for empty_zero_page
Message-ID: <20170124123617.GA7572@leverpostej>
References: <1485258220-21916-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485258220-21916-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 24, 2017 at 12:43:40PM +0100, Geert Uytterhoeven wrote:
> If CONFIG_DEBUG_VIRTUAL=y and CONFIG_ARM64_SW_TTBR0_PAN=y:
> 
>     virt_to_phys used for non-linear address: ffffff8008cc0000 (empty_zero_page+0x0/0x1000)
>     WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:14 __virt_to_phys+0x28/0x60
>     ...
>     [<ffffff800809abb4>] __virt_to_phys+0x28/0x60
>     [<ffffff8008a02600>] setup_arch+0x46c/0x4d4
> 
> Fixes: 2077be6783b5936c ("arm64: Use __pa_symbol for kernel symbols")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 669fc9ff728b227f..b5222094ab52db6f 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -298,7 +298,7 @@ void __init setup_arch(char **cmdline_p)
>  	 * faults in case uaccess_enable() is inadvertently called by the init
>  	 * thread.
>  	 */
> -	init_task.thread_info.ttbr0 = virt_to_phys(empty_zero_page);
> +	init_task.thread_info.ttbr0 = __pa_symbol(empty_zero_page);
>  #endif
>  
>  #ifdef CONFIG_VT
> -- 
> 1.9.1
> 
