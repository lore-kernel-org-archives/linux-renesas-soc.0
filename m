Return-Path: <SRS0=jiO1=QR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA3FC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 17:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51A38213F2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 17:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="qskadsrH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfBJRfq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 10 Feb 2019 12:35:46 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36411 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfBJRfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Feb 2019 12:35:45 -0500
Received: by mail-lf1-f67.google.com with SMTP id q11so6016377lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Feb 2019 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/7yXP5mNox75pDqhdZrT8BXl/wYqMnAhKxPBgTnucRU=;
        b=qskadsrH5Er195DIT14GQ8SjrZoYP4nJsN36hcTG1FOy8edQ67OOn4IVDScI6Uk6tu
         KOOQ80F003t6ABDDy04LXJy+OjbKmfUGQ2j3kCsjtKzwNopEsVlVJDt6+I4cOuYaGkNj
         7u/sn72kt8yw2XZkFNvcDzzaQmYyCZqPRT6sYhg9ZwTPGNW+b0m/wzXpaHolFTYIyZ17
         zIbUE9iO/UzCFBawoxlhwHZA/mqPUeXhOy7NlaquQiKAk/47dqx54vzXJ4/L1VdFIf98
         dVuZBUczJg9x98jQBLZvvcCtFjbp2n7IXKJRHCFguZQc9EIEHQgS8tZP5VAm8ITVcZiS
         mXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/7yXP5mNox75pDqhdZrT8BXl/wYqMnAhKxPBgTnucRU=;
        b=e+TrPmbj8zNGWRQhJbT6ha/xoDyLAZSOKflRzAdBQg0vtne3ODVfr6BeUPS5eMtBF6
         QA0joyjrf31fyi6eLyIC8g/ijigYVJAyuv8/ISd5yR7FznWwiQFyMI8N3++Z+42RmoRe
         fyIFcLO8+PrikCLWLzE7pyeQ1InBbgDr2kCdXr1hzCfHR81Z2WNmxpo362xDe/8XKXtJ
         BLSoMgY6Anc5FVlVL69Nmn3U/ByThpjjSl8lzHF4A3RbFHO0iJWmw14d8oKkq4gqAJBL
         a58TE3OkXnOlKFRrkZwRTZWb6J9oGrJfv0nZP/zH7yeobov1EL7EAxWhg2E92KgFpfjO
         5Jog==
X-Gm-Message-State: AHQUAuYg8WGW03YVeoZx9b6OseCRi6k1tnxZz9HJmWcbuIff3mR9xpwl
        1N9m4wj3vrwzpXXSKq/Lp+hPWh8VlsU=
X-Google-Smtp-Source: AHgI3IZy6Hpk2JlGhhUxH6Rj98HFrSPYfIDVryoD8qt3K96IyG1Afd95c+DNu4qIcsuD1qfra0tPcw==
X-Received: by 2002:a19:7406:: with SMTP id v6mr3994576lfe.33.1549820143166;
        Sun, 10 Feb 2019 09:35:43 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.185])
        by smtp.gmail.com with ESMTPSA id w24-v6sm1378880ljh.83.2019.02.10.09.35.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Feb 2019 09:35:42 -0800 (PST)
Subject: Re: [PATCH v2] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
 <20190209214058.n6qdemed3bcjkefk@ninjato>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <820789ff-a7ed-5b59-b661-2728cb8b8881@cogentembedded.com>
Date:   Sun, 10 Feb 2019 20:35:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190209214058.n6qdemed3bcjkefk@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/10/2019 12:40 AM, Wolfram Sang wrote:

>> I have encountered an interrupt storm  during the eMMC chip probing (and
>> the chip finally didn't get detected). It  turned out  that U-Boot  left
>> the DMAC interrupts enabled while the  Linux driver didn't use those.
>> The SDHI driver's interrupt handler somehow  assumes that, even if an
>> SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
>> if none of the enabled interrupts happened and got handled, we should
>> return IRQ_NONE -- that way the kernel IRQ code recoginizes a spurious
>> interrupt and masks  it off pretty quickly...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Looks OK in general.
> 
>> +	return ireg ? true : false;
> 
> 	return ireg;
> 
> ?

   How about !!ireg?

MBR, Sergei
