Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464369;
	b=jQklHY2lJQ+1ZKtNymGrtV4PkKrnaYhuY1scqTkTC6C1nPNgBj5NTa+FYZIB9e5owo9T
	 m6cXx1HT1xUjKLfg5qodaj7B0Y7EWkfDrAzqF7Wit9/hkGe0B9Ed1KlFoYsMIwVgLZcrX
	 ZjmbzDuvCSMqrpBU/mrRFA2A3ndH0vBsFjtMmnJs33PmaIWTPwkmZ2kc49iSuXBKpLwbv
	 NXUN9dNMOy3Gh+GOWWnc8N3Orpi7vjUOK9yTjAkiuZN7k1lUS5slAYFSEqlj7IEH134oG
	 kl9AioSzXrVyK6O6EOzbwEirN65GoZYYJCWUcKtOVYZc7VO6p/0Az8aM7rmEkBYDzjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464369;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9Z13M2q1BEju2I9bduqQgoLJT03MD/wXP6Ev3AKsXE8=;
	b=aLzO3YnzE3KHz8qds2Nm/f8QfVqn/9ffoUxyo6KlQjTmoOr3Oo1t7lHyoLJUbYj4rPBr
	 PB5dY5K6IMkfrOY8PVPaMy/cGyQtBzliClt+qbLJd6lTHQxG/UCYeDSQNCT++Yx6fpc3F
	 EtqQhOP9onaYi5b6+t7QJKn2b7eGWh2Uc/jRP7l2ZE8b6Be7CmqaXJpcpY1WWpwNqHeyh
	 w8ISAfbZrH/h6ktni3S1j+TBf4lp5oenyBHxrOFm5H3eBseBvBKy7wGA3pkucCUbfnzXl
	 o+RRn/nW3KitmCY/NUxMsvGDexpl5xdnUIAbf/BmJhnixnvI7Bh0JQ5bLSb6N4RBoiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OujbhL8g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA47606A31E;
	Mon, 23 Nov 2026 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OujbhL8g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E2F1F000C6;
	Mon, 23 Nov 2026 20:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464368;
	bh=9Z13M2q1BEju2I9bduqQgoLJT03MD/wXP6Ev3AKsXE8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OujbhL8g4RjTPcaG7WStbC7wPRVKD9zNCUxUHNvz9yRdzjeEK5cLjMCFEGTf7tQLn
	 SNTeOXnILyC+R8t7hohjDTuwu7ZxJ4tGblUEQnq3/jV3GOCFoKLrt9PAULrOg9Xc/l
	 3G7rUInCJ5SvfOKfRMrBvS9SScrLa9dAKy6H0H/r7gvIB71I9qNg7I8USl8kfs3wrj
	 gQY9PzLbdSGZn2I+SkWnziuwMtS9bAnmgLOjCoFzNTXY2e4918CxcXgONZvWy79RlA
	 ARoEdVbJUpxF6HyGTirp6ggHj2sW3ddKU3UX86/QudDOMVQLpr4UI4ya8DzCrrFW9k
	 2XDjFBPZAnRzw==
Subject: Re: [PATCH net-next] net: stmmac: Advertise TX checksum offload only
 when supported
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Mon, 23 Nov 2026 20:06:07 +0000
Message-ID: <179546436704.3135.12593345717335656860@kernel.org>
In-Reply-To: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new advertisement gate in __stmmac_dvr_probe() trusts
  plat->tx_coe.
- [Low] The commit message presents this as a bug fix ('This can cause
  DSA user ports to inherit checksum offload through vlan_features…

--

net: stmmac: Advertise TX checksum offload only when supported

With this patch, __stmmac_dvr_probe() adds NETIF_F_IP_CSUM and
NETIF_F_IPV6_CSUM to hw_features only when plat->tx_coe is set.
Previously they were always advertised. The goal is to stop DSA user
ports from inheriting TX checksum offload through vlan_features when the
conduit can't do it, for example in threshold DMA mode.

> The driver unconditionally advertises TX checksum offload, even when
> the hardware capability check disables it, such as when threshold DMA
> mode is selected. This can cause DSA user ports to inherit checksum
> offload through vlan_features despite the conduit not supporting it.

[Severity: Low]
This reads as a bug fix, but there's no Fixes: tag, and the message
doesn't say what actually breaks. Is this meant for net or net-next?

Before this patch the conduit's own dev->features was already correct.
stmmac_fix_features() removes the TX checksum bits:

stmmac_fix_features() {
    ...
	if (!priv->plat->tx_coe)
		features &= ~NETIF_F_CSUM_MASK;
    ...
}

So only hw_features and vlan_features were wrong.

For header-tagged DSA traffic, validate_xmit_skb()->skb_csum_hwoffload_help()
on the conduit already falls back to software checksums. Also,
stmmac_features_check() drops CSUM for non-IP ethertypes. In that case
the only effect looks like wrong feature reporting.

Wrong L4 checksums on the wire would come from trailer taggers that rely
on the conduit (tag_trailer, tag_xrs700x). Is that the case this patch
fixes, and could the message say so?

There is also a change users can see in ethtool when tx_coe is false.
tx-checksumming on the stmmac netdev now shows "off [fixed]" instead of
"off [requested on]". Should the message mention that as well?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..8cb1e3b4030e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8224,8 +8224,9 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
>  	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
>  
> -	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
> -			    NETIF_F_RXCSUM;
> +	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
> +	if (priv->plat->tx_coe)
> +		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;

[Severity: Medium]
On cores without the DMA HW feature register, does plat->tx_coe reflect
threshold DMA mode by the time this check runs?

The threshold-mode override is applied only inside the hw_cap_support
branch of stmmac_hw_init():

stmmac_hw_init() {
    ...
	if (priv->hw_cap_support) {
		...
		/* TXCOE doesn't work in thresh DMA mode */
		if (priv->plat->force_thresh_dma_mode)
			priv->plat->tx_coe = false;
		else
			priv->plat->tx_coe = priv->dma_cap.tx_coe;
		...
	} else {
		dev_info(priv->device, "No HW DMA feature register supported\n");
	}
    ...
}

Older GMACs such as 3.40a don't have this register. There,
dwmac1000_get_hw_feature() reads 0 and returns -EOPNOTSUPP, so the else
branch runs and tx_coe keeps the value the platform set.

For "snps,dwmac-3.40a", stmmac_probe_config_dt() sets that value
statically:

	if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
		...
		plat->tx_coe = true;

It reads "snps,force_thresh_dma_mode" for any compatible. Nothing makes
the two settings agree.

If both are set, stmmac_dma_operation_mode() checks force_thresh_dma_mode
first:

	if (priv->plat->force_thresh_dma_mode) {
		rxmode = tc;
	} else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {

The TX channels are then programmed in threshold mode with tx_threshold[],
while tx_coe stays true.

In that setup the new check still adds NETIF_F_IP_CSUM and
NETIF_F_IPV6_CSUM to hw_features, features and vlan_features. That is the
DSA case the commit message describes. stmmac_fix_features() keeps the
bits because it also checks only tx_coe. stmmac_xmit() then requests HW
checksum insertion for CHECKSUM_PARTIAL skbs.

The driver comment says TX COE doesn't work in threshold mode. If the
hardware really skips it, won't those frames go out with only the
pseudo-header partial checksum?

No in-tree DT seems to combine dwmac-3.40a with
snps,force_thresh_dma_mode (spear3xx.dtsi uses 3.40a without it). This
may not be reachable with current in-tree users.

Would it fix this to move the force_thresh_dma_mode check that clears
tx_coe out of the hw_cap_support branch?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119185016.1789843-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
