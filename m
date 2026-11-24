Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487180;
	b=RVNuuTeyfAOJY1LCqZ8MKdcZZpXKrMSeDZCnvTNBvqlqa/IWbv4iXTYiQ4dBBG7WuZdw
	 9F2TJjIftcsm1RfoWDe8rEpBZ4LLwQpXGTDKPIWqHTtlH2kJoccqEZNKIfME+1+Z4WY6k
	 jADeHfi9p3vLq4EaEr4C4p7YywoxobtEC20Y+uv+zMy3Aou5fw17/oNCx/D7jr9zht8US
	 cx0kt4HMzSFSZtIhU60pcP4No+VAWHOhVeYqKtx4KZJqRFGM8/Z3YJDd4Oq0Xpvt4y2cG
	 cSXxq8d2IUgsq8OsbDH8I88dfAT2JvBB1wwjVE68gN7M2M7+AHlc0vycRIozwIxkMGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487180;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+i3P6EOKNlYY2XqpeMjpOFb3eYyp/eGImGbt1LNxdPw=;
	b=tpyJHW4ETIbBMi/sk7pdUJgDZCcRCP1Iyud587tH5xALF7PahOpUYSYPEs0E2ieWmSae
	 ZcBKhgtKTXpnVIt3w8LCEZo9BSSzQthkfXfELVKwxkwHWeD4/3WQTZVeKd9cPJIlcpYCu
	 z+cx8ZSde8vmgT8L8KMT6sQzBCKImQcDzum9/YhQta/84eijRtSE0u0ra1lnQEsYxhepv
	 lhulQ6xLbaWWSNlLawolGD+55H8poRINXbpHwFmhzoAOVIFQHgoRu54H1Zn+v38AXUeTq
	 qZBm1KJrNVCRfnY1AO9CHNlf5a+snH19YXypwXUjKxAXIMH1xHPIL2UKVPdHn54m8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+JsXRq4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84096606A31E;
	Tue, 24 Nov 2026 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+JsXRq4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FCA1F000C0;
	Tue, 24 Nov 2026 02:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487180;
	bh=+i3P6EOKNlYY2XqpeMjpOFb3eYyp/eGImGbt1LNxdPw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R+JsXRq43TZtuJ4oq4MJo17Lznb9p3lKMFfEH9xE5yBiES7gLh45QOD/DlgSKHNCf
	 8FV5M4VANcr0BcF4f07iLE7pJhY29Pqb7DENLyxe1lXRWLhAhHy4nvb+7DQmaJyKgs
	 MsgV4IT9c+vmwc3sddJVZQcmGYmT4RJZOvMJhvHg0edqM2Di8J1u1SGeinAy4gNIq0
	 VFKMWJjrsNhahyAdB2Q9RVhp7zQOn1kXAmP5aPHLmp+z41E5Lv5nKwDHHB6c2vQ+Ir
	 JWb6cCU7uEh8jucrHV4ByQ6bBb8YHxRDsRDqf0PrcUzJFDthJbK6l8GZNLXf34N+A+
	 ko2X7iP5VlDcQ==
Subject: Re: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config
 description to cover RZ/T2H and RZ/N2H ETHSW
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
Date: Tue, 24 Nov 2026 02:26:18 +0000
Message-ID: <179548717812.3135.9507593083133918104@kernel.org>
In-Reply-To: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

- [Low] The NET_DSA_TAG_RZN1_A5PSW help text that this patch rewrites in
  net/dsa/Kconfig (lines 206-207) says "These switches use an 8-byte tag…
- [Low] This patch widens the Kconfig prompt and help for
  NET_DSA_TAG_RZN1_A5PSW to cover the RZ/T2H and RZ/N2H ETHSW.
- [Low] The concern: the new Kconfig text claims ETHSW tagging support
  for RZ/T2H and RZ/N2H, but no in-tree switch driver ever returns…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the ID
  modalias for the RZ/N1 A5PSW tagger is broken.

--

net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW

This commit updates the prompt and help text of NET_DSA_TAG_RZN1_A5PSW.
They now say that the ETHSW blocks in the Renesas RZ/T2H and RZ/N2H SoCs
use the same tagging format.

> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> index bdeb60af764b2..3c18314aee956 100644
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
>  	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
>  
>  config NET_DSA_TAG_RZN1_A5PSW
> -	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
> +	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"

[Severity: Low]
Should the MODULE_DESCRIPTION() in net/dsa/tag_rzn1_a5psw.c be updated to
match this prompt?

An earlier patch in this series, "net: dsa: tag_rzn1_a5psw: Add RZ/T2H
ETHSW tag protocol support", made the module register a second protocol
(ethsw_netdev_ops, DSA_TAG_PROTO_RZT2H_ETHSW). The description still reads:

net/dsa/tag_rzn1_a5psw.c:
MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");

So modinfo still lists the module as RZ/N1 A5PSW only. No later patch in
the series changes this string.

>  	help
> -	  Say Y or M if you want to enable support for tagging frames for
> -	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
> -	  destination MAC address.
> +	  Say Y or M if you want to enable frame tagging support for embedded
> +	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
> +	  SoCs. These switches use an 8-byte tag located after the destination
> +	  MAC address.

[Severity: Low]
Is "after the destination MAC address" accurate here? The layout comment
in net/dsa/tag_rzn1_a5psw.c puts the tag after the source MAC:

/* To define the outgoing port and to discover the incoming port a TAG is
 * inserted after Src MAC :
 *
 *       Dest MAC       Src MAC           TAG         Type

a5psw_tag_xmit() writes the tag at the EtherType position:

	/* make room between MACs and Ether-Type to insert tag */
	dsa_alloc_etype_header(skb, A5PSW_TAG_LEN);

	ptag = dsa_etype_header_pos_tx(skb);

Here dsa_etype_header_pos_tx() returns skb->data + 2 * ETH_ALEN.

The old text had the same mistake. Since this patch rewrites the sentence
and extends it to RZ/T2H and RZ/N2H, could it say "after the source MAC
address" (or "between the MAC addresses and the EtherType") instead?

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. The id
modalias for the A5PSW protocol in net/dsa/tag_rzn1_a5psw.c looks broken:

MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);

MODULE_ALIAS_DSA_TAG_DRIVER() stringifies __proto##_VALUE.
include/net/dsa.h only defines DSA_TAG_PROTO_RZN1_A5PSW_VALUE (26), and
there is no DSA_TAG_PROTO_A5PSW_VALUE. So the alias comes out as the
literal "dsa_tag:id-DSA_TAG_PROTO_A5PSW_VALUE" instead of "dsa_tag:id-26".

With CONFIG_NET_DSA_TAG_RZN1_A5PSW=m and the module not yet loaded, can
the RZ/N1 switch ever finish probing?

a5psw_get_tag_protocol() returns DSA_TAG_PROTO_RZN1_A5PSW
  dsa_port_parse_cpu()
    dsa_tag_driver_get_by_id(26)
      request_module("dsa_tag:id-26")   <- no matching alias
    -ENOPROTOOPT -> -EPROBE_DEFER

The switch would keep deferring until someone loads tag_rzn1_a5psw.ko by
hand.

The new ETHSW alias in the same file uses DSA_TAG_PROTO_RZT2H_ETHSW, which
does have a _VALUE macro. The earlier patch in this series rewrote the
A5PSW line but kept the old token.

Should this be MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZN1_A5PSW,
A5PSW_NAME)?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
