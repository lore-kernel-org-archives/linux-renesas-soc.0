Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487191;
	b=wHAhHkJ5D4Nq57eXE4x7W4/yMiv9b0vH13WusfXXxtV6RfpzYrlqW8h+POsl3cusAnvo
	 EK6s68XbSVXnljIikSzk4059PyKBZZ/GaqAmJpkqh7ODcsAdqmvaNVkt1OxRzw7Fcb3V3
	 lmLYf/jACF4qpz81CIN2msChGb3mlYE0+lpS1QuPceJpa9zKF4oHUD5fNUBeCe7PkhrJx
	 PgrccCDJVkcGD+NjDyOj5hamf0q9kE4DU2uefSezcbyoKuzi4v+jBz4eypH/GXE+uslGK
	 5nPtjuCq69aqmNgA+v6KJecH0JHJwnmCWklKGPNM9diNQ3wO0MAd2cg02tLmdYEzgBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487191;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mmliaB+t5y87KpSlRozX2kcKHmFURkapiqmxRlQLekI=;
	b=WNETkZ+duxK2uh7fLv9Gd8+/eIxhGeMZ8gVI/i9YZUxY/XDZ3S6Bf6HVd6u8PuW3myv9
	 mu6XVFlPjg4Jfxn/pjHgTwKoi88YY1qQbf6IJH7SxguoWNPpc/eDXJrvLphxFumTaQGhU
	 CZVjIRxfy6f992nSsHCnrXXfNFbfcP5RKMrKJKmZ7LZUn7WehySk4jcPAEunkc3eZ8zfG
	 6u/7Nr/F/1tPOr/ZWa2XSPogk5MYGHNl0eMc85Nt0xur4nCXfjEut7bRC4Xu3Hnf74CEN
	 fGkMQwxssBsL4KSj3bpJ0TDJP0ODMcOXo9JVLxa8FLPEUYcKU5BzkMgqWhmIS4qjIAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RES45+72;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91417606A326;
	Tue, 24 Nov 2026 02:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RES45+72
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90DC1F000CA;
	Tue, 24 Nov 2026 02:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487191;
	bh=mmliaB+t5y87KpSlRozX2kcKHmFURkapiqmxRlQLekI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RES45+72ZngxLJ4XAQacbxAYPHtbrDv7CBl2zU+BMUM/ZBBnkUxmRc7FNtShRtbhi
	 Di0y5qub/E2dZ1RepjAHQzPEIaGLqBL9w/3kKU3sZkjwlLG0L1Z7/dkvkdpHM0VJhO
	 gSNRkWfliFxdsrvM2SZ4Ipegj5GBXQ1ulVn0VLN6+V2Wy4g+EZaiqABn68dSeIR8aa
	 rnZq21PWwX3ASYUXjuQKTa1Yx4m3cVhOV83U+DUlvR+JiId7TiipHw+7DHq4HLccy2
	 le1vJE/SUCgyVFWuha+BsLBihNq/vSE05olF9vfwRmnPYkpIshbRLD0Vtug59+DwES
	 p2UG1tGY7M99A==
Subject: Re: [PATCH net-next v5 22/24] net: dsa: rzn1-a5psw: Keep MAC TX
 enabled on RZ/T2H
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: clement.leger@linux.dev, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hkallweit1@gmail.com, linux@armlinux.org.uk, horms@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 f.fainelli@gmail.com, ralph.siemsen@linaro.org,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, prabhakar.csengg+renesas@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Tue, 24 Nov 2026 02:26:29 +0000
Message-ID: <179548718931.3135.3714317987961155691@kernel.org>
In-Reply-To: <20261120002549.1908299-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

- [Medium] This patch's stated invariant for keep_mac_tx_enabled SoCs
  (RZ/T2H, RZ/N2H; the next patch, "net: dsa: rzn1-a5psw: Add support…

--

net: dsa: rzn1-a5psw: Keep MAC TX enabled on RZ/T2H

On SoCs with keep_mac_tx_enabled set, this patch stops clearing
CMD_CFG.TX_ENA and gates port transmission through PORT_ENA.TXENA
instead. The TXENA bit is computed from both the STP/admin state and
the link state. CMD_CFG.SW_RESET is no longer written during setup, and
the probe path pulses the switch reset line instead.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 751d03b0bde4c..86d5b9d52f8db 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c

[ ... ]

> @@ -996,9 +1037,22 @@ static int a5psw_setup(struct dsa_switch *ds)
>  	dsa_switch_for_each_port(dp, ds) {
>  		port = dp->index;
>  
> -		/* Reset the port */
> -		a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port),
> -				 A5PSW_CMD_CFG_SW_RESET);
> +		/* Gate TX on link state only for user ports */
> +		if (!a5psw->of_data->keep_mac_tx_enabled || !dsa_port_is_user(dp))
> +			a5psw->link_up |= BIT(port);
> +
> +		/*
> +		 * Writing CMD_CFG = SW_RESET also writes TX_ENA as 0, which
> +		 * must never happen on some SoCs. Their switch is reset through
> +		 * its reset line in probe, so the statistics are already
> +		 * cleared; only disable the MAC receive path.
> +		 */
> +		if (a5psw->of_data->keep_mac_tx_enabled)
> +			a5psw_reg_rmw(a5psw, A5PSW_CMD_CFG(port),
> +				      A5PSW_CMD_CFG_RX_ENA, 0);

[Severity: Medium]
Where does TX_ENA actually get set on these SoCs before the first link-up?

The new reset pulse in a5psw_probe() puts every CMD_CFG register back to
its hardware reset value:

	ret = reset_control_reset(reset);

This branch then clears only RX_ENA. TX_ENA keeps whatever value the
reset default gives it.

The only code that writes TX_ENA=1 is the full register write in
a5psw_phylink_mac_link_up():

	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(dp->index), cmd_cfg);

Unused ports never get there. User ports get there only after their
first PHY link-up, and the CPU port only after its fixed-link comes up.

If the RZ/T2H / RZ/N2H reset value of TX_ENA is 0, would unused ports
keep TX_ENA=0 permanently, and user ports keep it at 0 until their first
link-up? That would contradict the invariant this patch is meant to
enforce. The old SW_RESET path in this same loop wrote TX_ENA=0
explicitly, so the register does accept 0 there.

The following patch in the series ("net: dsa: rzn1-a5psw: Add support
for RZ/T2H Ethernet switch") sets .keep_mac_tx_enabled = true in
rzt2h_of_data, and this behaviour is still present at the end of the
series.

Would something like this set the bit regardless of the reset default?

	a5psw_reg_rmw(a5psw, A5PSW_CMD_CFG(port),
		      A5PSW_CMD_CFG_RX_ENA | A5PSW_CMD_CFG_TX_ENA,
		      A5PSW_CMD_CFG_TX_ENA);

> +		else
> +			a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port),
> +					 A5PSW_CMD_CFG_SW_RESET);
>  
>  		/* Enable only CPU port */
>  		a5psw_port_enable_set(a5psw, port, dsa_port_is_cpu(dp));

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
