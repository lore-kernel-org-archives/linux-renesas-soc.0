Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C4CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 16:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37EC620872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 16:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="SSKnw9q7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbfAKQAi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 11:00:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46198 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbfAKQAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 11:00:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so13352180ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jan 2019 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5u6VPm1BfxgJqkg14Ke9KtS4R3km0xvqRqKvaN0SRNM=;
        b=SSKnw9q7gCy/JVUwSgc4sE/mrzf+uucyVroJ0yU/jRVbOQW3ZtXGkzhancVMBHU9UB
         f6XkOmjumtIlnDkRXEjky0J+n5Jt9KuuViUAncs6eCyJ44/9aBO9J+sbzoGH07b/8dvv
         NqirGR40phi9B1qCT9vKr21h6NORLS8+swrWsfPIZzRI7AP9pZD2askR54IRnDC6ziC7
         aMFWBt1ZYpch5r8/t0OcGJe8Od8VpEXzwARQbPi/NXeRG9p/gf1DkJ+c3ns9Pkad5V5/
         BF0ZH+aLdwDDckDODBveKy2s/+GMHzWCNd2hwzedwzqX7hBUDYOCWfhj+aTPa7l7ocNk
         9ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5u6VPm1BfxgJqkg14Ke9KtS4R3km0xvqRqKvaN0SRNM=;
        b=AxUqsswqC2/ZEYMeZosArsXTlx0PzVO4bsrVmAIvF71RaC921B8M2FQm2Y2RSinJnI
         bPot7JGcOAWCAHWVsxYCqjKpZgGAmGUFCrZB2kzh0cOe7wBc6P0vNX+yC7CituxsucRR
         6yC7HMdQSK6szoABGLzuhucb6JMIBKUrxdR61QkFEXF5U9qUyOpFqsA5nCPxUmSH4YY7
         EaQ5eCtU+hgNAHx+CFR/ivGPSBd9ao+rZpWCbUPKTEaUx3KBgUy6EieYhvl3aizhFA/Y
         oG+f5vQ81h/gWL4e4fKcZ4KAL3I54kmz7EOkBKEH2nkGG8M0D1IHj8EQ7U264FfRjGYC
         f2YA==
X-Gm-Message-State: AJcUukc90Ywx4bYMlIA7yqX02LmQpaEw6Zj1KR8aFisdDwuS7ZipgMqN
        Js/N2G3dRm0RVifK0VMKsIa2mkeU+F8=
X-Google-Smtp-Source: ALg8bN4jnPlTTjBvpsLhkceIDdh8W5XGLq8gax9/tue2GIgpbagEhQ6cCx6QR6guuBGn4vKaerIEtg==
X-Received: by 2002:a2e:9a84:: with SMTP id p4-v6mr8816508lji.73.1547222435695;
        Fri, 11 Jan 2019 08:00:35 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.86])
        by smtp.gmail.com with ESMTPSA id a62sm14806191lfa.37.2019.01.11.08.00.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 08:00:34 -0800 (PST)
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
To:     Simon Horman <horms@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
 <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
 <20190111133502.dma5hft5wgowdg6l@verge.net.au>
 <c4b650e0-709b-d078-e094-41b652603906@cogentembedded.com>
 <20190111154843.k7pejayjrkwvj4pp@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fb5f58c4-a7c9-521e-aab2-cdb3747ca524@cogentembedded.com>
Date:   Fri, 11 Jan 2019 19:00:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190111154843.k7pejayjrkwvj4pp@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/11/2019 06:48 PM, Simon Horman wrote:

>>>>> EtherAVB may provide a checksum of packet data appended to packet data. In
>>>>> order to allow this checksum to be received by the host descriptor data
>>>>> needs to be enlarged by 2 bytes to accommodate the checksum.
>>>>>
>>>>> In the case of MTU-sized packets without a VLAN tag the
>>>>> checksum were already accommodated by virtue of the space reserved for the
>>>>> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
>>>>> packet data space provided by a descriptor leaving no space for the
>>>>> trailing checksum.
>>>>
>>>>    Wait! The gen3 manual is rather clear about the auto-checksumming not working
>>>> right in the presence of the VLAN tag. Where do you check for that case?
>>>
>>> In my testing on E3 this works correctly. Which portion of
>>> the manual are you referring to?
>>
>>    Section 50.4.1 in R-Car Series, 3rd Generation User’s Manual: Hardware, Rev 1.00,
>> section 45A.3.14.1 in R-Car Series, 2nd Generation User’s Manual: Hardware, Rev 2.00.
>>    The problem is that the checksum is always calculated starting at byte
>> 14, i.e.  amidst the VLAN header (if present).
> 
> Yes, I understand that. What I'm unclear on is why that is a problem.
> Empirically I have observed that RX csum offload works in the presence
> of a VLAN tag and offers a significant benefit in terms of reduced CPU
> utilisation.

   I thought we're offloading an IP checksum? And in case of VLAN the IP datagram
starts 4 bytes further into a packet? Maybe I'm just misunderstanding things...

>>>>> This was not detected by the driver which incorrectly used the last two
>>>>> bytes of packet data as the checksum and truncate the packet by two bytes.
>>>>> This resulted all such packets being dropped.
>>>>>
>>>>> A work around is to disable rx checksum offload
>>>>>  # ethtool -K eth0 rx off
>>>>>
>>>>> This patch resolves this problem by increasing the size available for
>>>>> packet data in rx descriptors by two bytes. It also introduces
>>>>> RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
>>>>> over the driver.
>>>>
>>>>    What about using sizeof(__sum16) instead? That type is declared in
>>>> <linux/types.h> and used in 'struct iphdr'...
>>>
>>> As in the following?
>>>
>>> #define RAVB_CSUM_LEN sizeof(__sum16)
>>
>>    No, as I said, I'd prefer to avoid any driver specific #define's.
> 
> If that is your preference I can update the patch accordingly.

   Please do. :-)

>>>>> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
>>>>>
>>>>> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
>>>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>>> [...]

MBR, Sergei
