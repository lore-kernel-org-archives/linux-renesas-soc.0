Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487194;
	b=bMDMDKrDoeMsDYxbrnRjtWrJOG0oEsrEvP1PUVRzo06LQzTQmvNmYht9mQ2FXNv5ppvJ
	 YOaEbgj2f8ahrVUGI5dSovZvLzuHC+29/V4jl6Ri9ABDEmJLhVNBqR33VfVMxs0qaiVoZ
	 auk6qMWFEXKkF9spp6yga0cNPrv4NE2+Sm12qT9WvTLhYdFxnYI2LlvHInKuCvKZ55BWc
	 STaN7+atJ+9xRozF+QCEutDUKp5C/1f6rJ1s1bVKEdvfl4rJoTpWabCpth4mFnE+tHbD6
	 aXvdwrecrZsuVQgH+qOfeqEniF0fJWhoSaz1h1+UBBMzFiIH4/fNnOj4L9RxNIe1y4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487194;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UNc4WxmfbfLgUpSIVGlILF9NYv4ex8h4CwsAajsbkL4=;
	b=JgllzN3Wli6u4KFFpDullHoLBidWKWXNOyfDJj76fC69bq7U+9KYC2EEiT+Or/DH5Cu1
	 usRjoJTsp30ToJdGFRXDAMbJFY0BYO5QZkMjaI4adavh5foSi0BDSBKzfaR3auEwvcy0v
	 cWh88/KUxBl00WZW3dqppuFbzBBT6NkV134ePFyi4zq45DnJAbu7AVHdeXUxiZOPLJgnN
	 Xhr7mPJomoyyuQx6ju8fDwFFGvVHCyT/LJcWfulZ9PM8tiqAsyRdPlAqR7spMqc2IrKb6
	 su5iLgsxKi/27VjVGaoIGOZFLFNvSDO8Ik9w8I1NkfZZ46Io8Ta/pJSQsbfamGNREhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e74D9ACb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA4606A32D;
	Tue, 24 Nov 2026 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e74D9ACb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA881F000C0;
	Tue, 24 Nov 2026 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487193;
	bh=UNc4WxmfbfLgUpSIVGlILF9NYv4ex8h4CwsAajsbkL4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e74D9ACbYJZoXJ9sLL93uzDY66JcwoY7btCTeEmPRBCHdSdqroP1VYKuRKIG9sKeZ
	 RIigLtZDeV9XUxvTlljYqQ8jUuA3uSw514h3RMkyKpJcQjN2WsRQvk0UpkLVauEBqY
	 b7Wa/SzUBf3I4BIaUOVjGId76BxbFNkAZUKnBmxMLeSdESP1IjOyU77WOZSK3jt1uX
	 /Ih5YNqN4gSeLRGHqAVr7XlOLMCsggPPheuECbm2DCIvbfgvu2tnD38wyol/X22CyQ
	 kmUowcvNgwXM9QtuCySaUuOvDx0EkKKaxZZUovTClqEu0T30I9ou18p1mgcMMNR6Wj
	 x3rYPFOIU8N5w==
Subject: Re: [PATCH net-next v5 23/24] net: dsa: rzn1-a5psw: Add support for
 RZ/T2H Ethernet switch
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
Date: Tue, 24 Nov 2026 02:26:31 +0000
Message-ID: <179548719178.3135.16247387052615724547@kernel.org>
In-Reply-To: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: dsa: rzn1-a5psw: Add support for
  RZ/T2H Ethernet switch" does not match what the patch does.

--

net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch

This commit adds OF match data for the RZ/T2H ETHSW, which uses the A5PSW
IP but has a different port count, tagging protocol, pattern matcher
offsets, VLAN_RES layout and lookup table size. It also adds the
renesas,r9a09g077-ethsw compatible, which RZ/N2H uses as a fallback.

> Configure the driver for the RZ/T2H variant with:
> - 4 ports (3 external and 1 management), with the management port
>   at port 3.
> - DSA_TAG_PROTO_RZT2H_ETHSW tagging protocol.
> - A fixed management port frame length of 0x3fff.
> - Pattern matcher register offsets of 0x3f00 and 0x3f40.
> - VLAN_RES fields using VLANID[15:4] and PORTMASK[3:0].
> - 4096 lookup table entries.
> - The odd MDIO clock divider formula.

[Severity: Low]
Is this list still accurate after the v4->v5 change to rzt2h_of_data?

The last bullet mentions an MDIO clock divider formula. However,
rzt2h_of_data has no MDIO setting, and struct a5psw_of_data has no member
for one. a5psw_mdio_config() uses the same formula on every SoC:

drivers/net/dsa/rzn1_a5psw.c:a5psw_mdio_config() {
    ...
	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
    ...
}

That formula came from the earlier commit in this series, "net: dsa:
rzn1-a5psw: Fix MDIO clock divider calculation". Its message says the
formula is the same on RZ/N1, RZ/T2H and RZ/N2H.

The list also leaves out a setting the patch does add:

	.keep_mac_tx_enabled = true,

For the new compatible, this skips CMD_CFG.SW_RESET during setup, keeps
TX_ENA set, and gates user-port TX through PORT_ENA.

Could the MDIO bullet be dropped and a bullet for keep_mac_tx_enabled be
added?

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 86d5b9d52f8db..2b69e92e18533 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1411,6 +1411,20 @@ static void a5psw_shutdown(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, NULL);
>  }
>  
> +static const struct a5psw_of_data rzt2h_of_data = {

[ ... ]

> +	.lk_table_entries = 4096,
> +	.keep_mac_tx_enabled = true,
> +};

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
