Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613424;
	b=KUGQCSvinyYfAVdF1+GZ0Uk7nijr7SKSfQJRIFe+EewiSRHoFtM4uMFcIWJawUSxUksp
	 9jLU+t+an0ja6Ns0YyvgmVEPnGu6DBdUUxrGHhuouPVyoCWAYuZpKi/MU4qzODdw9V+6f
	 TfKdN/GvARpnfPijmrTjdeM8uqbnwVjqBmPIcV2JLsUN/8hNDSwJbLBSjVa/JtsQZDgVl
	 K6HS5Q/IpGgVMDhlNvGCn5TZInDk8yaeylJCdpQMINXcm6n1vVMqDR8qNAPUYsUZIqDjZ
	 la41x82YFxuW2fF+9Fhkac4x+VBG6LvAqYdN+sJ3F1ZmwO43hvdCvdAKIkrJBPmSDcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613424;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=K2ju9qj8VW7F0OaAq/MmzwyhBksHQqR8HS2jOmsdH9M=;
	b=Dcea1UY9IJAEmxe3JWfZ3oNTPE+N4b0GaBRIcUGJ+QXI0q6USq3qjfvK4PUqe73k5t8y
	 Zc3X6ZVJORGHBi+iL+Uw+DnHyv4umrseMEC/sfSHP/WzEEfflRQ3iglcU8c1+VwWgaF6U
	 rkYZjAZ8jitsKLX3EptCW5Po4cEbgDyJiNG1JZGVlMF8G8AQUVqDyzWC+PK7ZjuFP+d6Y
	 KIIlhVQtPDSmOvjO5aW8yQwSFJETJclzNmX0Et29ln6tDH3nL/743PtR/CyOfTXentxj9
	 PTiX+IGofl3r7B5foIp5aLbEuIrYFjI+vkVKjYXCwbP7fvgzh8Wbjj+T52jVKlQhu0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eFigLCy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1266606A31E;
	Wed, 25 Nov 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFigLCy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A73A1F000C6;
	Wed, 25 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613424;
	bh=K2ju9qj8VW7F0OaAq/MmzwyhBksHQqR8HS2jOmsdH9M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eFigLCy/qHxP/IG/Ib86GzqMKh9R3nM91EMHHjqEw1c6Wk6rvG0JJlhNhVgiFnCzt
	 ueSxu750Kzf2JaP0c3ikK5daCp6C/kzXUiC2SJRGgxC0n9YtT+X+hccxcCM8iTn4MD
	 SURxlTf8eynHBsK3H2BdbF7FVy5Us4jb++GAOtbbw0OpxNhgp2SJpdCbV4VK9Deq4I
	 aErE3FO36vzIqL+MLHjwzeflMsYCBwbAkFYmnM80meqqhWnvryMt/0C49+yKoUHEib
	 qwEy3MzGCKH6kDRs6Y+vuDTkCT6QSa88QdAwuOSzVNSK9im0A2Y2LYicR80m8GDAhl
	 Du4M3Ip91bUuw==
Subject: Re: [PATCH net v2] net: stmmac: Advertise TX checksum offload only
 when supported
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vinschen@redhat.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Wed, 25 Nov 2026 13:30:22 +0000
Message-ID: <179561342293.3135.3941627441868252725@kernel.org>
In-Reply-To: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix does not cover the bugged_jumbo case, so DSA user
  ports can still advertise TX checksum offload that the stmmac conduit…

--

I found one possible regression: on bugged_jumbo cores, DSA user ports can still show TX checksum offload after the conduit has turned it off. The draft reply for the list follows.

net: stmmac: Advertise TX checksum offload only when supported

This patch changes __stmmac_dvr_probe() to add NETIF_F_IP_CSUM and
NETIF_F_IPV6_CSUM to hw_features only when priv->plat->tx_coe is set.
The aim is to keep TX checksum flags that stmmac_fix_features() later
clears out of vlan_features. DSA user ports inherit vlan_features.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..d32d3e7b1b8c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
>  	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
>  
> -	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
> -			    NETIF_F_RXCSUM;
> +	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
> +	if (priv->plat->tx_coe)
> +		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;

[Severity: Medium]
Does this cover every case where the conduit drops TX checksum offload?
stmmac_fix_features() has a second reason to clear these flags, and it
depends on the MTU:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
    ...
	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
		features &= ~NETIF_F_CSUM_MASK;
    ...
}

In stmmac_probe_config_dt(), the snps,dwmac-3.40a compatible sets both
tx_coe and bugged_jumbo. The snps,dwmac-3.610 and snps,dwmac-3.710
compatibles set bugged_jumbo, and tx_coe comes from dma_cap.

On those cores the new tx_coe check still passes. The checksum flags are
then copied into vlan_features once, during probe, while the MTU is still
1500:

	ndev->vlan_features |= ndev->features;

When such a stmmac is a DSA conduit, the DSA setup raises its MTU:

dsa_conduit_setup()
  dev_set_mtu(dev, ETH_DATA_LEN + tag overhead)
    stmmac_change_mtu()
      netdev_update_features()
        stmmac_fix_features()    /* clears NETIF_F_CSUM_MASK */

This clears the checksum bits from conduit->features only. vlan_features
is not updated afterwards.

The user ports take their features from conduit->vlan_features in
dsa_user_setup_tagger() and dsa_user_create():

	user->features = conduit->vlan_features | NETIF_F_HW_TC;
	...
	user_dev->vlan_features = conduit->vlan_features;

Nothing in net/dsa appears to react to NETDEV_FEAT_CHANGE on the conduit.

So could the user ports still advertise IP_CSUM and IPV6_CSUM while the
conduit has them turned off? That looks like the same symptom the commit
message says this patch removes:

  "DSA user ports inherit vlan_features and can therefore advertise TX
  checksum offload even though the conduit cannot perform it."

Packets should still be correct, because validate_xmit_skb() on the
conduit falls back to software checksumming. The problem is limited to
which features are reported.

Would it make sense to also clear in vlan_features whatever
stmmac_fix_features() clears, or to handle this on the DSA side, so that
bugged_jumbo conduits are covered as well?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124132802.2003605-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
