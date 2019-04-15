Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594CBC10F12
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 17:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26D162075B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 17:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="P083BPuX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfDORKw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:10:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36749 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbfDORKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 13:10:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so16435415ljg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2019 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vK0av/1KNbMtPqjJFNrsdu65KYcBJQkA8uN0TYrwO0E=;
        b=P083BPuXax8/hMFwQuTtF3bRgg+y2M2q5EF0dW/83uIrb5Y8Ycbnmlc3Fgq+SlsRHf
         Gopicpcq6uE0eI4dUNLrehnGuT+iP2IcX5unI6uxVrXduvEZKO0EJtmuVlDiI7DIKi4Y
         nnO5CxK8WiJTUmBrhjg2eQ73VlkuYZ/TekK2ijRMJXRCzVaFhXD9HRiJvuqq+6DWBL3t
         bgeC3pS/xzdPcosqmpya2smClX2fJDI1DRV41K/RIXuoD0T+MKPNtZIW5cC54IynoVFN
         7HlO57ALxVkn9TEetckzvbbnqgKZNLbc81SIQtkDZz2wGiV5g6S1lsrmM33SjTXsjaVc
         5+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vK0av/1KNbMtPqjJFNrsdu65KYcBJQkA8uN0TYrwO0E=;
        b=p9nuZ6pIXlofrbhZtFhS3fMfpuwsdNkJMFeUncgbKuRvRNxBmOAenbXvlx7fPTvVQi
         N/vBUqFUPOSE7on0Hujq+0/4k0Xp4c8Q4e9pyp4AlgtfvcVGba2IIfwK4/k7Pmo9hhpm
         JyrrRwkifa8h/g8fF/SlDp9eBoEmaBkbW9fLqEiu/5eESf6FKBEbuuMXMsx8yNznXCqD
         CH5oKEM1ppEyDxre3Awr+gyAKh98oBIyfJYFeRffTn64fNpeN7uMwI9szGsGhdAj5AP6
         /XMq3aLsr8PRDAi29qV5FWTAalyvx0xR/QoQPbkZzKP+sZ3l7o2t2ue6OR58Hl6zfU7S
         0PKw==
X-Gm-Message-State: APjAAAWXDqWkx+eIFTGP2yDD6h+jhOFD0Y5IArPJHwq5xjM91H5WU35D
        icye65u1aqrIIiByVJOf0xjHQg==
X-Google-Smtp-Source: APXvYqxBeUMi30vSRlWaqWX6WRVZqF/HfW4QMrWulr536e8PZsP+3fO48m+tmlDUNT2DRlm5Sr1vAw==
X-Received: by 2002:a2e:3e0e:: with SMTP id l14mr40531647lja.125.1555348248470;
        Mon, 15 Apr 2019 10:10:48 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.85.61])
        by smtp.gmail.com with ESMTPSA id 73sm10768123ljf.72.2019.04.15.10.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 10:10:47 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Simon Horman <horms@verge.net.au>
Cc:     Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>,
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
 <a6bd1a3a-0c6f-6d2a-9270-f5819c34d4e7@cogentembedded.com>
 <20190415114548.4k3n7qvs4jd2vkce@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <57bf2b79-59ba-4c15-add3-e7029c0b20f4@cogentembedded.com>
Date:   Mon, 15 Apr 2019 20:10:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190415114548.4k3n7qvs4jd2vkce@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/15/2019 02:45 PM, Simon Horman wrote:

>>>>>>>> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
>>>>>>>> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
>>>>>>>> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
>>>>>>>>
>>>>>>>> This matches all ES versions of the affected SoCs as it is
>>>>>>>> not clear if this problem will be resolved in newer chips.
>>>>>>>> This can be revisited, as necessary.
>>>>>>>>
>>>>>>>> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
>>>>>>>> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
>>>>>>>> mode is not supported as there is a risk of introducing a regression
>>>>>>>> when used in conjunction with older DT blobs present in the field.
>>>>>>>
>>>>>>> Hi Simon
>>>>>>>
>>>>>>> I think it should at least WARN_ON(). Such blobs are broken, even if
>>>>>>> they do kind of work.
>>>>>>
>>>>>>    Good idea! Simon, third time's a charm? :-)
>>>>>
>>>>> Sure, can do.
>>>>
>>>> How about something like this?
>>>>
>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>> @@ -1980,8 +1987,14 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>>>>  		set |= APSR_DM_RDM;
>>>>  
>>>>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
>>>> -		set |= APSR_DM_TDM;
>>>> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
>>>> +		if (soc_device_match(ravb_delay_mode_quirk_match))
>>>> +			dev_warn(ndev->dev.parent,
>>>> +				 "phy-mode %s requires TX clock internal delay mode which is not supported by this hardwre revision",
>>>> +				 phy_modes(priv->phy_interface));
>>>
>>> Hi Simon
>>>
>>> The point of the warning is to tell users they should upgrade their DT
>>> blob to one that is not broken. So i think the message should say
>>> this. Also, we want users to notice this, which is why i said
>>> WARN_ON(). Something big so it gets noticed.
>>
>>    I agree in general but I guess you meant WARN() -- WARN_ON() doesn't take
>> a string arg...
> 
> Thanks, how about this?
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 4f648394e645..9618c4881c83 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1980,8 +1987,12 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>  		set |= APSR_DM_RDM;
>  
>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> -		set |= APSR_DM_TDM;
> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
> +		if (!WARN(soc_device_match(ravb_delay_mode_quirk_match),
> +			  "phy-mode %s requires TX clock internal delay mode which is not supported by this hardware revision. Please update device tree",
> +			  phy_modes(priv->phy_interface)))
> +			set |= APSR_DM_TDM;
> +	}
>  
>  	ravb_modify(ndev, APSR, APSR_DM, set);
>  }

   Looks fine, thanx! :-)

MBR, Sergei
