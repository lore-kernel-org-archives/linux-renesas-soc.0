Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848BCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 541FA20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrQpM4KO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388848AbeLQUH6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 15:07:58 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45147 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbeLQUH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 15:07:58 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so6629375plm.12;
        Mon, 17 Dec 2018 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rmsPq5nKizd3oqRse1ibArDcz54h3eEafJXl0fD7toA=;
        b=JrQpM4KOYuViWzBud566UF57GMw+aOw8ivlwYuZE8BsKx/BzVuYdtj51HNi4wOMsPw
         0VqO3bLUaaCsiqtkYRNRF0lw8B1wimQckwRJu5mmmmXUGom81Zd5xyapYOD6M6M90Cr0
         tz/Lo77cwh1zxf+8laj9YCMCxgogetF/r4g/XRwq/EIq3l3CNCcXYQ4h/+N3QvDCKoZM
         LTGdVjKwWrbJ4bdv5pu10GdWzC4c6Z4FkxyNBQRUVHARvHVTlDGDgTLFu4cU3LdFY5mm
         lhPB24TT/VBbjAjgn4a+8jby5IMbkZAgwYUhvlPZIHNCE5pVNOOCUbREln1sMoiTHV5Q
         OPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rmsPq5nKizd3oqRse1ibArDcz54h3eEafJXl0fD7toA=;
        b=OIp00Q+I79QYHgukbBKn8XC/TFs0K1LrPmKWJjsOfnMEbiS3ILXIk9OnNAAgplAVdS
         8mh3MpUM4Ho5fr2SZxZwvTOzfKUvuda+cGX7HJrJz7PJU3Y1aB90kaZrOjMP0VV19fnM
         J+u4qf07jTMA7/dWHAf/KUGlfYGEYwZAp3gWS7s7GE3aW+E4qG2EyvOBHIYrzEO31Y3J
         vqIw+7T7asgSUiZWJXM91UNPswHngfz4g0Lssss6Z+CLQzrtI0bFym61IHmzr70jtRsF
         Vx2hK/Z1Lk9FXnr0AJEkvpJwtNO3rFPMqUVOnlOSI7B06z0ECDmLjG59xlzK9v0Yd/3A
         Lcaw==
X-Gm-Message-State: AA+aEWZdoZyu89QlGi/EJuGL7XlHCpdRH+h0ItMtatCJjM5W4/NB/6M/
        BCh7fBHvEpVYJMCH/oPp/K4iCLGj
X-Google-Smtp-Source: AFSGD/V3jA9m3nLqAcO899B35tLAUYRRlAgxjqVYGufVR6W0ECNLQ/hva0gOPXaXgti1Fq/o4xkbtg==
X-Received: by 2002:a17:902:ac1:: with SMTP id 59mr13637767plp.36.1545077277891;
        Mon, 17 Dec 2018 12:07:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r130sm29591975pfr.48.2018.12.17.12.07.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 12:07:56 -0800 (PST)
Date:   Mon, 17 Dec 2018 12:07:55 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] watchdog: docs: kernel-api: don't reference removed
 functions
Message-ID: <20181217200755.GA29585@roeck-us.net>
References: <20181217191411.3254-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217191411.3254-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 08:14:11PM +0100, Wolfram Sang wrote:
> Those functions are not only deprecated, but gone for good.
> 
> Fixes: 62cd1c40ce1c ("watchdog: kill unref/ref ops")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-kernel-api.txt | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/watchdog/watchdog-kernel-api.txt b/Documentation/watchdog/watchdog-kernel-api.txt
> index 9b93953f69cf..3a91ef5af044 100644
> --- a/Documentation/watchdog/watchdog-kernel-api.txt
> +++ b/Documentation/watchdog/watchdog-kernel-api.txt
> @@ -128,8 +128,6 @@ struct watchdog_ops {
>  	int (*set_pretimeout)(struct watchdog_device *, unsigned int);
>  	unsigned int (*get_timeleft)(struct watchdog_device *);
>  	int (*restart)(struct watchdog_device *);
> -	void (*ref)(struct watchdog_device *) __deprecated;
> -	void (*unref)(struct watchdog_device *) __deprecated;
>  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
>  };
>  
> @@ -218,8 +216,6 @@ they are supported. These optional routines/operations are:
>    if a command is not supported. The parameters that are passed to the ioctl
>    call are: watchdog_device, cmd and arg.
>  
> -The 'ref' and 'unref' operations are no longer used and deprecated.
> -
>  The status bits should (preferably) be set with the set_bit and clear_bit alike
>  bit-operations. The status bits that are defined are:
>  * WDOG_ACTIVE: this status bit indicates whether or not a watchdog timer device
> -- 
> 2.19.1
> 
