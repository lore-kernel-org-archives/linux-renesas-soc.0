Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708CFC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 15:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41CC220833
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 15:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="0S+gA42y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfDIPD3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 11:03:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39798 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfDIPD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 11:03:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id l7so14774524ljg.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Apr 2019 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6kWdWsmIMSDl7fmu0OMcFf7UumHlwLsbVs+b9D+JJbc=;
        b=0S+gA42ybhNFcI/tA+FLyRUGzZYxU/uecpSDDJnt+Xc00AjdL5sYObl5b+2+NISciR
         LRTUJiEN4LplrAHar4q5Ef5K9EOoee1JRC/BiHXzcs37eQexhIGKoqxgaBTbBTEPRBVP
         XEuDTs/jBIqy0d1r4jz+A6tJykpiSaHUlw2srXA7eA4HmFeMufGh/9YmQcFI578rDNiJ
         MGwNqXwN4MimhvnxhZtV+HrzC+QjN6ImPVAhTdxYlJSc67kCwcWWbQRS5EdnkndD4O2t
         4SCOcnYh3qtMNO2lhh2Gndhl2PmliRY98YopRHWBCy0lQVAk/cLRgJrXI26AAs2d6nvM
         X8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6kWdWsmIMSDl7fmu0OMcFf7UumHlwLsbVs+b9D+JJbc=;
        b=pgQDSroj45tCXnFfNXOkoxM3D1WtSUQRjFaJ7zaayl6ZghUsAz7LOlDBCttxKJCSem
         8o+QAxoVABxAKU/+/3PYLwJnXL42pgX1gbZaGBFbdqkuNmPw6NmZ7+9Zpa7GADlteO0/
         fauWaLCeOAvnPgpV/t6MoXB5RAiY/QquT4dfTwkeajLmK/EXqF+yEEAZlCDsbxErngvD
         1Qgrep8hVTuybmqAxFv3YAd7puSWTp4G+nOaBpEH561NuQt1rQ94f+ZTq98AaYgfIZGk
         OoYO2f2tiWFl56AX7spzmEvZZedkhYBccfdyk4JepOzk8+SekLa89tN+5hLFgfwm+fBU
         OJJA==
X-Gm-Message-State: APjAAAU5Q8BgWI89AU3h4aBRQjVvduTQVBHaQiXt+G5p8ABm0bOwQun0
        UiAkMj1tQRxMwcLdlaNEILVCzQ==
X-Google-Smtp-Source: APXvYqwGObdqukOl+mgcSbXpR7vEMzhCIMlJihfNomDxNjNzGZ3zvCNisiX+RUbgW0hUmKUhkeejjA==
X-Received: by 2002:a2e:9619:: with SMTP id v25mr19435117ljh.145.1554822206713;
        Tue, 09 Apr 2019 08:03:26 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.214])
        by smtp.gmail.com with ESMTPSA id v13sm6860725lje.84.2019.04.09.08.03.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 08:03:25 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Simon Horman <horms@verge.net.au>, Andrew Lunn <andrew@lunn.ch>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
 <20190408174903.GD15267@lunn.ch>
 <20190409104523.nunbq6mz5633hx2m@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fa729acf-33cd-4766-10a5-bdbd21f29262@cogentembedded.com>
Date:   Tue, 9 Apr 2019 18:03:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190409104523.nunbq6mz5633hx2m@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 04/09/2019 01:45 PM, Simon Horman wrote:

>>>> @@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>>>>  	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
>>>>  		set |= APSR_DM_RDM;
>>>>  
>>>> -	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
>>>> +	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> +	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
>>>> +	    !soc_device_match(ravb_delay_mode_quirk_match))
>>>
>>>    But don't we need to error out of the probing as we can't set the delay mode
>>> requested?
>>
>> Yes, if we can, we should error out. It just depends on if there are
>> broken DT blobs out there. We recently had a lot of pain from broken
>> DT blobs using the at803x PHY and getting RGMII modes wrong. In the
>> long run, it is best to if DT, but i've no idea how many boards are
>> affected.
> 
> Hi Andrew,
> 
> I suspect there are such blobs out there and I'm not sure
> what the fall-out may or may not be.

   You mean the out-of-tree blobs? Because I'm not seeing any in-kernel
breakage... 

MBR, Sergei
