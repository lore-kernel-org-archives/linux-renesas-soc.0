Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72F7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B2132186A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CbLIsib2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfCOMPY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:15:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50310 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbfCOMPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:15:24 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7E2E31A;
        Fri, 15 Mar 2019 13:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552652122;
        bh=6eaHJZc2fNMYbbZ692cjIjE8rvjbIvWfFCUBRHLYP5w=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=CbLIsib2sagDit1f7SqUunhvmskraIF/zRc2HuRaf5xjyANuyki3D92TeqEZspLjR
         nmC+OJSOIS246Z1BxPqanG9PbIlHGU8bQT57gAlI6amk3gg7QOWVXlM8O8vG2ETuc2
         jHLsEHbLKAmAm7NA0qtyMOe4798QB9pnNN959TCY=
Subject: Re: [PATCH v7 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-2-wsa+renesas@sang-engineering.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <11ff7419-5e6c-954d-8e25-197fb892dec8@ideasonboard.com>
Date:   Fri, 15 Mar 2019 12:15:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190313165526.28588-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On 13/03/2019 16:55, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Currently i2c_new_device and i2c_new_dummy return just NULL in error
> case although they have more error details internally. Therefore move
> the functionality into new functions returning detailed errors and
> add wrappers for compatibility with the current API.
> 
> This allows to use these functions with detailed error codes within
> the i2c core or for API extensions.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


As mentioned in 2/3, the _errptr suffix here feels a bit
'hungarian-notation', but I can see how we would want a good clear
distinction between the two types, otherwise we might see people adding
code that checks for ERR_PTR() using the non-errptr functions.

Perhaps that's not really an issue if it's caught by review, or
coccinelle though.


Aside from the function-name-bike-shedding which can be handled as you
wished/discussed in 2/3, and one small grammatical fix in a comment below:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  drivers/i2c/i2c-core-base.c | 70 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index cb6c5cb0df0b..bbca2e8bb019 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -710,7 +710,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
>  }
>  
>  /**
> - * i2c_new_device - instantiate an i2c device
> + * i2c_new_device_errptr - instantiate an i2c device
>   * @adap: the adapter managing the device
>   * @info: describes one I2C device; bus_num is ignored
>   * Context: can sleep
> @@ -723,17 +723,17 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
>   * before any i2c_adapter could exist.
>   *
>   * This returns the new i2c client, which may be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *
> -i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> +static struct i2c_client *
> +i2c_new_device_errptr(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  {
>  	struct i2c_client	*client;
>  	int			status;
>  
>  	client = kzalloc(sizeof *client, GFP_KERNEL);
>  	if (!client)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	client->adapter = adap;
>  
> @@ -799,7 +799,29 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  		client->name, client->addr, status);
>  out_err_silent:
>  	kfree(client);
> -	return NULL;
> +	return ERR_PTR(status);
> +}
> +
> +/**
> + * i2c_new_device - instantiate an i2c device
> + * @adap: the adapter managing the device
> + * @info: describes one I2C device; bus_num is ignored
> + * Context: can sleep
> + *
> + * This function has the same functionality like i2c_new_device_errptr, it just

s/like/as/


> + * returns NULL instead of an ERR_PTR in case of an error for compatibility
> + * with current I2C API.
> + *
> + * This returns the new i2c client, which may be saved for later use with
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *
> +i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> +{
> +	struct i2c_client *ret;
> +
> +	ret = i2c_new_device_errptr(adap, info);
> +	return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_device);
>  
> @@ -850,7 +872,7 @@ static struct i2c_driver dummy_driver = {
>  };
>  
>  /**
> - * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * i2c_new_dummy_errptr - return a new i2c device bound to a dummy driver
>   * @adapter: the adapter managing the device
>   * @address: seven bit address to be used
>   * Context: can sleep
> @@ -865,15 +887,37 @@ static struct i2c_driver dummy_driver = {
>   * different driver.
>   *
>   * This returns the new i2c client, which should be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
> +static struct i2c_client *
> +i2c_new_dummy_errptr(struct i2c_adapter *adapter, u16 address)
>  {
>  	struct i2c_board_info info = {
>  		I2C_BOARD_INFO("dummy", address),
>  	};
>  
> -	return i2c_new_device(adapter, &info);
> +	return i2c_new_device_errptr(adapter, &info);
> +}
> +
> +/**
> + * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * @adapter: the adapter managing the device
> + * @address: seven bit address to be used
> + * Context: can sleep
> + *
> + * This function has the same functionality like i2c_new_dummy_errptr, it just
> + * returns NULL instead of an ERR_PTR in case of an error for compatibility
> + * with current I2C API.
> + *
> + * This returns the new i2c client, which should be saved for later use with
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
> +{
> +	struct i2c_client *ret;
> +
> +	ret = i2c_new_dummy_errptr(adapter, address);
> +	return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy);
>  
> @@ -996,9 +1040,9 @@ i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
>  		info.flags |= I2C_CLIENT_SLAVE;
>  	}
>  
> -	client = i2c_new_device(adap, &info);
> -	if (!client)
> -		return -EINVAL;
> +	client = i2c_new_device_errptr(adap, &info);
> +	if (IS_ERR(client))
> +		return PTR_ERR(client);
>  
>  	/* Keep track of the added device */
>  	mutex_lock(&adap->userspace_clients_lock);
> 

