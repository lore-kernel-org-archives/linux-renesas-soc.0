Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5875BC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 289C221741
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:45:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="p4HHMlyR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfA1Ppa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 10:45:30 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40784 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfA1Ppa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 10:45:30 -0500
Received: by mail-lf1-f65.google.com with SMTP id v5so12181050lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cgZtdqWkc6mV6i/XlpC0B0hwRlqTi7jLUMGgLPsftfA=;
        b=p4HHMlyRlixb1qZWoJwFyTYel983uyYkcuRZ9VMtY7vlRxbhBZAPcwCcNm0e99qA1h
         RY45Tj9FXw5BPqHRJWbkPvnKFS4K0uOYZUk42d3D+LxMr49Y6//WIcrcxzwj8dapl15P
         57m2MM3LN6vn+p5MTVx8KzeHKsiqY9M464L1oW84iozVahnHJCTnGHhsqS/B1AtlS6U8
         UqrR5REky/O21ewJacMUBB8Xm+z7Ulsh5J5nRmADwBmLf2FEdfFmfDN+dH/ijv04QtdX
         yPevrzbbc3ckdn+jj/YALjR2CnCXTHMncfQbx2xOkaGV+8jdDfTZK2B+L5rIkRO0orLK
         3fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cgZtdqWkc6mV6i/XlpC0B0hwRlqTi7jLUMGgLPsftfA=;
        b=eC+JatKFXPSOp/5WH8R4Sm9uLCQGEzFvY1jt03vdA/2KRltLaqohJJFm/ohDXdSDJD
         7tWhSm7FYru3fCGcBkmINdJMK6lON0ayYb9vOc9rR1idjGcMQNUMzIc+wMBEgZrRf/E/
         LmovDsTTvcsgcWVtU2XzJyHbqDFctWczOo1CGFI26TaHSpf/Ut9dnG9B10PZzgLOsJbV
         rGgsn/P65bLxmFyXeGfpmywVHa1A11hy95khg32ncIVgKSWot1li8h/XeztEX1qDCC0h
         Ej7qGb8d0Q4w+4q+CruCidoT+0Lqne26asz9I1JEQF8goiomc1Adm5C8MmQ6Sfuk4fnF
         AOjA==
X-Gm-Message-State: AJcUukfz/QstJpSJLVwR+Z6p3bZz1ehoV791YXT7y6Xhvv7QmIcnKQkS
        ZBA57b6NVHRu+rXc68suq6R68w==
X-Google-Smtp-Source: ALg8bN4ELZuJm2CvWv9JlwqeE0aAC+8M6IVaDnZ2GrD5bxfwn4HmWEi0ozBVqSLRRD8xtrNrQ7uuSA==
X-Received: by 2002:a19:980f:: with SMTP id a15mr16835357lfe.103.1548690328172;
        Mon, 28 Jan 2019 07:45:28 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.148])
        by smtp.gmail.com with ESMTPSA id e97-v6sm3117906lji.51.2019.01.28.07.45.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 07:45:27 -0800 (PST)
Subject: Re: [PATCH 2/7] sh_eth: RX checksum offload support
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <29cb4d33-37c3-43c0-3bce-fa01737c0fa4@cogentembedded.com>
 <20190128121855.t5w3us6kd7o6niph@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d95fff4f-7750-87c4-3664-eb5efb593b75@cogentembedded.com>
Date:   Mon, 28 Jan 2019 18:45:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190128121855.t5w3us6kd7o6niph@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/28/2019 03:18 PM, Simon Horman wrote:

>> Add support for the RX checksum offload. This is enabled by default and
>> may be disabled and re-enabled using 'ethtool':
>>
>> # ethtool -K eth0 rx {on|off}
>>
>> Some Ether MACs provide a simple checksumming scheme which appears to be
>> completely compatible with CHECKSUM_COMPLETE: sum of all packet data after
>> the L2 header is appended to packet data; this may be trivially read by
>> the driver and used to update the skb accordingly. The same checksumming
>> scheme is implemented in the EtherAVB MACs and now supported by tha 'ravb'
>> driver.
>>
>> In terms of performance, throughput is close to gigabit line rate with the
>> RX checksum offload both enabled and disabled.  The 'perf' output, however,
>> appears to indicate that significantly less time is spent in do_csum() --
>> this is as expected.
> 
> Nice.
> 
> FYI, this seems similar to what I observed for RAVB, perhaps on H3 I don't
> exactly recall. On E3, which has less CPU power, I recently observed that
> with rx-csum enabled I can achieve gigabit line rate, but with rx-csum
> disabled throughput is significantly lower. I.e. on that system throughput
> is CPU bound with 1500 byte packets unless rx-csum enabled.

   Unfortunately, we can't teset these patches on the other gen3 boards. ISTR
you have RZ/A1H board... if it's still with you, I'd appreciate testing.

> Next point:
> 
> 2da64300fbc ("ravb: expand rx descriptor data to accommodate hw checksum")
> is fresh in my mind and I wonder if mdp->rx_buf_sz needs to grow to ensure
> that there is always enough space for the csum.

   Well, if you look at sh_eth_ring_init(), you'll see that the driver reserves
plenty of space at the end the RX buffers.

> In particular, have you
> tested this with MTU-size frames with VLANs. (My test is to run iperf3 over
> a VLAN netdev, netperf over a VLAN netdev would likely work just as well.)

   Could you refresh me on how to bring up a VLAN on a given interface?

[...]
>> The above results collected on the R-Car V3H Starter Kit board.
>>
>> Based on the commit 4d86d3818627 ("ravb: RX checksum offload")...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
