Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34058 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750879AbdALMDL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 07:03:11 -0500
Received: by mail-lf0-f47.google.com with SMTP id v186so11482980lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 04:03:10 -0800 (PST)
Subject: Re: [PATCH/RFC v2 net-next] ravb: unmap descriptors when freeing
 rings
To: Simon Horman <horms@verge.net.au>
References: <1483613000-537-1-git-send-email-horms+renesas@verge.net.au>
 <6fcec500-bed6-ffa3-2887-d45b34703682@cogentembedded.com>
 <20170112091116.GC7724@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3e1d4324-4288-8d65-56fd-8c3e7283020b@cogentembedded.com>
Date: Thu, 12 Jan 2017 15:03:05 +0300
MIME-Version: 1.0
In-Reply-To: <20170112091116.GC7724@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2017 12:11 PM, Simon Horman wrote:

>>> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>>>
>>> "swiotlb buffer is full" errors occur after repeated initialisation of a
>>> device - f.e. suspend/resume or ip link set up/down. This is because memory
>>> mapped using dma_map_single() in ravb_ring_format() and ravb_start_xmit()
>>> is not released.  Resolve this problem by unmapping descriptors when
>>> freeing rings.
>>>
>>> Note, ravb_tx_free() is moved but not otherwise modified by this patch.
>>>
>>> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>>> [simon: reworked]
>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>> --
>>> v1 [Kazuya Mizuguchi]
>>>
>>> v2 [Simon Horman]
>>> * As suggested by Sergei Shtylyov
>>>  - Use dma_mapping_error() and rx_desc->ds_cc when unmapping RX descriptors;
>>>    this is consistent with the way that they are mapped
>>>  - Use ravb_tx_free() to clear TX descriptors
>>
>>    Not sure that was good idea (sorry)... ravb_tx_ring() only unmaps the
>> transmitted buffers, while we need to unmap everything...
>>
>>> * Reduce scope of new local variable
>>> ---
>>> drivers/net/ethernet/renesas/ravb_main.c | 89 ++++++++++++++++++--------------
>>> 1 file changed, 51 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 92d7692c840d..1797c48e3176 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -179,6 +179,44 @@ static struct mdiobb_ops bb_ops = {
>>> 	.get_mdio_data = ravb_get_mdio_data,
>>> };
>>>
>>> +/* Free TX skb function for AVB-IP */
>>> +static int ravb_tx_free(struct net_device *ndev, int q)
>>> +{
>>> +	struct ravb_private *priv = netdev_priv(ndev);
>>> +	struct net_device_stats *stats = &priv->stats[q];
>>> +	struct ravb_tx_desc *desc;
>>> +	int free_num = 0;
>>> +	int entry;
>>> +	u32 size;
>>> +
>>> +	for (; priv->cur_tx[q] - priv->dirty_tx[q] > 0; priv->dirty_tx[q]++) {
>>> +		entry = priv->dirty_tx[q] % (priv->num_tx_ring[q] *
>>> +					     NUM_TX_DESC);
>>> +		desc = &priv->tx_ring[q][entry];
>>> +		if (desc->die_dt != DT_FEMPTY)
>>
>>    Here, it stop once an untransmitted buffer is encountered...
>
> Yes, I see that now.
>
> I wonder if we should:
>
> a) paramatise ravb_tx_free() so it may either clear all transmitted buffers
>    (current behaviour) or all buffers (new behaviour).
> b) provide a different version of this loop in ravb_ring_free()
>
> What are your thoughts?

    I'm voting for (b).

[...]

MBR, Sergei
