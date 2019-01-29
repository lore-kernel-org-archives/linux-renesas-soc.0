Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6201C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 16:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B66D02087E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 16:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="U990pfNr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfA2QDF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 11:03:05 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40370 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfA2QDF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 11:03:05 -0500
Received: by mail-lf1-f66.google.com with SMTP id v5so15002756lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jan 2019 08:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OCrDEoi5EV/DxP4f8L1fcapH9mjP4WbEcD6U/OaGpGc=;
        b=U990pfNreEpEboGvw4Z6J0SGPN6fRQUjrbHDKt2+Fp+1hIshLLk/n3b1i2DbBiVdu9
         +zEXwTPlYS4jcfOhcQXs/UeRUhopO57B/5bJXo7D8U9J4Q8GyN1YCA1Yd88fWmw4FOc1
         RH2OaLB16jfGXmW3oNJjWCLrgKLy7WE+CqTzOK+1GUYN0WLjRd2afMAlIexzzi+5Sqzu
         MHUUgbex8MDPKV2edCmToyQGEKws+kR9tQANdvrrmxjkEA0HtRcFh7p85E/1j+UthSHV
         exN86ZuNYhjIYDwtWFPtRQwDXu7DSMUfUlyWCthltcMPrzeW91zF5DHnPnGRuScmdFwB
         OnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OCrDEoi5EV/DxP4f8L1fcapH9mjP4WbEcD6U/OaGpGc=;
        b=CIAdYjg/0muC3TrHOnkQWhhIJ2OMWj/D3IFCEQWeTIZvt87r+PsECEKnZMekieL/Bj
         DccUhr/sMMRBWZUcy7R751hRm6UC3LppxoYvVZNLq4jkuH8Fhy/E2VEXMUK6Y1Mq+q6G
         tIIyabvwIxKG352am2VzYn9PUsRf9V9wvC7wuiIOiTSfB9m3+wIeChoaHYWkTGHYtpxT
         g/G/QhUFIQjq9geiDaWQaAEok+jgunt5fZu9S0zMPgZpK/jQVDfBWgT2mKzm1mL1a39b
         XEpQm8SJhURe2k92qPQ91cGmZ1L/3KgX5M/piyoPa70GOBa1gyJSWgxVFyDik0oi4LsO
         eMew==
X-Gm-Message-State: AJcUukcyVQmptSTB4c+8Ol6o0NqDh2CRkiD4tTXkfECvZB7YlkKAtlCy
        0SIehDdnKsVIP5mrceoIQ1NUjQ==
X-Google-Smtp-Source: ALg8bN4gNeR6BhMe07ICJIhgV7Eka/m47uiYlj1z6FWgwwmHCYaTbsYiBO+tzrr8x/zOt+UlICqegA==
X-Received: by 2002:a19:7d42:: with SMTP id y63mr20906073lfc.47.1548777783086;
        Tue, 29 Jan 2019 08:03:03 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.149])
        by smtp.gmail.com with ESMTPSA id g15sm3517492lfb.1.2019.01.29.08.03.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 08:03:01 -0800 (PST)
Subject: Re: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
 <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
 <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
 <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
 <TY1PR01MB15628BF7F66DCCE3CD1827D58A970@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <56c41482-bffe-a831-2126-24e711623235@cogentembedded.com>
Date:   Tue, 29 Jan 2019 19:03:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB15628BF7F66DCCE3CD1827D58A970@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/29/2019 06:02 PM, Chris Brandt wrote:

>>> As you may have guessed the implication of my question is that
>>> IMHO it would be best only to add this feature to SoCs where
>>> it has been tested.
>>
>>    You don't trust the manuals? :-)
>>
>> MBR, Sergei
> 
> How were you testing this feature with the R8A77980?

  Like Simon, I used perf/netperf, you can see it in the patch #2's
description. You have other ideas?

> Chris

MBR, Sergei
