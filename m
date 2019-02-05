Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372FBC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E80CC2083B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="qyVzMX8M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbfBEIAy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 03:00:54 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44000 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfBEIAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 03:00:54 -0500
Received: by mail-lj1-f193.google.com with SMTP id q2-v6so2045281lji.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Feb 2019 00:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=td6hwu/7t2kElHE0E8rJa+7pWlsHHPSWUvJlW2cE0Ic=;
        b=qyVzMX8MBZahfW+8VlbPzlAipoC3d4nQuxQA16JEGn+7/mPuB+rwRZImHg3GH67twB
         9GtJKv+aqi18ZOE0ou47ECDP6PWydr+t5f+NYbXda37ew6HiHHiahebdwmJxSMj7rky/
         rjebkOMu40JHjbLBx62UXcUS4+3C4G0FvHN5u384LwkqMivEVGzxvkFKQLrj4Hk4h35R
         c/sm3A+rgwynGL/KfIOh2bvnOyYMn+MTJ/AACLTUwfDFEY5gBDpsHsUOTeRVdat4dkq6
         U31kUIJqeZSAPyTe/qs8GcaBItRDVfZvqTv1a/V0zW/t8qonV0BMY/rG4Z8a8eeR2BP8
         9wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=td6hwu/7t2kElHE0E8rJa+7pWlsHHPSWUvJlW2cE0Ic=;
        b=Q1FwG8EmoiXyk0XSQw9dwS4cUmYeMg8P02tvRD7+WMRhb+omd01K6kzuQwYcd7BreR
         t+9LuwvwQm4QkKxTp7X/6jPeidfX0UvhatSMnR2oAbjeQ9gNhluK2oFayxG6zhufCg+z
         Y1+QLhM5px5rFuJ09NWiqCQ6Ad3B/bDNLIpVLCMGd+0Y8+QnzoUT8LfXvtTwLRaUCchC
         niJycM5uhiUnLelQ6V1gbHdFLlBx56aVBAAw79XhjFTj2+JfmkM1dxcq0G648az0Tocj
         WIKZVnPxP3uOnvAOsYeRxFzw+DE/9ipT1PwOuNo2Q7grv4aLQBdGnaISkjvfQS+ccNuh
         Vsbw==
X-Gm-Message-State: AHQUAuZ17KJczrD/2C0WjOyMlbDjN8J4Jtap1Iv8o42vMq5K3vXqlBoC
        ToQpwhOsnUAYskDxbaa6EfOdOHAoArM=
X-Google-Smtp-Source: AHgI3Ia2ag16eM9OzK0Gm7VFld43KFIF68doU6J/bWOW26Ocnl5dA0O7RPcpc8v7PXfRQZk1uZmfsw==
X-Received: by 2002:a2e:8087:: with SMTP id i7-v6mr2038535ljg.179.1549353652062;
        Tue, 05 Feb 2019 00:00:52 -0800 (PST)
Received: from [192.168.0.199] ([31.173.86.146])
        by smtp.gmail.com with ESMTPSA id e19-v6sm3175861ljf.67.2019.02.05.00.00.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Feb 2019 00:00:50 -0800 (PST)
Subject: Re: [PATCH v2 0/7] sh_eth: implement simple RX checksum offload
To:     David Miller <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
 <20190204.133136.1764517040498341680.davem@davemloft.net>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <91342300-82c0-01c8-93cf-98d78827ebca@cogentembedded.com>
Date:   Tue, 5 Feb 2019 11:00:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190204.133136.1764517040498341680.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05.02.2019 0:31, David Miller wrote:

>> Here's a set of 7 patches against DaveM's 'net-next.git' repo. I'm implemeting
>> the simple RX checksum offload (like was done for the 'ravb' driver by Simon
>> Horman); it has been only tested on the R8A7740 and R8A77980 SoCs, the other
>> SoCs should just work (according to their manuals)...
> 
> Series applied, thanks.
> 
> There was a "tha" --> "the" typo in one of your commit messages which I
> fixed up.

    Indeed! Thank you. :-)

MBR, Sergei
