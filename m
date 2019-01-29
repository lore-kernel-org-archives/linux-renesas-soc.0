Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8211C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 10:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A954E20869
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 10:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="zf7q5hjP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfA2Khn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 05:37:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40831 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfA2Khn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 05:37:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so17010167lji.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jan 2019 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZpHHlyt8R/ZcfMAIx728xxkPhha0qgVyWwThWOJbWXc=;
        b=zf7q5hjP9yz2gmMDwuqSXmvozRYyybuosKXZsJNvji57NWFnitwZ2mNPzcwUmnLTtl
         UWkKd/zS0QJQKDi03V4oVMwqDv51Y1N/0b2LG7tLh8RkPNejEd7eIFCmFELQmziuWBnL
         QLgmstyGVWV/W2ab3cyOs9BgyA0shvhmdtZdatLVhqybnm1ANdO2OD6UVASoEJMvs0JB
         vzM2CfxHBZdx1N0xYp5vXV6MsDBQ+LhfyBwEEJw1z+sfSe2k27S5QWjce12A+Splfm+G
         tbtUe06D2YiwksPVHfmz1y7AUqK2OS3ZC+ExdaZvOAcvmouBxIIlO0XVJ4EIgnKEZApq
         jZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZpHHlyt8R/ZcfMAIx728xxkPhha0qgVyWwThWOJbWXc=;
        b=VF9iDjHc4hjVhQtrx3YxFW7vBQmT0zqJpGj3lHVqAy+p18QsMLATtgBDjqaiDGS5K0
         LvkSpqWKop+y0wgJUMLberkPKftRdlBWefZMiYN1bRkqHBeqBlgB4ubpsKJazftyMKu6
         qWrVfgGkLTgknK0GzVutnTpVJFF+wg1IcKs8ALwOD+ERQcIxpm2N54hBWZiBST3u33t4
         Gbbc+82eRPeLJlXZ2lnohis4xcsK3KvYVKWViE+wv2D3MuoPVsScHfDa/SMYntnxnq3e
         pdkMNvZCi2hluRfFEmnauV7ef8SrXXancoBDkVytjmc1eJTCQHzojgmRGg7IaZpzw0dT
         ghrQ==
X-Gm-Message-State: AJcUukcPU9KsEZaNYznSfwKnqrXobfWP618MPXMy2D7u1sY9yy6KKq3n
        An4COYUBB0IUNGiE7z6dd6BU2g==
X-Google-Smtp-Source: ALg8bN7aw0DPNy8ZUguO+lbroU0EpwYpo/Ya2PWCSJNXOxepq2p9u1VTCq+SPrTOe35bIJyVXtYmtA==
X-Received: by 2002:a2e:4218:: with SMTP id p24-v6mr20194285lja.58.1548758260757;
        Tue, 29 Jan 2019 02:37:40 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.176])
        by smtp.gmail.com with ESMTPSA id c133sm3805214lfc.45.2019.01.29.02.37.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 02:37:39 -0800 (PST)
Subject: Re: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
 <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
 <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
Date:   Tue, 29 Jan 2019 13:37:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/29/2019 11:00 AM, Simon Horman wrote:

>>>> The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
>>>> offload the same way as it's implemented in the EtherAVB MACs...
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Regarding this and the remaining patches in this series,
>>> which add rx-csum offload support in the sh_eth driver for
>>> various SoCs: has this been tested?
>>
>>    As I said, I've only tested it on R8A77980.

   And still hoping Geert would be able to test on R8A7740.

> 
> Thanks, I missed that.
> 
> As you may have guessed the implication of my question is that
> IMHO it would be best only to add this feature to SoCs where
> it has been tested.

   You don't trust the manuals? :-)

MBR, Sergei
