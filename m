Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125160;
	b=YZK3pNPcmkD7TPVTvcy597wKcRZzb2QK8DQlhQiFiJTJ2gwgcW36u10UcqtdhfFUSpON
	 phKujom9EvBJRolssa9VS64s8qEsLzyNZOuAW7BeOSPBdg1mePF0LIkQkjzj/I4/Bwbxf
	 h6XgJvAZSoYib/MwwjJmXXCrj0BcID5UnOR+u/2em0LAsj5DTeZdaKt76cTyzXB83PIYX
	 7WXoCTbqAekg4fHW6K00bcE0nfZPWtNC5hyI++RapWmtoj9s/w8xDozIIis8I9+l6oI6B
	 wRobXCieit5gUQdf/N7fn6BzB4ynnhJmR/ln5nT3VR32IwadVrS3gxoCgotyGqnb9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125160;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kY4a9Sw1tw4257Yux+6Zqx7kEYU65w6q3mNVHAEvp4c=;
	b=gsVcvMVegX/HETX1FNJLoddTRbZWM2//j026inWxxjyTmM0qa9AXhkEOqIr/LZP24zn1
	 MffbxwpJRaTzAVSkuVQ0HODnjEyVK4AzyAYVXqq6MhnI644B2CggmmJ3ICn/0iIicaYWZ
	 e8qsKMDTlhLJX2qW44iPItePbLE6eCdotmQBGlzoMupB0OdrvCQEvhbCBJ6JAdDQj+T9L
	 KZmH1RQFc79QF3FsLAkqPhQc47sxbvwgL8sa6K/+l165EOfcoMp2ZiSjI3ASismD0e+hJ
	 4Ho8iNWs4HlBsoqcSh2GmeTjv+WVAEIOcmzqQrbOJ5cYcItcGGmSoR0Q8tPtzktdOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N93v5G8i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1E606A326;
	Thu, 19 Nov 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N93v5G8i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0897B1F000C4;
	Thu, 19 Nov 2026 21:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125160;
	bh=kY4a9Sw1tw4257Yux+6Zqx7kEYU65w6q3mNVHAEvp4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N93v5G8iqNZ15a7Kva1dFn/oH4XI59e5nV8GeZOavKIWakjmbxE9v1mlfdy8BJb0v
	 g6J6NW+5sIej/iFxn8mCzSlYvtjwwd7U/lPmbwlv96AK1xnoqgBS7uJdnkZ4uEgmS6
	 NLbhzOndOwEUSymQB3GPwRB+WqQlp7dRa9mZBF4TioaeyymgJJqIxgRltOhgK+R1ns
	 pEE/+medmSQNCQ5zJsJXFQChMdPvT4rklyD6u85ACQkhZHfb6Tu+HqjTN7ikatIGvR
	 4fgY5nEwgaoFHK/Ds0mDSUKPdg34qyZBcxYRCmuJAbiYg1Cmt9hv3r0bV2IqCtatEs
	 gBJofBIYt86fQ==
Subject: Re: [PATCH net] net: stmmac: stop Tx NAPI before disabling the queues
From: netdev-bot+sashiko@kernel.org
To: tommaso.merciai.xr@bp.renesas.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 tomm.merciai@gmail.com, dinghui@lixiang.com, dinghui1111@163.com
Date: Thu, 19 Nov 2026 21:52:38 +0000
Message-ID: <179512515855.3136.15162646874622512762@kernel.org>
In-Reply-To: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
References: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
X-sashiko-severity: High
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

Critical: 0 · High: 2 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix only fences the ndo_start_xmit producer.
- [High] The patch assumes NAPI is the last thing that can wake a TX
  queue once stmmac_disable_all_queues() returns.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  stmmac_xdp_release() quiesces TX in the order the patch's new comment…

--

net: stmmac: stop Tx NAPI before disabling the queues

This commit adds a netif_tx_disable() call to stmmac_suspend(), right
after stmmac_disable_all_queues(). A TX queue woken by stmmac_tx_clean()
between netif_device_detach() and napi_disable() is then stopped again
before the platform suspend callback gates the clocks. It follows an
earlier bcmgenet fix.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..41d62f3b7ce51 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8412,6 +8412,9 @@ int stmmac_suspend(struct device *dev)
>  
>  	stmmac_disable_all_queues(priv);
>  
> +	/* NAPI may have woken a TX queue after netif_device_detach() */
> +	netif_tx_disable(ndev);
> +

[Severity: High]

Does this also cover the XDP transmit path? stmmac_xdp_xmit() is the
ndo_xdp_xmit callback, and its only gate is the STMMAC_DOWN bit:

stmmac_xdp_xmit() {
    if (unlikely(test_bit(STMMAC_DOWN, &priv->state)))
        return -ENETDOWN;
    ...
    __netif_tx_lock(nq, cpu);
    ...
    if (flags & XDP_XMIT_FLUSH) {
        stmmac_flush_tx_descriptors(priv, queue);
        stmmac_tx_timer_arm(priv, queue);
    }
    __netif_tx_unlock(nq);
    ...
}

stmmac_suspend() never sets STMMAC_DOWN. stmmac_xdp_xmit() also doesn't
check netif_xmit_stopped() or netif_device_present().

So netif_tx_disable() only waits for an XDP transmit that already holds
the txq lock. It doesn't stop new ones from starting.

The core redirect path doesn't block this either. xdp_ok_fwd_dev() only
checks IFF_UP and the MTU, and netif_device_detach() leaves IFF_UP set.

Once an XDP program is attached, stmmac_xdp_set_prog() advertises the
device as a redirect target through xdp_features_set_redirect_target().

Suppose another interface redirects into this one through a devmap, for
example a NIC that suspends later in dpm order, or a veth. Could this
sequence then run after stmmac_stop_all_dma() and priv->plat->suspend()?

bq_xmit_all()
  stmmac_xdp_xmit()
    stmmac_xdp_xmit_xdpf()
      stmmac_enable_dma_transmission()     <- MMIO
    stmmac_flush_tx_descriptors()
      stmmac_set_queue_tx_tail_ptr()       <- MMIO
    stmmac_tx_timer_arm()                  <- re-arms cancelled txtimer

That looks like the same SError the commit message describes: a tail
pointer write after the clocks are gated.

Is a driver-level state needed here that every TX entry point checks?
One option is to set STMMAC_DOWN (or a dedicated suspended bit) before
stmmac_stop_all_dma() and clear it on resume. Another is to check
netif_device_present() in stmmac_xdp_xmit().

[Severity: High]

The new comment assumes that once stmmac_disable_all_queues() returns,
nothing but NAPI can wake a TX queue. Is that true? stmmac_tx_err() also
wakes the queue, from hardirq context:

stmmac_tx_err() {
    netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, chan));

    stmmac_stop_tx_dma(priv, chan);
    ...
    stmmac_start_tx_dma(priv, chan);

    priv->xstats.tx_errors++;
    netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, chan));
}

It is called through stmmac_interrupt()->stmmac_dma_interrupt() and
through stmmac_msi_intr_tx(). Both handlers return early only on
STMMAC_DOWN, which stmmac_suspend() never sets.

The channel IRQs also stay enabled until
stmmac_stop_all_dma()->stmmac_deinit_chan() masks them.

Say a tx_hard_error status is handled after this netif_tx_disable().
TX DMA is restarted and the txq is woken. Can the qdisc then call
stmmac_xmit() after priv->plat->suspend() has gated the clocks?

On dwmac4, stmmac_stop_all_dma() may open this window by itself.
DMA_CHAN_INTR_ABNORMAL enables RPS, so stopping RX DMA can raise AIS.
dwmac4_dma_interrupt() then decodes TPS, which is set when
stmmac_stop_tx_dma() clears ST, as tx_hard_error:

dwmac4_dma_interrupt() {
    ...
    if (unlikely(intr_status & DMA_CHAN_STATUS_TPS)) {
        x->tx_process_stopped_irq++;
        ret = tx_hard_error;
    }
    ...
}

A fatal bus error during the suspend window would take the same path.

Should the DMA interrupts be masked, or a down state set, before the
queues are disabled here?

>  	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>  

[Severity: High]

This isn't a bug introduced by this patch, but stmmac_xdp_release() in
the same file still uses the ordering this patch fixes in
stmmac_suspend():

stmmac_xdp_release() {
    /* Ensure tx function is not running */
    netif_tx_disable(dev);

    /* Disable NAPI process */
    stmmac_disable_all_queues(priv);
    ...
    stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
    ...
    stmmac_stop_all_dma(priv);
    ...
    free_dma_desc_resources(priv, &priv->dma_conf);
    ...
}

A tx NAPI poll that runs before napi_disable() completes can reach
stmmac_tx_clean(). There it finds the queue stopped and
stmmac_tx_avail() > STMMAC_TX_THRESH, so it calls netif_tx_wake_queue(),
which also reschedules the qdisc.

stmmac_xmit() can then run, holding only the txq lock, while
stmmac_xdp_release() carries on into free_dma_desc_resources(). Could
stmmac_xmit() write descriptors and tx_skbuff entries into ring memory
that is being freed?

This can be hit by attaching or detaching an XDP program on a running
interface while TX traffic is flowing, through
stmmac_xdp_set_prog()->stmmac_xdp_release().

__stmmac_release(), and stmmac_suspend() after this patch, both disable
NAPI before calling netif_tx_disable(). Should stmmac_xdp_release() use
the same order?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5%40bp.renesas.com
