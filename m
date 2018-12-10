Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f49.google.com ([209.85.167.49]:35672 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbeLJUMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 15:12:01 -0500
Received: by mail-lf1-f49.google.com with SMTP id e26so8992997lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 12:12:00 -0800 (PST)
Subject: Re: [PATCH/RFT net] ravb: expand rx descriptor data to accommodate hw
 checksum
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Miller <davem@davemloft.net>, horms+renesas@verge.net.au
Cc: magnus.damm@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20181210085917.23056-1-horms+renesas@verge.net.au>
 <20181210.114403.1590402440504388038.davem@davemloft.net>
 <364a7abd-6050-eaa6-5dbe-1c2aaf31c0bc@cogentembedded.com>
Message-ID: <c0e7450e-3d15-e7bd-d0a6-125b725f6870@cogentembedded.com>
Date: Mon, 10 Dec 2018 23:11:57 +0300
MIME-Version: 1.0
In-Reply-To: <364a7abd-6050-eaa6-5dbe-1c2aaf31c0bc@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/10/2018 10:51 PM, Sergei Shtylyov wrote:

>>> +#define RAVB_CSUM_LEN 2
>>> +
>>  ...
>>>  	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
>>> -		ETH_HLEN + VLAN_HLEN;
>>> +		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;
>>  ...
>>> +	if (unlikely(skb->len < RAVB_CSUM_LEN))
>>  ...
>>> -	hw_csum = skb_tail_pointer(skb) - 2;
>>> +	hw_csum = skb_tail_pointer(skb) - RAVB_CSUM_LEN;
>>  ...
>>> -	skb_trim(skb, skb->len - 2);
>>> +	skb_trim(skb, skb->len - RAVB_CSUM_LEN);
>>
>> Unlike Sergei, I think this macro define should be kept in the fix.
>>
>> It is absolutely crucial for anyone reading this code to understand
>> what this value is all about.
>>
>> People reading the code aren't able to go automatically back to a
>> commit to learn what this value means, and even if they could they
>> shouldn't have to do so for a bunch of magic '2' constants placed all
>> over.
> 
>    We already have a comment in ravb_tx_csum(), I only asked for another one

   Sorry, ravb_rx_csum(), of course. Those keys are dangerously close to each other. :-)

> (the place where we fix up the packet size). 

[...]

MBR. Sergei
