Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23093 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753833AbeDMBMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 21:12:36 -0400
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="UTF-8"
Message-id: <5AD0032E.6020103@samsung.com>
Date: Fri, 13 Apr 2018 10:09:02 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] extcon: int3496: use proper GPIO include
In-reply-to: <20180410124302.29932-1-wsa+renesas@sang-engineering.com>
References: <CGME20180410124315epcas5p39971522b55337b5c1369883f128ff43c@epcas5p3.samsung.com>
        <20180410124302.29932-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 2018년 04월 10일 21:43, Wolfram Sang wrote:
> Since commit eca0f13c836a ("extcon: int3496: Ignore incorrect
> IoRestriction for ID pin"), the driver doesn't use GPIOF_* flags
> anymore. We can thus now drop the deprecated include file for GPIO and
> use the new one.

Looks good to me. But, you need to send stable mailing list
and add 'Fixes' tag on v2.

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Compile tested only.
> 
> @linusw: one more gone
> 
>  drivers/extcon/extcon-intel-int3496.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
> index acaccb128fc4..fd24debe58a3 100644
> --- a/drivers/extcon/extcon-intel-int3496.c
> +++ b/drivers/extcon/extcon-intel-int3496.c
> @@ -20,7 +20,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/extcon-provider.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
