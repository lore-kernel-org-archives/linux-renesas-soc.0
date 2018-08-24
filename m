Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38549 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbeHXTDa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 15:03:30 -0400
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so7200110ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 08:28:20 -0700 (PDT)
Date: Fri, 24 Aug 2018 17:28:18 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 1/3] i2c: refactor function to release a DMA safe buffer
Message-ID: <20180824152818.GA1493@bigcity.dyn.berto.se>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
 <20180824145246.19987-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180824145246.19987-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch.

On 2018-08-24 16:52:44 +0200, Wolfram Sang wrote:
> a) rename to 'put' instead of 'release' to match 'get' when obtaining
>    the buffer
> b) change the argument order to have the buffer as first argument
> c) add a new argument telling the function if the message was
>    transferred. This allows the function to be used also in cases
>    where setting up DMA failed, so the buffer needs to be freed without
>    syncing to the message buffer.
> 
> Also convert the only user.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/i2c/DMA-considerations | 10 +++++++---
>  drivers/i2c/busses/i2c-sh_mobile.c   |  2 +-
>  drivers/i2c/i2c-core-base.c          | 11 ++++++-----
>  include/linux/i2c.h                  |  2 +-
>  4 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/i2c/DMA-considerations b/Documentation/i2c/DMA-considerations
> index 966610aa4620..bf40f5c01d15 100644
> --- a/Documentation/i2c/DMA-considerations
> +++ b/Documentation/i2c/DMA-considerations
> @@ -50,10 +50,14 @@ bounce buffer. But you don't need to care about that detail, just use the
>  returned buffer. If NULL is returned, the threshold was not met or a bounce
>  buffer could not be allocated. Fall back to PIO in that case.
>  
> -In any case, a buffer obtained from above needs to be released. It ensures data
> -is copied back to the message and a potentially used bounce buffer is freed::
> +In any case, a buffer obtained from above needs to be released. Another helper
> +function ensures a potentially used bounce buffer is freed::
>  
> -	i2c_release_dma_safe_msg_buf(msg, dma_buf);
> +	i2c_put_dma_safe_msg_buf(dma_buf, msg, xferred);
> +
> +The last argument 'xferred' controls if the buffer is synced back to the
> +message or not. No syncing is needed in cases setting up DMA had an error and
> +there was no data transferred.
>  
>  The bounce buffer handling from the core is generic and simple. It will always
>  allocate a new bounce buffer. If you want a more sophisticated handling (e.g.
> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
> index 9c7f6f8ceb22..16c35d474398 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -515,7 +515,7 @@ static void sh_mobile_i2c_dma_callback(void *data)
>  	pd->pos = pd->msg->len;
>  	pd->stop_after_dma = true;
>  
> -	i2c_release_dma_safe_msg_buf(pd->msg, pd->dma_buf);
> +	i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, true);
>  
>  	iic_set_clr(pd, ICIC, 0, ICIC_TDMAE | ICIC_RDMAE);
>  }
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5a937109a289..4e381aeff917 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2302,21 +2302,22 @@ u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold)
>  EXPORT_SYMBOL_GPL(i2c_get_dma_safe_msg_buf);
>  
>  /**
> - * i2c_release_dma_safe_msg_buf - release DMA safe buffer and sync with i2c_msg
> - * @msg: the message to be synced with
> + * i2c_put_dma_safe_msg_buf - release DMA safe buffer and sync with i2c_msg
>   * @buf: the buffer obtained from i2c_get_dma_safe_msg_buf(). May be NULL.
> + * @msg: the message which the buffer corresponds to
> + * @xferred: bool saying if the message was transferred
>   */
> -void i2c_release_dma_safe_msg_buf(struct i2c_msg *msg, u8 *buf)
> +void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
>  {
>  	if (!buf || buf == msg->buf)
>  		return;
>  
> -	if (msg->flags & I2C_M_RD)
> +	if (xferred && msg->flags & I2C_M_RD)
>  		memcpy(msg->buf, buf, msg->len);
>  
>  	kfree(buf);
>  }
> -EXPORT_SYMBOL_GPL(i2c_release_dma_safe_msg_buf);
> +EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
>  
>  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
>  MODULE_DESCRIPTION("I2C-Bus main module");
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 36f357ecdf67..6f77708544ff 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -861,7 +861,7 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
>  }
>  
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
> -void i2c_release_dma_safe_msg_buf(struct i2c_msg *msg, u8 *buf);
> +void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
>  
>  int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr);
>  /**
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
