Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37127 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbeBPTp1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 14:45:27 -0500
Subject: Re: [PATCH v2] ravb: add support for changing MTU
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
 <aa1378e7-3d2f-fec0-7000-f7f62ddd6100@gmail.com>
 <4a960952-1283-275d-f2f9-1311c9468813@cogentembedded.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b3b37354-f7ee-d2ff-77ae-07bfc4eabe09@gmail.com>
Date: Fri, 16 Feb 2018 11:45:17 -0800
MIME-Version: 1.0
In-Reply-To: <4a960952-1283-275d-f2f9-1311c9468813@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/16/2018 11:43 AM, Sergei Shtylyov wrote:
> Hello!
> 
> On 02/16/2018 10:42 PM, Florian Fainelli wrote:
> 
>>> Allow for changing the MTU within the limit of the maximum size of a
>>> descriptor (2048 bytes). Add the callback to change MTU from user-space
>>> and take the configurable MTU into account when configuring the
>>> hardware.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> ---
>>
>>>  
>>> +static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
>>> +{
>>> +	if (netif_running(ndev))
>>> +		return -EBUSY;
>>> +
>>> +	ndev->mtu = new_mtu;
>>> +	netdev_update_features(ndev);
>>
>> Don't you somehow need to quiesce the RX DMA and make sure you that you
>> re-allocate all RX buffers within priv->rx_skb[q][entry] such that they
>> will be able to accept a larger buffer size?
>>
>> If we put the ravb interface under high RX load and we change the MTU on
>> the fly, can we crash the kernel?
> 
>    I thought the netif_running() check guards against that. Does it not?

It does, completely missed that, thanks!
-- 
Florian
