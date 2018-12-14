Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D5FC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:48:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85BF42080F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="RxdWcanj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85BF42080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbeLNIsJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:48:09 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45992 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbeLNIsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:48:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id s5-v6so4180103ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Dec 2018 00:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7n8sKEljvHqWCNxptv3oIPyL9aVh75sjhStBTumDc0s=;
        b=RxdWcanj1gmeFPmGyj0a1BlkawgXPsvDPgNcfw0jBOhx3uq8NlXprcIOVvhC5WaLH1
         XvaNdeBp8bSz1qWgzvDLeVNjoPMLDBYcj57UhPC41OC37pJbW73IjC6nm5OiF6/lSYM8
         ngVaoYibV8qFfZwy17qZoa0wv82jXm+Hbo5180YqWqdnAxcEJgB4avLjrYu5GYjISxFS
         G5C0pr2atisXmRW+eG+cQFEkMRNkxEXz278xzAe/IuOjyNTUwVbR7RHEgf/CzTBzrvi6
         PaHEUrAI10MLfTZBV6Po27/pf1xXvZuMOAHoNkToGRVUJ/H0DkdiOCMNJWjbmSEN116w
         a/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7n8sKEljvHqWCNxptv3oIPyL9aVh75sjhStBTumDc0s=;
        b=j6BJGqDUFE7IafWxOTbohcqNlvpcxfSP2KOvQjhj3qApz1NzRttBc10Hx5q0xR03Bb
         KtgjUyc52bYLMAZw3+TJteniYSnkxaZC46dR+zr560ta/3ig/vm24/IkAO03v/AwANHo
         zE309RpD8LgLbzXSKWT0ppqIZDCVCyGoNho74lCbOUjSQfBRBCDVqeZTC2lh2RFkjaFh
         FsSYRacRXn+3XiZBla3oVmkyTRSNe3GTUVNYu61sOiciOqZHSitNeekdFK372GvirtiG
         QDJuD2euR7wkSdu26ZRe6vMOX3BPhMM+FHbWASOkjG+iwO39CNtavEE0EzVN3kvHfJ5p
         PhLg==
X-Gm-Message-State: AA+aEWax24s2x/u51WdoS3CuW2Z4R0T1xmF/oAhvn33Fhw/FDLIWC2oO
        1sC6cr+VhpmqWpqbh3UWm1uYfBQ9Uiw=
X-Google-Smtp-Source: AFSGD/WiUtgl9nlJqSH7EaIUV9xzVOE5VEpxuaD0YXg2Q+mHqPd0X6DiyMtB1Wh8BRiXUQMuxR28mQ==
X-Received: by 2002:a2e:58b:: with SMTP id 133-v6mr1327641ljf.127.1544777286588;
        Fri, 14 Dec 2018 00:48:06 -0800 (PST)
Received: from [192.168.0.199] ([31.173.84.220])
        by smtp.gmail.com with ESMTPSA id 65sm811246lfp.55.2018.12.14.00.48.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 00:48:05 -0800 (PST)
Subject: Re: [PATCH 1/2] drm: rcar-du: Add Standby Mode support
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <45ee84e6-d892-f4ea-9f9b-ccb849c74077@cogentembedded.com>
Date:   Fri, 14 Dec 2018 11:47:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 14.12.2018 10:25, Nguyen An Hoan wrote:

> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Add function support for Module Standby Mode
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  1 +
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 90dacab..935cdd1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -651,6 +651,32 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>   	rcar_du_group_start_stop(rcrtc->group, false);
>   }
>   
> +int rcar_du_crtc_standby(struct rcar_du_crtc *rcrtc)
> +{
> +	u32 val_reg;
> +	unsigned int i = 0;
> +
> +	/* Enter Standby mode */
> +	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN, 0);
> +
> +	for(i = 100; i > 0; i--)
> +	{

    Please run your patches thru scripts/checkpatch.pl before posting.

> +		val_reg = rcar_du_crtc_read(rcrtc, DSSR);
> +		if(!(val_reg & DSSR_VBK))
> +			break;
> +		udelay(10);
> +	}
> +
> +	if(!(i > 0))
> +		return -ETIMEDOUT;
> +
> +	/* Stop clock */
> +	clk_set_rate(rcrtc->extclock, 0);
> +	clk_set_rate(rcrtc->clock, 0);
> +
> +	return 0;
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * CRTC Functions
>    */
[...]

MBR, Sergei
