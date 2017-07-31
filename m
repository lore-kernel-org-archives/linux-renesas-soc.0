Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0116.outbound.protection.outlook.com ([104.47.2.116]:26800
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750807AbdGaJCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 05:02:16 -0400
Subject: Re: [RFC v2 1/6] mux: include compiler.h from mux/consumer.h
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-serial@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
        laurent.pinchart@ideasonboard.com, wsa@the-dreams.de,
        robh@kernel.org, geert@linux-m68k.org, linux-i2c@vger.kernel.org
References: <1500305076-15570-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1500305076-15570-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <1a1233da-2f39-7777-1149-7a0f32a4b1d5@axentia.se>
Date: Mon, 31 Jul 2017 11:02:07 +0200
MIME-Version: 1.0
In-Reply-To: <1500305076-15570-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

This patch looks good to me. Let me know if I should feed this
through the mux subsystem or if it will take some other route.

In case someone else ends up taking it:
Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

On 2017-07-17 17:24, Ulrich Hecht wrote:
> Required for __must_check.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  include/linux/mux/consumer.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> index 5577e1b..ea96d4c 100644
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@ -13,6 +13,8 @@
>  #ifndef _LINUX_MUX_CONSUMER_H
>  #define _LINUX_MUX_CONSUMER_H
>  
> +#include <linux/compiler.h>
> +
>  struct device;
>  struct mux_control;
>  
> 
