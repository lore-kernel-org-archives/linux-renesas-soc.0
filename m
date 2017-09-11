Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35839 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdIKK6H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2017 06:58:07 -0400
Received: by mail-lf0-f48.google.com with SMTP id d17so17525526lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2017 03:58:06 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add Renesas SoC DT bindings doc to Renesas
 ARM sections
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1505127298-4497-1-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <111a853f-41f0-83d6-6ce1-2415d3b08ad5@cogentembedded.com>
Date: Mon, 11 Sep 2017 13:58:05 +0300
MIME-Version: 1.0
In-Reply-To: <1505127298-4497-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 9/11/2017 1:54 PM, Geert Uytterhoeven wrote:

> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 28e9ab798e35b7ab..f714eea70cb1eea5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1744,6 +1744,7 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>   S:	Supported
>   F:	arch/arm64/boot/dts/renesas/
> +F:	Documentation/deviuetree/bindings/arm/shmobile.txt

    It's devicetree. :-)

>   F:	drivers/soc/renesas/
>   F:	include/linux/soc/renesas/
>   
> @@ -1863,6 +1864,7 @@ F:	arch/arm/boot/dts/sh*
>   F:	arch/arm/configs/shmobile_defconfig
>   F:	arch/arm/include/debug/renesas-scif.S
>   F:	arch/arm/mach-shmobile/
> +F:	Documentation/deviuetree/bindings/arm/shmobile.txt

    Same here.

>   F:	drivers/soc/renesas/
>   F:	include/linux/soc/renesas/
>   

MBR, Sergei
