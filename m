Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64347C43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 08:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27F752077B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 08:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Ll6s6n5y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfDZIKC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 04:10:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45014 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfDZIKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 04:10:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id h16so2056349ljg.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Apr 2019 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HMR4KyP2q7alwbZJxkw+hrkwB2N4W8Q5wx/mo0gQbd4=;
        b=Ll6s6n5yxXfWG8QfEY17i6TMv4ddpp0aH6gDSwzgZ0ycXTfxykyUsisGRhLEguFJeC
         V/BSRctrRS54C5IapAsvfKQsM4MN6jxhEF4MRJxauHkGvQ71Jb8lFv+mZhLex/FrjGU2
         6cpnU63DLSm0pZkpFyWVHGk8fjLjNjV5DYrOK9GGjOE2nQbr7N52EyUiXcWjaKG7zky6
         rnG8mKGPQbQJ7LfYCQPfP4UiaCQYAMiNHsWw8rS4N0NS8NZpk/PlGZmFPhMZiHOrVZRY
         MIxqfdY6dJ/s4NG9sV9YXxmuLFLWBDmEXghlf11sMEQfR+fFce/tvv/RJw2dZ2XmnIdn
         QPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HMR4KyP2q7alwbZJxkw+hrkwB2N4W8Q5wx/mo0gQbd4=;
        b=fLTtOL26NBJgxF4xkB8mHuMPbOsnwowozdS/GasjkjrezR/mslpgs3E3gTgzbb/3kf
         wjcdSdSEJQhA0mYgUXmOEyHER42+qpx4D2W/08CEfZPHla41AKnY5mpU74wRCQxQYeTH
         9AP4L27oJsBKOP+L717dv3ZM2/mawh4mW1kV1yH+NY+10f1Tl2BjGR2QIocMN0TFCqcZ
         gCyNRJxvvK05XbCP9/+ep/mLfSjHmS7r4ZHropF+bqEdxZ+dVV07fqvrP0g+jCio9ETP
         YuepQCABnNBr8ZZel3Xj4mUo6fpuWrBjDBQIP09e8KjBxhrVsG08IAEa+G/jVesiuM7A
         Fh6Q==
X-Gm-Message-State: APjAAAWvd5HQBZJJ9cYmzZ2jdae2BF94OC87DlE9401DLu/S30J0bvFZ
        4YSKTXsJ5XGBR3HxckMQ//o0r08HjfY=
X-Google-Smtp-Source: APXvYqxc09frZU++hYC13SvyHMERaMd8BBKNf7kczooe+u62U45KJpZWbn1VmfXJqMIeqT0154Fm2A==
X-Received: by 2002:a2e:93c7:: with SMTP id p7mr23999259ljh.32.1556266199232;
        Fri, 26 Apr 2019 01:09:59 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.81.162])
        by smtp.gmail.com with ESMTPSA id 63sm5440933lfz.2.2019.04.26.01.09.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 01:09:58 -0700 (PDT)
Subject: Re: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on IOMMU
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <39b57554-db27-6b8a-261d-b8097c239e38@cogentembedded.com>
Date:   Fri, 26 Apr 2019 11:09:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26.04.2019 8:18, Yoshihiro Shimoda wrote:

> This patch adds a condition to avoid memory size limitaion of

    Limitation.

> swiotlb if the driver runs on IOMMU.
> 
> Tested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/mmc/host/tmio_mmc_core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 6019628..0474337 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1203,9 +1203,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>   	 * Since swiotlb has memory size limitation, this will calculate
>   	 * the maximum size locally (because we don't have any APIs for it now)
>   	 * and check the current max_req_size. And then, this will update
> -	 * the max_req_size if needed as a workaround.
> +	 * the max_req_size if needed as a workaround. However, if the driver
> +	 * runs on IOMMU, this workaround doesn't need.

    Isn't needed, maybe?

[...]

MBR, Sergei
