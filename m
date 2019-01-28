Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D0AC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 11:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 217F12085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 11:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="uI0l33D3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfA1LIw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 06:08:52 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40239 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbfA1LIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 06:08:52 -0500
Received: by mail-lf1-f66.google.com with SMTP id v5so11502487lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 03:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MpxaOD98u2/W2EnfCXhfKuS5vAp87EUppqxMJPhvVzs=;
        b=uI0l33D3gpOf6ixyHvGRS3XZG2F82Ww7LWcnVen89pnMdaZr2WQ2KMJTdu2/WG2Hln
         wnG4Mz93U/NYXJy7HvAz0Ib9bGG8uGyGuuzILLD/uJvr0V4iPrkSmHxQhAee+f7MDrnS
         AdHjEAuFU7yf6pMTUr7sd8EFZxS9ikSsa7y3RBd3CEwHNPYWtry06dReGI7mRC4XuBcD
         fM0wljHpQkBbzoTQCewpQB9ZLCAylxBuHtkkf/bWvxJafT/nTlpr5/l2BHuePxPNtlN+
         +v2XkjKxsr5KrztFUd5hN9mji/UPmDJ/dzKBeE1p63Y4CUSzYqZWg63bB5rv3A7KObsH
         vzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MpxaOD98u2/W2EnfCXhfKuS5vAp87EUppqxMJPhvVzs=;
        b=MgM8+mTwvqNizt9597o9RtB84eRvxuZAWf3fAmcCoq6L+mdfN9do5UhtB8kqgI6i0D
         p3gucugqIXHdH9bLJU5qDVartkwY9mem016phBeRaHYEslRG1s2CM5gk3WxsZaqmIwKc
         DC/sJXhPSj5vpm5bIz6yUtabtmUcotYm6WbtnLtUXHcmw+Yva03qQpwt50zlJO90+lC0
         Hs7K1ZCIzXPlAEMAN+qu9d1kqCKpP2MvzCEpY2xokvykuY4ixmqYtjv/SlELfYDUxHSg
         7JN3oDaHZumfYkv9GumsRwFmoqBNPoxUtnQl6ByqzFdx9WN+nNz9DL2Rt+NoOHH3lDCm
         0tZQ==
X-Gm-Message-State: AJcUuke+TidBZTFmKmekHXkTDhCXj/ts/AMtelNV1OE/Bu3h9LKZwA3s
        arnZ8+OvptnPvFlGgC97IcTBblh/pSI=
X-Google-Smtp-Source: ALg8bN6EpFWDPYkDsh11zJcwrbL5Mvcg0Q/FkbQY6udnXGpUwdQTvBgNVJUQ9XOMzy5xsfcaBv+B4g==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr15725322lfh.74.1548673730789;
        Mon, 28 Jan 2019 03:08:50 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.175])
        by smtp.gmail.com with ESMTPSA id o14-v6sm2946164lji.70.2019.01.28.03.08.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 03:08:50 -0800 (PST)
Subject: Re: [PATCH 1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <b73763ac-5909-c95e-efa5-9d44fba9b9bf@cogentembedded.com>
 <CAMuHMdUYH-UzmiMv6LUT=R3gmHSF7LvcaDXszUixtAeXgjTr_Q@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <42ba30c2-3de0-411b-63e1-9feef2508d9c@cogentembedded.com>
Date:   Mon, 28 Jan 2019 14:08:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUYH-UzmiMv6LUT=R3gmHSF7LvcaDXszUixtAeXgjTr_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/28/2019 12:21 PM, Geert Uytterhoeven wrote:

> On Sun, Jan 27, 2019 at 6:40 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> Commit 62e04b7e0e3c ("sh_eth: rename 'sh_eth_cpu_data::hw_crc'") renamed
>> the field to 'hw_checksum' for the Ether DMAC "intelligent checksum",
>> however some Ether MACs implement a simpler checksumming scheme, so that
>> name now seems misleading. Rename that filed to 'csmr' as the "intelligent
>> checkmum" is always controlled by the CSMR register.
> 
> checksum

   Oops! Do I need to repost?

> 
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
> 
>> @@ -793,7 +793,7 @@ static struct sh_eth_cpu_data r8a77980_d
>>         .no_trimd       = 1,
>>         .no_ade         = 1,
>>         .xdfar_rw       = 1,
>> -       .hw_checksum    = 1,
>> +       .csmr           = 1,
> 
> Interestingly, I cannot find the CSMR register in the R-Car Gen3 docs?

   Me niether... But if you remove that flag, the driver stops working due to
not doing >>= 16 in sh_eth_rx() anymore. Go figure... :-)

> Not introduced by this patch, though.

   Yep.

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei

