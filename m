Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A132FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 17:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7694320643
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 17:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="hqBhsH/O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbfCKRze (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 13:55:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36354 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfCKRzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 13:55:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id v10so4919807lji.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nCooZCQmTGdjQ0/9ylaKblDq4VKkhTsj6ZI5g1+4kPM=;
        b=hqBhsH/OhOQJgzzUemh/qcNSaLlfOqDf0MQP83GBUuL47Atz22M5hs1QBYypVW3N+7
         BnIIeAK3Jmk5vVYhyz0xJ1xlNFsmh0ouJUQ1Rp+G18fYuhsIZQN0OHhb4381TSKYWcFS
         MUSZU+Ov0ujZjf7+PyiFQr5iDlfQl42voMFZdW+ZpubfiTO9c3tsCP2SV3fTo8l4lLHz
         LbWT+LoCVqCQO1lyMIO62tR/M3B6Nq/rW5H2PuD2JlYAM+Fy6RyYJyARIiGoE3rY6SuV
         MDKEg5inoAKd8HRl9ZE3euCNSnroCt3TQg+tASs7sYtfRWa/gsJJBj84gaGBCiClAi5V
         yZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nCooZCQmTGdjQ0/9ylaKblDq4VKkhTsj6ZI5g1+4kPM=;
        b=aXcEezgT4URDSv0UMamifpwWcSWH0l6pY8/3KQeyMwHFkTRYt+T8zpoo2LBAN59Y5h
         FS6ZWOK2CEKoRHNrHLm0MOMwAK04bKEQhKyFHoIG8Mj4oqDFg05Na2HJfGFPMz4WZzQ/
         zKCuAoqbLW9Q8oB5SZec/cMQ+xmSq8pGrUHB2kKTdLXDC2XOr4SfREUkDwFpDRCEZ6cL
         cwCRcPSst+axraFHeud/Gab2HhcHQBEvuaCWgxt36QEk0YSaikZ6TjBIIgWIa3KPs3+k
         vhyzAp7Yq9PCw0HaqUCpob/6L6Wjbvc+XIGckJ5jQYcxfygHY1XDfFtoSdgp+TcueLod
         AF8w==
X-Gm-Message-State: APjAAAXBWgrf+lN4g19i8aADn2EzDy/QsOP68u4IdNhZZUPkcQJ9Cipv
        BUw1rvp3bwmCTJjbIRUN1cchng==
X-Google-Smtp-Source: APXvYqyo5dvqqO0Z7Zj33Bd9z9//QkS8OTmohxcZ7KdYh1ufOOr+/PZjkZR8IG+02/oIyssIW1z82A==
X-Received: by 2002:a2e:870c:: with SMTP id m12mr16664527lji.24.1552326931774;
        Mon, 11 Mar 2019 10:55:31 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.168])
        by smtp.gmail.com with ESMTPSA id r80sm40720lja.28.2019.03.11.10.55.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 10:55:31 -0700 (PDT)
Subject: Re: [PATCH v2] net: renesas: fix a missing check of of_get_phy_mode
To:     David Miller <davem@davemloft.net>
Cc:     kjlu@umn.edu, pakki001@umn.edu, vladimir_zapolskiy@mentor.com,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        chris.brandt@renesas.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190311074939.517-1-kjlu@umn.edu>
 <20c5cfde-3c2d-43cb-efc4-be9782b7eb2e@cogentembedded.com>
 <20190311.105203.2225467966650056784.davem@davemloft.net>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c205461c-edb1-c9c1-a928-8068374aef2b@cogentembedded.com>
Date:   Mon, 11 Mar 2019 20:55:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190311.105203.2225467966650056784.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/11/2019 08:52 PM, David Miller wrote:

>>> of_get_phy_mode may fail and return a negative error code;
>>> the fix checks the return value of of_get_phy_mode and
>>> returns NULL of it fails.
>>
>>   Sorry, I overlooked this issue.
>>
>>> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
>>
>> Fixes: b356e978e92f ("sh_eth: add device tree support")
>> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>>> ---
>>>  drivers/net/ethernet/renesas/sh_eth.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>>    Why are you not fixing ravb_main.c as well? Especially as you have "renesas:"
>> in your subject, not "sh_eth:"? :-/
> 
> Kangjie please fix the subject line and incorporate Sergei's Fixes and
> Reviewed-by tags.

   For the record, this patch was a nop, I have to NAK it. Kangjie, please address
Geert's feedback, thanks.

> Thanks.

MBR, Sergei
