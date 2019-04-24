Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5149C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 20:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B53B2218B0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 20:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQLlE29v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387475AbfDXUzP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 16:55:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35146 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbfDXUzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 16:55:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id z26so440164ljj.2;
        Wed, 24 Apr 2019 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LJrtAmnnLqdZDo24uJKOtYsvyQCHMHwJ7O/G7/TNQso=;
        b=bQLlE29v2dPvWhI5URZf6sPXCssvpbwKpbl0kbqcy4rKiI53QwWpuwmPVvlavHddaj
         NYpzY3TWVaEsGJ3rzgbgjXxm/1kjCY3mxUJ3bz8h6vUGVMjNa8V6GPlLTrTaJTAxrqTk
         qx8o7TEpRi+lpGxMZPttwjL5UfgyKd4gspTeWypZZIcic7EVE17q96M6cSdtdP8qp7R7
         SRTHiVd+XJ8PKJWxILecSrLSl0yBLVutQ10C+xHCR28XRiSagrUtQO2GBPBEhz0+LLKN
         riv1HidXsfSLYtmBhNdTgXLaxEv9mI/ge4HFswhVvxe4r6/2HDO0e3rXIr2WEvZb2MvP
         uabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LJrtAmnnLqdZDo24uJKOtYsvyQCHMHwJ7O/G7/TNQso=;
        b=m1MUO6lncUFBbhp00kL9VJsTECtuP5L+zcJ51pRkMY2G+rClBUsVZ5rHsIfVX+6jdg
         P74Op4h+mumJpVtK0eawcv34L6bHX99tq0Uqgn/HnRxPTCdfqiBKANyZYnbfvHDTt/i1
         wdT47OU5pmWQ2/A7ALJ/wBblTP+FVuAQeK6JWiVqFKuePbvvM0/7MpGaDZqx43hocV2p
         zBXRbls/QYzh1T9RuRwguh4jCehjqZ05wbY1BsC/d7BLd6OhFHcLapBoMSN71WCQtAF0
         WC9qHX6laWGwfCU2FBV4z+d2gxI9ePWpXtL0ADUrcUif2E8GLQe89atOrkhb15Qo3tEd
         PNdA==
X-Gm-Message-State: APjAAAWjhkQnbf4QqpKL77zJ1O3/7pdndDw/ImOY05kUzOcyyNque6oM
        JJkVxV2pdIpmRJsi9DPl+tpYj6QmQEs=
X-Google-Smtp-Source: APXvYqysz+Ulsa2G2DL8mWI2BnA6I325y0DtcHrRlVx2Y7OBph/HFH1gTmM7o2lTA+IwY9Gy9TY9Xg==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr19567157lji.121.1556139312498;
        Wed, 24 Apr 2019 13:55:12 -0700 (PDT)
Received: from [192.168.88.248] ([77.222.156.95])
        by smtp.gmail.com with ESMTPSA id j9sm4191447lja.92.2019.04.24.13.55.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Apr 2019 13:55:11 -0700 (PDT)
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
From:   skidnik <skidnik@gmail.com>
Message-ID: <ce8b3f16-2874-c7b8-d8ee-34664d0169db@gmail.com>
Date:   Wed, 24 Apr 2019 23:54:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> There are two problems with dev_err() here. One: It is not ratelimited.
> Two: We don't see which driver tried to transfer something with a
> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> is that we don't see if multiple drivers are trying to transfer while
> suspended. They need to be discovered one after the other now. This is
> better than a high CPU load because a really broken driver might try to
> resend endlessly.
>
> Link: https://bugs.archlinux.org/task/62391
> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> skdnik: Would you be so kind and test this patch? I can only build-test here.
>
> I have a prototype to fix the similar issue in the core, but this needs more
> testing first, so I am sending this one out already.
>
>   drivers/i2c/busses/i2c-designware-master.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index bb8e3f149979..d464799e40a3 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   
>   	pm_runtime_get_sync(dev->dev);
>   
> -	if (dev->suspended) {
> -		dev_err(dev->dev, "Error %s call while suspended\n", __func__);
> +	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>   		ret = -ESHUTDOWN;
>   		goto done_nolock;
>   	}
I have little experience in compiling and applying patches, guess I can 
add this diff as a patch to linux-mainline PKGBUILD and try to build it. 
I'll try.
