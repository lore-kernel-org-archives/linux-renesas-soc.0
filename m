Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33295 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752463AbdATQVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 11:21:07 -0500
Received: by mail-lf0-f42.google.com with SMTP id k86so61149194lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2017 08:21:06 -0800 (PST)
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Add more register documentation
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
References: <1484917448-8320-1-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9d12d719-0866-a454-88e2-d51a695085cd@cogentembedded.com>
Date: Fri, 20 Jan 2017 19:21:02 +0300
MIME-Version: 1.0
In-Reply-To: <1484917448-8320-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/20/2017 04:04 PM, Geert Uytterhoeven wrote:

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 40 +++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
> index dd9ac366868f4336..6ed9aa19c4d34766 100644
> --- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
> @@ -20,14 +20,30 @@
[...]
> +static inline u32 phys_to_sbar(phys_addr_t addr)
> +{
> +	return (((addr) >> 8) & 0xfffffc00);

   It's not a macro -- innermost parens not needed...

[...]

MBR, Sergei
