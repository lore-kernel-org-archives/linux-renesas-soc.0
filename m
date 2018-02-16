Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34753 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751005AbeBPTn7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 14:43:59 -0500
Received: by mail-lf0-f65.google.com with SMTP id l191so5525943lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 11:43:59 -0800 (PST)
Subject: Re: [PATCH v2] ravb: add support for changing MTU
To: Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
 <aa1378e7-3d2f-fec0-7000-f7f62ddd6100@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4a960952-1283-275d-f2f9-1311c9468813@cogentembedded.com>
Date: Fri, 16 Feb 2018 22:43:56 +0300
MIME-Version: 1.0
In-Reply-To: <aa1378e7-3d2f-fec0-7000-f7f62ddd6100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 02/16/2018 10:42 PM, Florian Fainelli wrote:

>> Allow for changing the MTU within the limit of the maximum size of a
>> descriptor (2048 bytes). Add the callback to change MTU from user-space
>> and take the configurable MTU into account when configuring the
>> hardware.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> ---
> 
>>  
>> +static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
>> +{
>> +	if (netif_running(ndev))
>> +		return -EBUSY;
>> +
>> +	ndev->mtu = new_mtu;
>> +	netdev_update_features(ndev);
> 
> Don't you somehow need to quiesce the RX DMA and make sure you that you
> re-allocate all RX buffers within priv->rx_skb[q][entry] such that they
> will be able to accept a larger buffer size?
> 
> If we put the ravb interface under high RX load and we change the MTU on
> the fly, can we crash the kernel?

   I thought the netif_running() check guards against that. Does it not?
 
MBR, Sergei
