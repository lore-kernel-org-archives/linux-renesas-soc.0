Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f175.google.com ([209.85.213.175]:35525 "EHLO
        mail-yb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbdAYJaX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 04:30:23 -0500
Received: by mail-yb0-f175.google.com with SMTP id f67so1540127ybc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 01:30:23 -0800 (PST)
Subject: Re: [PATCH] drivers: firmware: psci: Use __pa_symbol for cpu_resume
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <1485271819-2977-1-git-send-email-geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
From: Laura Abbott <labbott@redhat.com>
Message-ID: <7231fdec-7582-b330-fa8d-db194effa622@redhat.com>
Date: Wed, 25 Jan 2017 10:30:16 +0100
MIME-Version: 1.0
In-Reply-To: <1485271819-2977-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/24/2017 04:30 PM, Geert Uytterhoeven wrote:
> If CONFIG_DEBUG_VIRTUAL=y, during s2ram:
>
>     virt_to_phys used for non-linear address: ffffff80085db280 (cpu_resume+0x0/0x20)
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 1628 at arch/arm64/mm/physaddr.c:14 __virt_to_phys+0x28/0x60
>     ...
>     [<ffffff800809abb4>] __virt_to_phys+0x28/0x60
>     [<ffffff80084a0c38>] psci_system_suspend+0x20/0x44
>     [<ffffff8008095b28>] cpu_suspend+0x3c/0x68
>     [<ffffff80084a0b48>] psci_system_suspend_enter+0x18/0x20
>     [<ffffff80080ea3e0>] suspend_devices_and_enter+0x3f8/0x7e8
>     [<ffffff80080ead14>] pm_suspend+0x544/0x5f4
>
> Fixes: 1a08e3d9e0ac4577 ("drivers: firmware: psci: Use __pa_symbol for kernel symbol")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
> index 66a8793f3b3793ff..493a56a4cfc4a836 100644
> --- a/drivers/firmware/psci.c
> +++ b/drivers/firmware/psci.c
> @@ -419,7 +419,7 @@ int psci_cpu_suspend_enter(unsigned long index)
>  static int psci_system_suspend(unsigned long unused)
>  {
>  	return invoke_psci_fn(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND),
> -			      virt_to_phys(cpu_resume), 0, 0);
> +			      __pa_symbol(cpu_resume), 0, 0);
>  }
>
>  static int psci_system_suspend_enter(suspend_state_t state)
>

(thought I sent this yesterday but SMTP was not set correctly)

Acked-by: Laura Abbott <labbott@redhat.com>
