Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4415DC282C7
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 15:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12FD520882
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 15:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="RLWDJvJ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfA2Pnv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 10:43:51 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45130 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfA2Pnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 10:43:50 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so14943140lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jan 2019 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V4BS+86bvopcMpQ0KAdqjXEiaoi+r1fwNGFbn+CuKuE=;
        b=RLWDJvJ0XrNIztF/FP9mCmTsjRZbCQcIeE9xw5v0A9RHxS02dkBGvyL2j39Xlh1dZj
         9aR0isGzRSwHrpHLj6jBggfzCOCTIBIJApxb96R78zofjL3hfiYvM1jaT9ZUaUEFurs+
         7V/rkWed4Pg/TBNSY/IBAcGhzCGoYWfyAbn80gmQcI3NDhbbhIq2CIjy2WVSLsEFJpzV
         UPezuF1lcvhrjlGB9DrjYVGsSMS0f1qNmLI08w4W8mpbkxM2FRJHXAsDQnsBbck/B42i
         j5z5CEEfeasnkgZxquHXp7Apw7n7kCu0YxXruAah0ML56n0bUbLL7M70p7y52R8OLajh
         vM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=V4BS+86bvopcMpQ0KAdqjXEiaoi+r1fwNGFbn+CuKuE=;
        b=KQZzWuu6NsGmjxmbRr7pj22TUAhA4EBfVe3e1/7Ghfn+LKZhkwveUV/rsMAaPW/6P2
         oIPfHodDGd9RLJarlsJMliqeUjhZmAwPLgPcowYRmLN0PaDFDtkXaXWDGBTcuGMRKtIn
         q6u91kUBEZfD8l54BfeUL1NN2avPrDF6rep/ux8vEFZRFFg4sOoI/HbC45Y6RHcbiequ
         ChSicq1bGyeC4n3WFlYs+tDQfFUNd2lPA/Rk67397auzEJF/Up4a6ZM6x8DDUz56GMA4
         QSFHv8spLo5hEs33XodIRgiQBPJdgLuU+E6Ed29PnKRw0k79n+rHpDpydhErkwGkUzGT
         8X9Q==
X-Gm-Message-State: AJcUukdCMmLgR8CQC+YRZt2ag/IObarxw7iZXXgPH08oXgrv1v9LD70e
        kMM0cbHYLQ+ca0nziLqYsIaBLQ==
X-Google-Smtp-Source: ALg8bN7udCc2XyzfZH2GPTdK45fL+2rDL2IQYvluvgeyMzLJbFKym+FPeC7JWjvBdRoClAM2PXcHNw==
X-Received: by 2002:ac2:42c5:: with SMTP id n5mr12134245lfl.115.1548776627885;
        Tue, 29 Jan 2019 07:43:47 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.149])
        by smtp.gmail.com with ESMTPSA id 65sm3605933lfp.55.2019.01.29.07.43.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 07:43:46 -0800 (PST)
Subject: Re: [PATCH 2/7] sh_eth: RX checksum offload support
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <29cb4d33-37c3-43c0-3bce-fa01737c0fa4@cogentembedded.com>
 <20190128121855.t5w3us6kd7o6niph@verge.net.au>
 <d95fff4f-7750-87c4-3664-eb5efb593b75@cogentembedded.com>
 <20190129075810.rqeekk5j4npjh6wf@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <319141ef-caa5-2140-2920-c471dac086ea@cogentembedded.com>
Date:   Tue, 29 Jan 2019 18:43:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190129075810.rqeekk5j4npjh6wf@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/29/2019 10:58 AM, Simon Horman wrote:

>>>> Add support for the RX checksum offload. This is enabled by default and
>>>> may be disabled and re-enabled using 'ethtool':
>>>>
>>>> # ethtool -K eth0 rx {on|off}
>>>>
>>>> Some Ether MACs provide a simple checksumming scheme which appears to be
>>>> completely compatible with CHECKSUM_COMPLETE: sum of all packet data after
>>>> the L2 header is appended to packet data; this may be trivially read by
>>>> the driver and used to update the skb accordingly. The same checksumming
>>>> scheme is implemented in the EtherAVB MACs and now supported by tha 'ravb'
>>>> driver.
>>>>
>>>> In terms of performance, throughput is close to gigabit line rate with the
>>>> RX checksum offload both enabled and disabled.  The 'perf' output, however,
>>>> appears to indicate that significantly less time is spent in do_csum() --
>>>> this is as expected.
>>>
>>> Nice.
>>>
>>> FYI, this seems similar to what I observed for RAVB, perhaps on H3 I don't
>>> exactly recall. On E3, which has less CPU power, I recently observed that
>>> with rx-csum enabled I can achieve gigabit line rate, but with rx-csum
>>> disabled throughput is significantly lower. I.e. on that system throughput
>>> is CPU bound with 1500 byte packets unless rx-csum enabled.
>>
>>    Unfortunately, we can't teset these patches on the other gen3 boards. ISTR
>> you have RZ/A1H board... if it's still with you, I'd appreciate testing.
> 
> Unfortunately, as of a few weeks ago, I no longer have that board.
> 
>>> Next point:
>>>
>>> 2da64300fbc ("ravb: expand rx descriptor data to accommodate hw checksum")
>>> is fresh in my mind and I wonder if mdp->rx_buf_sz needs to grow to ensure
>>> that there is always enough space for the csum.
>>
>>    Well, if you look at sh_eth_ring_init(), you'll see that the driver reserves
>> plenty of space at the end the RX buffers.
> 
> Yes, I see that. And I assume that was enough space before this patch.
> But is it still enough space now that 2 bytes are needed for the hardware csum?

  To quote the source:

	/* +26 gets the maximum ethernet encapsulation, +7 & ~7 because the
	 * card needs room to do 8 byte alignment, +2 so we can reserve
	 * the first 2 bytes, and +16 gets room for the status word from the
	 * card.
	 */
	mdp->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ :
			  (((ndev->mtu + 26 + 7) & ~7) + 2 + 16));

   I have no idea what they mean by status word and why it takes 16 bytes (and I even
have the R8A771x manual!) but I think these 16 bytes are where our checksum goes...
that's why I said there's plenty of space. :-)

> 2 bytes that might have previously been used as packet data in some
> circumstances.
> 
>>> In particular, have you
>>> tested this with MTU-size frames with VLANs. (My test is to run iperf3 over
>>> a VLAN netdev, netperf over a VLAN netdev would likely work just as well.)
>>
>>    Could you refresh me on how to bring up a VLAN on a given interface?
> 
> You will need a kernel with CONFIG_VLAN_8021Q enabled.
> 
> Then you can do something like this:
> 
> 	ip link add link eth0 name eth0.1 type vlan id 1
> 	ip addr add 10.1.1.100/24 dev eth0.1
> 	ip link set dev eth0.1 up

  Thank you! I'm not familiar with 'ip' at all, thought 'ifconfig' could do the same
thing easier but couldn't remember all the needed incantations... :-)
   Anyway, it worked!

>> [...]
>>>> The above results collected on the R-Car V3H Starter Kit board.
>>>>
>>>> Based on the commit 4d86d3818627 ("ravb: RX checksum offload")...
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> [...]

MBR, Sergei

