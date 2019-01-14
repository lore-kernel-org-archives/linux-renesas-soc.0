Return-Path: <SRS0=Pe4N=PW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 13:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5994920657
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 13:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ZVrfqAE1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfANNG0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Jan 2019 08:06:26 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46976 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfANNGZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jan 2019 08:06:25 -0500
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so18925015ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jan 2019 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=uor43rimp1qiUh7VU3UiYHBcRjP4oYtwSHGYuSyzkes=;
        b=ZVrfqAE1CN2M4aLUpS3XwHERp3uz5yyOCScGgIWFDfwVNrMik8ghFfAGnSxkbJiU0b
         GFdi0X8CWX3ZIhm/KIIgVjlVGxqwdhIQZYrTe9Rf+QpLLqJJcQ6MsqI+Bzwtcv7WRWYy
         yx3r1AEKoPCJyy+1iHMRtlm1iOdT9eCveP1HWbONbjnQRJs2mcBlStvssTZpJy7Vjc0w
         Tz1u2giE8tmagGddPbDlBXgkSP8OtlVK71d3QUWZicWE+N3J3A717HJdST9mRXVwgZsp
         QeCo2pNgwbrbZwlGi25pRXoLh7VZARQQPcnniImJy6vRDVuOTEI4Uq6KWlg2jwPHH2MD
         gDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=uor43rimp1qiUh7VU3UiYHBcRjP4oYtwSHGYuSyzkes=;
        b=CnNlalyLdKgsUUg1mSjHdxfsmM4UnBI6M6KVCgfB4/9hfenZBjC5HumWmwDpDT06R7
         RRruZFULcc+krI1YTONrDsrrjWNJpNWewAh0lDtuZm1etkrcvWBxOcrW9dhhXTQAGkZM
         IoTXUEEvL0W7vtSb6e2smvX65pQ4X093UbwJA9O2WUNytkrXbvaNY4qhAUJcVqbtSJqA
         XHusyCvb+jBdWeQlYmKgxyWaS7ZeOmZMPPIWEue2Eyzwvv36JcTqkjOGe8M0PrGMKb5X
         aR1gNmJtweuy4bCSHeiph6vQpoYtzn60myPok4bKHKMd5PbSm3/5Cn1B8/Ld1PFknUVI
         2oZg==
X-Gm-Message-State: AJcUukdOUGFmxJ88+xIH0xjClviB6asdv5H+HzU05jQe0jJAdUGThuHs
        9M9LH4LVjY7KtUk9iU2XVHr2Lg==
X-Google-Smtp-Source: ALg8bN7xVDzz1o4EXPWbs5wQm25LyId8BTuyiu6j5jLuYGXzo0bv1duYRDW0eNRNVMaVWJxVsev2mg==
X-Received: by 2002:a2e:82d7:: with SMTP id n23-v6mr12660838ljh.143.1547471183729;
        Mon, 14 Jan 2019 05:06:23 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id f18sm84229lfk.18.2019.01.14.05.06.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 05:06:22 -0800 (PST)
Date:   Mon, 14 Jan 2019 14:06:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH v2] media: i2c: adv748x: Use devm to allocate the device
 struct
Message-ID: <20190114130622.GE30160@bigcity.dyn.berto.se>
References: <20190111161703.7972-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190111161703.7972-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thanks for your work.

On 2019-01-11 16:17:03 +0000, Kieran Bingham wrote:
> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> 
> Switch to devm_kzalloc() when allocating the adv748x device struct.
> 
> The sizeof() is updated to determine the correct allocation size from
> the dereferenced pointer type rather than hardcoding the struct type.

I would put this under a changes since v1 section and not for inclusion 
on the commit message upstream. Apart from that

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [Kieran: Change sizeof() to dereference the pointer type]
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 060d0c5b4989..1e5c7bbcf6b2 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -674,7 +674,7 @@ static int adv748x_probe(struct i2c_client *client,
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>  		return -EIO;
>  
> -	state = kzalloc(sizeof(struct adv748x_state), GFP_KERNEL);
> +	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
>  	if (!state)
>  		return -ENOMEM;
>  
> @@ -772,7 +772,6 @@ static int adv748x_probe(struct i2c_client *client,
>  	adv748x_dt_cleanup(state);
>  err_free_mutex:
>  	mutex_destroy(&state->mutex);
> -	kfree(state);
>  
>  	return ret;
>  }
> @@ -791,8 +790,6 @@ static int adv748x_remove(struct i2c_client *client)
>  	adv748x_dt_cleanup(state);
>  	mutex_destroy(&state->mutex);
>  
> -	kfree(state);
> -
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
