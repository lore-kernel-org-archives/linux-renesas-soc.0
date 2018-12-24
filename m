Return-Path: <SRS0=zpKQ=PB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E816C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Dec 2018 08:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25ACE21721
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Dec 2018 08:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbeLXIzj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Dec 2018 03:55:39 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41390 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbeLXIzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Dec 2018 03:55:39 -0500
Received: by mail-ed1-f65.google.com with SMTP id a20so2836577edc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Dec 2018 00:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uvgDl0zaRclmAWSUoyGF73jp9Q0y9utqlwKPLMiDedM=;
        b=Ys//F+vGABWfxKzczQ2IpxG/r2i/01zH0UQWG99K17YVMxzpxG1vZc/uP2ffCuWUR4
         MutvKB1t1fJ35NDHY6UVPVr7fjAxGCe47RtLWcJ5M4cPywAExILLAOam+rohlZknBGIm
         O+gOVMUpA9+JZdumEc1SJLNKyR3q2NggavHi3RhIcyIFD7u0mEVxRYHZslwfChmBlqr2
         3/cExVYeD03OVaSTyoThTF2fMP42Hrynq8Z244x2RWLrhb3/PswPS0+53udM76Rnvalw
         qTJeWnaL44k+AvsC4WxcyskdVEI/C+aNlUcHogpLpfg4AkqBeTW54/G3BNDQ5U20CGd6
         oeGg==
X-Gm-Message-State: AA+aEWaPjXgwwY7tnq1L+bTHPh0yBVOmtf9f+DmZqFxmphxp8yX2oNCb
        LttMoQ8vtbh+GsjZym5sHeN39w==
X-Google-Smtp-Source: AFSGD/VdcA83vWXu0jMmWjRNqba1ITVqBs2MmDfWz/ohdeUlnho4PEFvTfAvWkoqONjY+XO9fYZuDA==
X-Received: by 2002:a50:8e16:: with SMTP id 22mr10057084edw.269.1545641737689;
        Mon, 24 Dec 2018 00:55:37 -0800 (PST)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id s19-v6sm4713219ejz.2.2018.12.24.00.55.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Dec 2018 00:55:36 -0800 (PST)
Subject: Re: [PATCH v2 0/9] i2c: move handling of suspended adapters to the
 core
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20181222202623.4521-1-wsa+renesas@sang-engineering.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7fd31445-6cf8-5094-3cd8-d6ca5c059541@redhat.com>
Date:   Mon, 24 Dec 2018 09:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181222202623.4521-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 22-12-18 21:26, Wolfram Sang wrote:
> Here is the new version without specific I2C helpers but using the
> 'is_suspended' flag from the PM core. I didn't like messing with the
> flag directly, so I did a helper in patch 1. So far, I like the
> approach. The diffstat looks nice, and i2c-rcar.c and i2c-sh_mobile.c
> rejected rightfully too later transfers without further modifications.
> Tested on a Renesas Lager board (R-Car H2).
> 
> I dropped a few Tested-by tags because I think this approach is too
> different from V1 to keep them. I hope you guys can have a look again.
> Thanks for all the testing, so far!
> 
> A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/reject-when-suspended
> 
> If this series is acceptable, I'd suggest to take it via my i2c tree
> after rc1. And then I'll provide an immutable branch for the PM tree to
> pick. Let me know if this works for you.
> 
> And thanks to Renesas for funding this work!

Series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
> Thanks and kind regards,
> 
>     Wolfram
> 
> Wolfram Sang (9):
>    PM / core: add helper to return suspend status of a device
>    i2c: reject new transfers when adapters are suspended
>    i2c: synquacer: remove unused is_suspended flag
>    i2c: brcmstb: don't open code to reject transfers when suspended
>    i2c: zx2967: don't open code to reject transfers when suspended
>    i2c: sprd: don't use pdev as variable name for struct device *
>    i2c: sprd: don't open code to reject transfers when suspended
>    i2c: exynos5: don't open code to reject transfers when suspended
>    i2c: s3c2410: don't open code to reject transfers when suspended
> 
>   Documentation/i2c/fault-codes      |  4 ++++
>   drivers/i2c/busses/i2c-brcmstb.c   | 22 +-------------------
>   drivers/i2c/busses/i2c-exynos5.c   | 10 ----------
>   drivers/i2c/busses/i2c-s3c2410.c   |  7 -------
>   drivers/i2c/busses/i2c-sprd.c      | 32 ++++++++++--------------------
>   drivers/i2c/busses/i2c-synquacer.c |  5 -----
>   drivers/i2c/busses/i2c-zx2967.c    |  8 --------
>   drivers/i2c/i2c-core-base.c        |  3 +++
>   drivers/i2c/i2c-core-smbus.c       |  4 ++++
>   include/linux/device.h             |  5 +++++
>   10 files changed, 27 insertions(+), 73 deletions(-)
> 
