Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D800CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5151214DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="FzlVFacR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfAJK0G (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 05:26:06 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44533 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfAJK0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 05:26:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id k19-v6so9177421lji.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SBb86NMsHZ5zps+6tloB3NYJDPBdSU6IL/CZyxV0S9Y=;
        b=FzlVFacRA/R+4Y4MHxn3FgqVh8KQH2b/3VtkvqJthWFBglUM0hGNSiA0IVcsBKgc3s
         ZChbfJDlVATnbb+mmwbDsTxkr4WLiPPDJWJm46aZHN3IeJVbDD4VFLlj4ujBAc5TmElM
         5oxIzjfyXS5S51FSU0LbXS5XK5MYkRahf7xNAhU01LggXf1AJ0FmOvsr7byu0ppKW93M
         9vP0vjdHXHWHSCPLUdl+mxXeWdlH54e8VkfyEis7N9VqqnSMsEfKgE13vIOODYw6gbNw
         V26U3py3oCueF23d5VV3rlLsFsaSBbGlRn5f9jF4ZPjF7uOtBoK3v5X6NBm4eC2+DJmU
         jSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SBb86NMsHZ5zps+6tloB3NYJDPBdSU6IL/CZyxV0S9Y=;
        b=XZB1znTcqwUd+Zau3Doz164SW1O7T5lUDZCZORDe+PrWInBrwEJgX8Y0kvd528XesF
         n6VbeSDGUiVgAIUibNct7fm0MUlrFvYftBLL9a8TZOg8c1bATM0RGfAc8hUQJSScv4lu
         +881yS3RLYKJ43Km/3q2QOuTNbIVK+DDKKT9bd2Q9Aaua8O3/N2qSbtzWwr4NmnR+4/O
         bIRhJaXRtDsSe+khnee6kYhQ2sYah9dwB0VA3tnbnG2aTSluI/LC9hXRBvuiNl4FxPoG
         VjHoI0gQ3d9LbhuJ1uflKl7Iji7gY/qwaxcqfa05TP3UxXQmQOIHWY9jUxjSSoPjtLa6
         vD5A==
X-Gm-Message-State: AJcUukfNn/UUBivB37zNYEU/S5OX6svBARVfCELgQdKamLFWCPCE1U63
        1PaMI7l7uAlV6wzU3HRqC7f2QA==
X-Google-Smtp-Source: ALg8bN4H9oq7U8dO7P24L7Xw2SJKHOTDPQXfIihMWdPymAeZxodxStBBiN5uZWZ/lFVyUGIckds7sg==
X-Received: by 2002:a2e:9a16:: with SMTP id o22-v6mr5479034lji.112.1547115963779;
        Thu, 10 Jan 2019 02:26:03 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.122])
        by smtp.gmail.com with ESMTPSA id h3sm13915957lfj.25.2019.01.10.02.26.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 02:26:02 -0800 (PST)
Subject: Re: [PATCH v5 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Boris Brezillon <bbrezillon@kernel.org>
Cc:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, boris.brezillon@bootlin.com,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1546921020-20436-1-git-send-email-masonccyang@mxic.com.tw>
 <1546921020-20436-2-git-send-email-masonccyang@mxic.com.tw>
 <74a5fba6-a77e-f71b-ce49-405fee8e0fda@cogentembedded.com>
 <20190110111601.1dad05a0@bbrezillon>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dd36d2b3-c0e3-f6a3-56f1-c96f4ae59ece@cogentembedded.com>
Date:   Thu, 10 Jan 2019 13:26:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190110111601.1dad05a0@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/10/2019 01:16 PM, Boris Brezillon wrote:

>>> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
>>>
>>> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>  
>>
>>    You now need to add:
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> May I ask why?

   v5 includes my signed read mode workaround patch.

MBR, Sergei
