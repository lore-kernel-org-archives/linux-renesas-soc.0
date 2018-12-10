Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:43360 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbeLJToF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 14:44:05 -0500
Date: Mon, 10 Dec 2018 11:44:03 -0800 (PST)
Message-Id: <20181210.114403.1590402440504388038.davem@davemloft.net>
To: horms+renesas@verge.net.au
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT net] ravb: expand rx descriptor data to accommodate
 hw checksum
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181210085917.23056-1-horms+renesas@verge.net.au>
References: <20181210085917.23056-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>
Date: Mon, 10 Dec 2018 09:59:17 +0100

> +#define RAVB_CSUM_LEN 2
> +
 ...
>  	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
> -		ETH_HLEN + VLAN_HLEN;
> +		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;
 ...
> +	if (unlikely(skb->len < RAVB_CSUM_LEN))
 ...
> -	hw_csum = skb_tail_pointer(skb) - 2;
> +	hw_csum = skb_tail_pointer(skb) - RAVB_CSUM_LEN;
 ...
> -	skb_trim(skb, skb->len - 2);
> +	skb_trim(skb, skb->len - RAVB_CSUM_LEN);

Unlike Sergei, I think this macro define should be kept in the fix.

It is absolutely crucial for anyone reading this code to understand
what this value is all about.

People reading the code aren't able to go automatically back to a
commit to learn what this value means, and even if they could they
shouldn't have to do so for a bunch of magic '2' constants placed all
over.

Even in the most fundamental way, the macro is required to satisfy
the "no magic constants" rule for kernel code.
