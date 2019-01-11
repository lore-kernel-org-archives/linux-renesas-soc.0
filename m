Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F482C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 10:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19B902146F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 10:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MlX9m+Zo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731702AbfAKKPV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 05:15:21 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33310 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731684AbfAKKPV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 05:15:21 -0500
Received: by mail-lj1-f195.google.com with SMTP id v1-v6so12460853ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jan 2019 02:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/PUELolL06J+97WrlgnvJjq/Q1a/jXn+lm3OiJ4YlyE=;
        b=MlX9m+ZoEu6svNqSrDfL0Gbebs06Alw460Psk9+g8C2uzFnN5p2XdQqlY3Ev2BmyG+
         QzOFR5hFIWKbpO44rxisnl3S15INBwlEfRPcLD+UgImfE+OO1dsW7vZIfGnYPcO2mPIx
         ePdy0EwKL3PtxOZ0J8a8KOjvJA7BIUPMThhwZefTUdYISDTheUwFdhPPNuBHdJyYY2Fs
         Ks8DTJSHeqs+vMIWklWuFRIufpV8E7/YDsqRJjyAbroEuSYFbQEjX88HB1QHSkLa9ILE
         gJkbmzXQgE798tAWRSdhdiGwuyZdjy+jSpXgeTeNK1u4OJ8WLl5uesgLJI2bDfH1QtzZ
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/PUELolL06J+97WrlgnvJjq/Q1a/jXn+lm3OiJ4YlyE=;
        b=H5FrJjVlDZb84wdpqJM5bC129pwlXdSUV3yqKAnTMpqbshu1QzHQVJxl86J8ZphSIZ
         PU91L7E0n0D59JJc6BjLKqS5+l+CoPnkphL38gmEazhJVAXjv2KllI83poeqrBsFmGoA
         RYAAkTExAfLG5WzNyxtRePOgjlvC+3YOeivX/W3IulQpOa6Gj4/B/UT+7TBGYUO8mFqp
         kUqIDso6RKncCoUkhGAA7uAjquD+d8cJ3Yb5wKZgrl+mJ4az+Z0hn6PIM7PEsln+70Qa
         Cu3OzMEOndCd8k3LpvIF5n9ODw3su5lskbwRrSeLSzqer+Y0zvleNBrsobxc6tqxa6WK
         XCUg==
X-Gm-Message-State: AJcUukcHOX1Q2k+jwY9mFYw3objtSIEHmOJpum11StjM5p6wXMak6TuL
        FBXHzNOMCVisl3FdJLQ9aP47h51Hffk=
X-Google-Smtp-Source: ALg8bN7XYp3ARG03XC7eXW8dGAyJAvt9GhY20n7c5fJ3Yc6IH72rfjMnbRMWuLOu7W7f/6pdzQHMog==
X-Received: by 2002:a2e:302:: with SMTP id 2-v6mr4426275ljd.137.1547201719078;
        Fri, 11 Jan 2019 02:15:19 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.118])
        by smtp.gmail.com with ESMTPSA id x16sm14222143lff.26.2019.01.11.02.15.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 02:15:18 -0800 (PST)
Subject: Re: [PATCH 1/2] spi: sh-msiof: fix *info pointer in request_dma()
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     magnus.damm@gmail.com, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8fd1a446-f40d-4fd3-a810-bfef6d1df9f0@cogentembedded.com>
Date:   Fri, 11 Jan 2019 13:15:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/11/2019 11:58 AM, Nguyen An Hoan wrote:

> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> msiof_spi_infor struct pointer was initialized in the probe() function,

   infor?

> no need to get back and keep consistency.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/spi/spi-sh-msiof.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index d14b407..64adf34 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
[...]
> @@ -1469,3 +1469,4 @@ MODULE_DESCRIPTION("SuperH MSIOF SPI Master Interface Driver");
>  MODULE_AUTHOR("Magnus Damm");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:spi_sh_msiof");
> +
> 

   Huh?

MBR, Sergei
