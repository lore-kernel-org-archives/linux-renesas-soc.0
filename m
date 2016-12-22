Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [RFC/PATCH] linux/kernel.h: Fix DIV_ROUND_CLOSEST to support
 negative divisors
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
References: <20161222102217.29011-1-niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a79e35da-a39c-46e4-8bb5-58136374a594@roeck-us.net>
Date: Thu, 22 Dec 2016 06:48:32 -0800
MIME-Version: 1.0
In-Reply-To: <20161222102217.29011-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/22/2016 02:22 AM, Niklas Söderlund wrote:
> Add support to DIV_ROUND_CLOSEST for negative divisors if both dividend
> and divisor variable types are signed. This should not alter current
> behavior for users of the macro as previously negative divisors where
> not supported.
>
> Before:
>
> DIV_ROUND_CLOSEST(  59,  4) =  15
> DIV_ROUND_CLOSEST(  59, -4) = -14
> DIV_ROUND_CLOSEST( -59,  4) = -15
> DIV_ROUND_CLOSEST( -59, -4) =  14
>
> After:
>
> DIV_ROUND_CLOSEST(  59,  4) =  15
> DIV_ROUND_CLOSEST(  59, -4) = -15
> DIV_ROUND_CLOSEST( -59,  4) = -15
> DIV_ROUND_CLOSEST( -59, -4) =  15
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>
> Hi,
>
> While working on a thermal driver I encounter a scenario where the
> divisor could be negative, instead of adding local code to handle this I
> though I first try to add support for this in DIV_ROUND_CLOSEST.
>
> Maybe there is a reason why this is not already supported? If so please
> let me know and I can do something locally in the driver and sorry for
> the noise.
>

Only reason is that I could not figure out a way to make it work.
LGTM except for nitpick.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

>  include/linux/kernel.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index bc6ed52a39b9..f1b2f7e1b2f0 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -95,16 +95,18 @@
>  )
>
>  /*
> - * Divide positive or negative dividend by positive divisor and round
> - * to closest integer. Result is undefined for negative divisors and
> - * for negative dividends if the divisor variable type is unsigned.
> + * Divide positive or negative dividend by positive or negative divisor
> + * and round to closest integer. Result is undefined for negative
> + * divisors if dividends variable type is unsigned and for negative

s/dividends/the dividend/

> + * dividends if the divisor variable type is unsigned.
>   */
>  #define DIV_ROUND_CLOSEST(x, divisor)(			\
>  {							\
>  	typeof(x) __x = x;				\
>  	typeof(divisor) __d = divisor;			\
>  	(((typeof(x))-1) > 0 ||				\
> -	 ((typeof(divisor))-1) > 0 || (__x) > 0) ?	\
> +	 ((typeof(divisor))-1) > 0 ||			\
> +	 (((__x) > 0) == ((__d) > 0))) ?		\
>  		(((__x) + ((__d) / 2)) / (__d)) :	\
>  		(((__x) - ((__d) / 2)) / (__d));	\
>  }							\
>
