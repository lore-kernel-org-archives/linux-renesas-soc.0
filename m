Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C390EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 09:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 877502075E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 09:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="vlsBPzLh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732499AbfC0Jb7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 05:31:59 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34631 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfC0Jb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 05:31:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id y18so10911626lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2019 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QJ0+9pnY8ZG3wKcYs2cciImTaew8jxFZK74Pbq47FPM=;
        b=vlsBPzLhdZ3TxQcGomuScsculbSk9yIK+sCA2B7gw+V/32W2lkR+0T4JQdwd8p2dbJ
         S9lAaqjKf0dkBbOy4hO5s5jMSeDCH4GMnKAe7pCUK0aC4tqZ+D72syQ25iihZuIBmEsz
         S8DLaT48DzUT7HDZqbeMNqTHnN2KFVb19waiqwNFrMxcbL2idwYIvpJFUuo5I5EZ6RVd
         fv2sNnv/80BfP/S88vJGzFM/qFYIhzSYhC7VDki5nx/htLC423Jsvi2WeQLzv31yl5nr
         UEk5jOgvj/zKfXv10FHDWYy+ZKhjEw6Pn5dnQZpslLFxVnNfypOY3Up27wPJ3UGbJ7VV
         aD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QJ0+9pnY8ZG3wKcYs2cciImTaew8jxFZK74Pbq47FPM=;
        b=ceSYbfGBWl766a/6I+u28tPBCr3+9IDV7loT1weYFKVl7EtL47Up9vHiZ26CilpxEj
         XPWVXpdlYsj/r7Usxj//QCCpGW6kWbMssMrzcaXZz4+WayReIxq7xdi0nOIEy1eXbtfU
         XIwWLtbZVFdVq9pT26Ps6qk99b7EJv1Nwe7UCv+jKu5huRNoQl/vdQXQML2yUhY2hMRN
         ZSn5dwIAJFYsVXzWCcT/socx1VBdbDZvS3Bz2KmQUPtkkvKfjTcRLRs00hmxx59G7+WD
         XlHwkMNdyUcn01L6+tcF22s3TN0kCeImGY03FThQtK4tJ8v4tFKhnKJCuoed7DrGIBXq
         2TNA==
X-Gm-Message-State: APjAAAX81yd0Fq6QSMJliWiLjH8xXnVu8IS6Tyvi6CmEhl2grFrNdngR
        /rT40LRQt1twht8guthKlWNJ3Q==
X-Google-Smtp-Source: APXvYqw68X4s40N8NLdcYG9PtKhSgtYz0QF3tRMcmxIq0ixjsOsorC/WNwNyNUnW0ygQBqr0wmXtiQ==
X-Received: by 2002:a19:550d:: with SMTP id n13mr18918218lfe.26.1553679116869;
        Wed, 27 Mar 2019 02:31:56 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id r27sm3890889lfn.87.2019.03.27.02.31.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 02:31:55 -0700 (PDT)
Date:   Wed, 27 Mar 2019 10:31:54 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        rui.zhang@intel.com, jslaby@suse.com,
        wsa+renesas@sang-engineering.com, edubezval@gmail.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [RESEND PATCH] thermal: rcar_gen3_thermal: Fix init value of
 IRQCTL register
Message-ID: <20190327093154.GA23466@bigcity.dyn.berto.se>
References: <1553677398-7896-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1553677398-7896-1-git-send-email-na-hoan@jinso.co.jp>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan,

Thanks for your work, and sorry for dropping the ball on this in v2.

On 2019-03-27 18:03:18 +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Fix setting value for IRQCTL register. We are setting the last 6 bits
> of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
> to Hardware manual values 1 are "setting prohibited" for Gen3.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 88fa41c..2482795 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -307,7 +307,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>  
>  	usleep_range(1000, 2000);
>  
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
