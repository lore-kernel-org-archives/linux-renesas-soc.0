Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487183;
	b=nkmklMRVjbzhnZS6qrEBDVPtYOKG4AYS4DpXK5sd6sYwOxM9oyRG6jip1UyxZMFPKdQ5
	 Q6RzcOaFF+WULnPkh2H1RioLe7qZIqbnTqAY47cBV2Hef+IGVAS3mPF6K3HrtWTB3SCQW
	 guxNNn2yTTvfGBYslLSZKSJ6Lc0gLsJuAawHDTRO0t7/2YvsV/10M/j7K+LdVxUuX+EAK
	 whgfcPayISHKJlI9rVsKWTPSQwFQfXFoLQw4JtCqLGRhESu4qUqs0MBc1gKfTww6EXL9v
	 ErarI1Y+He1bZOuVN8YOLzsFTp2PrZxrByzYtkKmMD4nCuXggOuuX8mq+qJYJESjAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487183;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=B9gKAtYl6nmnZZ4QKGueT/aYpYuR3X0x/8ivAVYjrKo=;
	b=uoxuYWV+YxZ6f+2P6Tc0aKBomTfwEyLxWWJ6vKSayVstn2MSGaomehwmgDGk5AzmQEdI
	 S4G27nEUGPPDghwgTN2oFemsBYbWU6NtYDimOpV04eb8Gth4qmr+eeZmpnzZUhEF5nJyC
	 70P/Cgh5OJMdpcIg5HNNK92AuR+KHNHZxi80MRdmja0pMaCix/WI39kusk/UFhwgowb53
	 6b6fvlvR2zek+4NTKsyeoisCWKwp9B7jS7uEXA8tZHtvm6tYHlY7tV0bDENmi9PAyEcBd
	 KweODO2Y6ZV4HhNLsLSDJDTOSj1VTA9vkzddI9Y5jLoun3PYQ0R+cwTsm+zmUsmQbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vv+42BH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431A606A322;
	Tue, 24 Nov 2026 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vv+42BH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19371F000C6;
	Tue, 24 Nov 2026 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487182;
	bh=B9gKAtYl6nmnZZ4QKGueT/aYpYuR3X0x/8ivAVYjrKo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vv+42BH6FcOf0rB9jidqkMffK2321PTvbM/TD7kvDiM9um24PbNfkJV8M5udRJ14t
	 pbubYBfHx1rvqYqlwIHW8qZxBpNh/XhGvJwWGIir5TT33e7wGocYeI8QtjiKXZsSGU
	 J38e8bz3WqJi2WOeRKvxn/+f/WYJPkqfYmTEvinFuJ5o3QGSBez4oyhL6nMe9zZDdA
	 +uqs4pjBXyJmFrZlqE/x98IW2z8YsZeJWp0mWtpS4EIOQlajvdSOiEmVRR9isn2hgu
	 ebOtsa7VM2fvz3Qx5OUgkt27zmYrbEIf1hJwfxDdqth1/KQ1AOfY7+16V1V8f8QABK
	 1ewEuBnRas3QQ==
Subject: Re: [PATCH net-next v5 04/24] net: pcs: rzn1-miic: Select ETHSW port
 speed through SWCTRL
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
Date: Tue, 24 Nov 2026 02:26:20 +0000
Message-ID: <179548718033.3135.6350808715041189386@kernel.org>
In-Reply-To: <20261120002549.1908299-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

- [Medium] Possibly incomplete MAC configuration for duplex on RZ/T2H/N2H
  ETHSW ports.
- [Low] This patch leaves a comment in miic_init_hw()
  (drivers/net/pcs/pcs-rzn1-miic.c) that is now wrong for RZ/T2H.

--

net: pcs: rzn1-miic: Select ETHSW port speed through SWCTRL

On RZ/T2H and RZ/N2H, this patch programs SWCTRL.SET10/SET1000 from
miic_link_up() for converters routed to ETHSW ports. The commit message
says COMMAND_CONFIG_Pn.ENA_10 has no effect on the actual MAC speed on
those parts. The matched MODCTRL configuration is now kept in struct miic,
so the switch port that a converter is routed to can be looked up at
link-up time.

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
> index 682a73cf5a87d..96f4cb533a719 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c

[ ... ]

> @@ -383,6 +396,27 @@ static int miic_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>  	return 0;
>  }
>  
> +static void miic_swctrl_set_speed(struct miic *miic, int port, int speed)
> +{
> +	const struct miic_of_data *of_data = miic->of_data;
> +	u8 conf = miic->conv_conf[port + 1];
> +	u32 val = 0;
> +	int sw_port;
> +
> +	if (conf < of_data->swctrl_conf_start ||
> +	    conf >= of_data->swctrl_conf_start + of_data->swctrl_conf_count)
> +		return;
> +
> +	sw_port = conf - of_data->swctrl_conf_start;
> +
> +	if (speed == SPEED_1000)
> +		val = MIIC_SWCTRL_SET_SPEED_1000(sw_port);
> +	else if (speed == SPEED_10)
> +		val = MIIC_SWCTRL_SET_SPEED_10(sw_port);
> +
> +	miic_reg_rmw(miic, MIIC_SWCTRL, MIIC_SWCTRL_SET_SPEED_MASK(sw_port), val);
> +}

[Severity: Low]
This isn't a bug, but on RZ/T2H the comment in miic_init_hw() above the
probe-time SWCTRL/SWDUPC writes now seems to contradict this function:

drivers/net/pcs/pcs-rzn1-miic.c:miic_init_hw() {
    ...
		/* Disable speed/duplex control from these registers, datasheet
		 * says switch registers should be used to setup switch port
		 * speed and duplex.
		 */
		miic_reg_writel(miic, MIIC_SWCTRL, 0x0);
		miic_reg_writel(miic, MIIC_SWDUPC, 0x0);
    ...
}

On RZ/T2H, writing SWCTRL = 0 does not hand speed control to the switch.
It selects 100 Mbps on every ETHSW port, and miic_swctrl_set_speed() now
uses SWCTRL as the real speed control.

Could this comment be updated to say it describes RZ/N1 only? Otherwise a
later cleanup that trusts it could drop the SWCTRL programming. The
comment is still unchanged at the end of the series.

>  static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>  			 phy_interface_t interface, int speed, int duplex)
>  {
> @@ -415,6 +449,8 @@ static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>  
>  	miic_reg_rmw(miic, MIIC_CONVCTRL(port),
>  		     (MIIC_CONVCTRL_CONV_SPEED | MIIC_CONVCTRL_FULLD), val);
> +
> +	miic_swctrl_set_speed(miic, port, speed);
>  }

[Severity: Medium]
Does MIIC_SWDUPC need the same handling as SWCTRL on RZ/T2H?

Only speed is copied into the switch-control registers here. In
miic_link_up(), duplex only sets MIIC_CONVCTRL_FULLD on the converter.
MIIC_SWDUPC keeps the 0 written in miic_init_hw() and is never written
again.

On the switch side, half duplex is only set through COMMAND_CONFIG. That
is the same register block whose ENA_10 bit the commit message says has
no effect:

drivers/net/dsa/rzn1_a5psw.c:a5psw_phylink_mac_link_up() {
    ...
	if (duplex == DUPLEX_HALF)
		cmd_cfg |= A5PSW_CMD_CFG_HD_ENA;
    ...
}

a5psw_phylink_get_caps() advertises MAC_100 | MAC_10 on user ports, so
phylink can resolve a 10/100 half-duplex link.

Suppose SWDUPC selects duplex on RZ/T2H the way SWCTRL selects speed, and
HD_ENA is as ineffective as ENA_10. The MAC would then stay at whatever
duplex SWDUPC = 0 encodes, not the negotiated duplex. Could that cause a
duplex mismatch on half-duplex links?

Nothing in the tree documents SWDUPC semantics on RZ/T2H, so this would
need checking against the hardware manual. Testing with full duplex only
would not show it. RZ/T2H ETHSW ports only carry traffic once a later
patch in this series, "net: dsa: rzn1-a5psw: Add support for RZ/T2H
Ethernet switch", is applied.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
