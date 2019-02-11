Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C37C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 16:38:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B963218D8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 16:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="uea1+X00"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbfBKQiA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 11:38:00 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36501 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729122AbfBKQh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 11:37:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id g11-v6so9371726ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Feb 2019 08:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VWE9Ba/YoD79ews1ekcW4Tqd8qFtEb2ZHpXhcgV6QBw=;
        b=uea1+X00lNozqCjCV9cE/PlTUCtUeFXv+S4pKtdll63zZy1MsQoUJiPQlK8LVsX7rY
         qf4r5vztnoeb1yuez6MFQAxvCPlqnlupSYEOioz4KYK5H4n+CzQliMGjgXhRqUizA9jw
         bV8MliR/M6pd0rY8Dz+ELjSGm93Cub3/6RL6Om1v3wMDeVPpOTLtJXa8lM0WtbCs5oUQ
         VgsjQju56HxWwx/bvZdTpEA2GJeP8PJaAw/T9/goSaXKm9wGgzcCBq9sD5z+H0kklBWA
         ctdhMfXA3cSheTB/Jg+VpTJo2w+Wwkjn4C0ibso3nGwkbIFuz8WBRCw+mbhsGK7zpHzF
         gWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VWE9Ba/YoD79ews1ekcW4Tqd8qFtEb2ZHpXhcgV6QBw=;
        b=dbiAyO4lbSS9k5NYrLVJxC819vtsd05b0+ohEcqSDrM4qi1EEu60S3jr3zh7VJAuvC
         ugw95NducOCF49K8RRvipg+gslK7WLyx8vQW2e6+h9OMeRz+gwfU7GNC4dmzTI7wZJ7T
         okiy79QgjaVXNeZ90XuMf/8rJ78wEF9QTHbTZmfN3jFopF8RNdpwms25+QFnVvqGqMzS
         8/ce2ezSj7ny2t4qaULsrrVHS16nMIOgQP1kVgdt8CNAceQ6fCF30VECMJeQNARbzo2E
         7sj6oGXHauoQInuN7fLs420jA4vUrCbsRLTfNLejoiRKCthGtLB3/f+TgvWXfJeV5bqj
         79iA==
X-Gm-Message-State: AHQUAuZPA2P/a5I+dpDrgX1Nl2fkon2wkLO6+q0WMyicRAXeamZiaQQ0
        5NvGMK4RaXcl+aGf1T1vPHdJ0sYIgko=
X-Google-Smtp-Source: AHgI3IafTxhyukXt1JQIR9BLz85x7atcRJW456VVCYsznIgUSv1HwtLHpTHOOhjVLywEaTMmQ+f8Wg==
X-Received: by 2002:a2e:8186:: with SMTP id e6-v6mr13879604ljg.79.1549903075470;
        Mon, 11 Feb 2019 08:37:55 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.174])
        by smtp.gmail.com with ESMTPSA id 8sm79917ljs.42.2019.02.11.08.37.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 08:37:54 -0800 (PST)
Subject: Re: [PATCH v2] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
 <20190209214058.n6qdemed3bcjkefk@ninjato>
 <820789ff-a7ed-5b59-b661-2728cb8b8881@cogentembedded.com>
 <20190210174935.i7x4ysn64meuuli7@ninjato>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <eb1e55fd-6ed3-ec78-edf7-8311cbbf9a7b@cogentembedded.com>
Date:   Mon, 11 Feb 2019 19:37:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190210174935.i7x4ysn64meuuli7@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/10/2019 08:49 PM, Wolfram Sang wrote:

>>>> +	return ireg ? true : false;
>>>
>>> 	return ireg;
>>>
>>> ?
>>
>>    How about !!ireg?
> 
> Better. Still, I wonder how this cast is gonna be different from the
> cast being done because the return value is declared bool.

   At least all the variants result in the same (quite bad) code with AArch64
and ARM gcc 4.8.5. Like this one:

	mov	w0, 1	// D.41524,
	cbnz	w23, .L353	// ireg,
.L297:
	mov	w0, 0	// D.41524,
	b	.L353	//

MBR, Sergei
