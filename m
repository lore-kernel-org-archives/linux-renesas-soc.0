Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB5AC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 16:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DF0120449
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 16:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Jhz4o114"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfDKQgm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 12:36:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43519 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfDKQgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 12:36:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id f18so6112494lja.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xfTsmepwNS4iMFU2bWUZSj804lJsXd6FHTjrieVY6ew=;
        b=Jhz4o1144tTuVAcGCNxi1ckN/k1lNe8PhtcoT/SHUBHlc4JJnKw90S5qfaiR1BLbku
         5L5pP96aIDfPD21/qCwkAzxrJmBT4yTuUMDFlvcqN7OBxGrC0Kj4t7djXk3SAiIKwMcm
         SGrQi0rJ25AiR/Kf8SH/rmJUA5Nuy17RszjgZ6z5/KDoh0zNMJyUSsDwv6BQVX5sjtkd
         GilWm0NcD+f4lG0QEvZQnOq91sNNwXYu/YzP49sDpnFM0aM0XV30m/0O9rdumN9Bgn79
         DLD5m1V+myFCtm6TXQBfjKtgxpqrase4MhUbZGf+5GmY3rIqQQ9FA1yZqm0I28oemG5K
         YUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xfTsmepwNS4iMFU2bWUZSj804lJsXd6FHTjrieVY6ew=;
        b=SSB9n4qR7xR9IBnuZRHu2CVoGkLJKA0Ba7XiNjFDhR7y9/wcUJ5gYggW5XqdEzsx9y
         y9SAPVOpy87rdVzZ6/DJh23aUwMIUS7+BLY4i2r2IHv0qBU5W4OSLmLb9GTA40iBI02Z
         fMW04rZttndNiznqsTvpZh0evnEpe8vUGQa7ZCw1dW8nmgOvP3Tn87itzfx7CvdxtMXr
         C3tNj0Ch8FJ4rMxZBKP6/xRrbNMTKHs2UWlGL0cL6SEhGqHQq7jB4z9+d3EUjzebGXzR
         mH4qTw2LTeBfeA6gJGXqppWZgaj6GHTy0vLOD+lZ+Hb6VK0IPb5KWGR2kqHZPQpT8t4o
         DtDA==
X-Gm-Message-State: APjAAAW/dpziv0ATq9Cj5eyB2XYp56nqPHX7arRRWR2LHjzhBmPgQ58E
        YYy5WBEsP1ODi4F01h2GJ1OA1w==
X-Google-Smtp-Source: APXvYqyrHSWnO7CytnmJTxhd/CrBAUkNK4voXS5RUgxe4LTq6+3UKmpoW4PAKUkToqFVpi1QB3e2eg==
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr26919537lji.163.1555000600427;
        Thu, 11 Apr 2019 09:36:40 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.84.183])
        by smtp.gmail.com with ESMTPSA id o198sm102253lfo.15.2019.04.11.09.36.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 09:36:38 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
 <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
 <20190411084026.5crg7yiphm6zsk5s@verge.net.au>
 <20190411092056.jmnsx6mnfylfrsh4@verge.net.au>
 <20190411133357.GE8916@lunn.ch>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a6bd1a3a-0c6f-6d2a-9270-f5819c34d4e7@cogentembedded.com>
Date:   Thu, 11 Apr 2019 19:36:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190411133357.GE8916@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/11/2019 04:33 PM, Andrew Lunn wrote:

>>>>>> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
>>>>>> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
>>>>>> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
>>>>>>
>>>>>> This matches all ES versions of the affected SoCs as it is
>>>>>> not clear if this problem will be resolved in newer chips.
>>>>>> This can be revisited, as necessary.
>>>>>>
>>>>>> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
>>>>>> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
>>>>>> mode is not supported as there is a risk of introducing a regression
>>>>>> when used in conjunction with older DT blobs present in the field.
>>>>>
>>>>> Hi Simon
>>>>>
>>>>> I think it should at least WARN_ON(). Such blobs are broken, even if
>>>>> they do kind of work.
>>>>
>>>>    Good idea! Simon, third time's a charm? :-)
>>>
>>> Sure, can do.
>>
>> How about something like this?
>>
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -1980,8 +1987,14 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>>  		set |= APSR_DM_RDM;
>>  
>>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		set |= APSR_DM_TDM;
>> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
>> +		if (soc_device_match(ravb_delay_mode_quirk_match))
>> +			dev_warn(ndev->dev.parent,
>> +				 "phy-mode %s requires TX clock internal delay mode which is not supported by this hardwre revision",
>> +				 phy_modes(priv->phy_interface));
> 
> Hi Simon
> 
> The point of the warning is to tell users they should upgrade their DT
> blob to one that is not broken. So i think the message should say
> this. Also, we want users to notice this, which is why i said
> WARN_ON(). Something big so it gets noticed.

   I agree in general but I guess you meant WARN() -- WARN_ON() doesn't take
a string arg...

> 	   Andrew

MBR, Sergei
