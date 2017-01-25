Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f173.google.com ([209.85.213.173]:33642 "EHLO
        mail-yb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbdAYJaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 04:30:05 -0500
Received: by mail-yb0-f173.google.com with SMTP id w194so107883791ybe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 01:30:05 -0800 (PST)
Subject: Re: [PATCH] arm64: Use __pa_symbol for empty_zero_page
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <1485258220-21916-1-git-send-email-geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
From: Laura Abbott <labbott@redhat.com>
Message-ID: <ce01d0cb-79a2-def8-8de0-d4ca3980e8e8@redhat.com>
Date: Wed, 25 Jan 2017 10:30:00 +0100
MIME-Version: 1.0
In-Reply-To: <1485258220-21916-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/24/2017 12:43 PM, Geert Uytterhoeven wrote:
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
>

(thought I sent this yesterday but SMTP was not set correctly)

Acked-by: Laura Abbott <labbott@redhat.com>
