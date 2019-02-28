Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE18C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 14:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 474772184A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 14:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ccIV4rLp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbfB1Oj5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 09:39:57 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45921 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731713AbfB1Oj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 09:39:57 -0500
Received: by mail-lf1-f66.google.com with SMTP id h10so15401676lfc.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Feb 2019 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QI78aKxiETsK6ZhT2vHUjQU76cSioe3lKkBF2I5biYA=;
        b=ccIV4rLpuh4MCl00S5yNsakMc/CuZA+IOaxI6tjeQ9WsUV9Av5NvYc8cil921OJGRF
         L6y6zkPDlr8PN6/+t7QQpwzVMagqCsCNFKhLv5+oS3CDm+zhCV2wpETHf74fKkwadRJ2
         X1+Ng6EihVIW9N89PTZXHd7N68RBAgfKyiHRfFGC/v8u20p6bzto9K3cqXnfqELZgN0g
         35jcH5Nx3Cc7QcceWC5KzygMIfqFtpEOaaLgnhrc4fL7ckeTocAOzXvI4FY+vLjrUN13
         ZKNf/ipQewEfblnoHlCxw73MNO6jSgHMWHsg3+xJdZ+ngDdfFr4CvAjUhrPpNdqGhmHI
         1/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QI78aKxiETsK6ZhT2vHUjQU76cSioe3lKkBF2I5biYA=;
        b=DOBwFMQXD75QhkkoPscPCxGvKfzoyNOIaD8P7zEaGa80PAntYMPuOCPwqNXo36H9Kq
         YqXgDOYSNLxO3MsQrOXZqTizoJXnc4d71O5wDbtFhTJJQwHhD5Z9kTa3q6wKl9e78IC3
         ASeMZV/yIPSajfWqZStASBMZHxr2FTK8vZAhXiyGylaP+1QhXvmIBTHZ5wbZTjkrlHyT
         DmO4DrEk7CUz136XdGQumYWydiyAzMouxp7RatuCmWAZsPRPxvfZPbdhJ+eX+UBGAIRJ
         cyP+xFcSMm+N3Vt09luNHA/ZPNsO6Tz/tMTL3WriFoBGdl4HMNFup2Iz+9GyYoUMbKFH
         1DMQ==
X-Gm-Message-State: AHQUAuY0uChmqcZwfJ0MPn1t0Ppv1Ykix2ciozHD4Xcw9G/jdJbZ8Av+
        bQaCr+RLHS2s4TOLqJHscx/L3cIeUP8=
X-Google-Smtp-Source: AHgI3IbSQbzhCdzjwWG/KCgtkIq1hsSjNFnfuRJGErFS+13geJdtzmvMhFZr+QFL8TEk6qZlareiMg==
X-Received: by 2002:a19:5209:: with SMTP id m9mr4323970lfb.51.1551364794811;
        Thu, 28 Feb 2019 06:39:54 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.83])
        by smtp.gmail.com with ESMTPSA id g11sm877881lfh.15.2019.02.28.06.39.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Feb 2019 06:39:54 -0800 (PST)
Subject: Re: [PATCH] media: rcar_drif: Remove devm_ioremap_resource() error
 printing
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190228110616.1966-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <db628fcf-7101-3466-e7b6-b57a76bd271c@cogentembedded.com>
Date:   Thu, 28 Feb 2019 17:39:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190228110616.1966-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 02/28/2019 02:06 PM, Geert Uytterhoeven wrote:

> devm_ioremap_resource() already prints an error message on failure, so
> there is no need to repeat that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/rcar_drif.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index c417ff8f6fe548f3..d4efade7aea60e32 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1407,7 +1407,6 @@ static int rcar_drif_probe(struct platform_device *pdev)
>  	ch->base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(ch->base)) {
>  		ret = PTR_ERR(ch->base);
> -		dev_err(&pdev->dev, "ioremap failed (%d)\n", ret);
>  		return ret;

   No need to use 'ret' now -- how about merging the assignment and *return*?

>  	}
>  	ch->start = res->start;
> 

MBR, Sergei
