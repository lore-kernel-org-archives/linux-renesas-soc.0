Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487178;
	b=XtWoeouQzlF/FWnsnRXLaw//n/iKvUB0ObOHiZJaO3HC0EDA91RZH9Cz6FUMILs5Bchy
	 vFv4UGtRAurfgCGx+chyHcA1LTX0Qj9CI7nJVHexeygoXj1Qdy4Z9qSpdB5YZ0FPJokQ8
	 r17ps6KNj3fVby2m7carAg/VL73Tul/KiXd9gNURCUqoTBb1nd4uTiuU92+e5hdImgXJt
	 tGrh46fCgQxUhK/O5f8dQbDORzpcQSWntRlDXkUu5R/X0Ol/qipH+tQ6Wx3ztLqj3DUBH
	 TOLhkHhESvoFYkOsqhZH+nWKpYl8WUFkNG6ggpnm4SxOUBHNxKKZ39HhfC9MuTxmqfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487178;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HaUHhbx9+vVUTZE0J6iQm8zAlFYDpmTDUbLyer0bb4s=;
	b=UJ0TxCPF5WQwuwGHYGIYa7yNDftmAmAosa88wIo8mdIv6FzO9ZlGhqiu05VZ6CrFk0dH
	 eAaT37xq3xla77txAl1/IpvbgV9xuVHiJ7P+Ci9NXBzMkG8ERRhOdYzVRuadmMdepNcu0
	 SFfjzZTbf+6wUFzpM66OjiDqVGNCbs9C647o98T5WUlbaBCFMXZu52Z0OnkqjXgUX4ERA
	 oExNghyPcvxWya+hvipw58dyNv5bQtqtaybUMst0FAfxcxqzGZPpjfgVErbzkW3a9daB4
	 zR4LEFciM9tyULplbJUVnEp0noG3GXVlgDHD5R8UPKBVSMoDSNDjm1h/j21UihaRP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJODuCEE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6A606A31E;
	Tue, 24 Nov 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJODuCEE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833F81F000C4;
	Tue, 24 Nov 2026 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487178;
	bh=HaUHhbx9+vVUTZE0J6iQm8zAlFYDpmTDUbLyer0bb4s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IJODuCEE0MC7ztvYJqZcf2g7HMP3b5lps3+WKKEFk58XM44OgvRuhMmuWOXWQ1/Kf
	 wlOdsJoXcU2/jg8ztOvZ7eLJJHM67gXGCr9BqP0TCDlE/5HM2xduIjxOkXdmQHKOb4
	 p91NJ3jh+SHYJfIKfrUjjOOKFFvJsyjTaFFM+fPfjw6sypJDxtSFLJvQi1hFBdXHDs
	 R0vyNvuOIBQRB7AA6JKki4pqWl5hcWssc+vtIj82b1oq8RhAt4uWecDUW/NoNuRzKT
	 25e5d4wQkWxu24BS8iwUv7ehhSmVTES4I7lXeFrjoc2G5ybmRMD2QySITe8TXFQkVG
	 464YVEXgU/CoQ==
Subject: Re: [PATCH net-next v5 02/24] net: dsa: tag_rzn1_a5psw: Add RZ/T2H
 ETHSW tag protocol support
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
Date: Tue, 24 Nov 2026 02:26:16 +0000
Message-ID: <179548717602.3135.2246188557259866304@kernel.org>
In-Reply-To: <20261120002549.1908299-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

- [Low] net/dsa/tag_rzn1_a5psw.c now registers two tag drivers through
  module_dsa_tag_drivers(): 'a5psw' (DSA_TAG_PROTO_RZN1_A5PSW) and…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  moves the line and copies its pattern for the new tagger.

--

net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support

This commit adds a new DSA_TAG_PROTO_RZT2H_ETHSW tag protocol for the
RZ/T2H ETHSW. It uses the same tagged frame layout as the RZ/N1 A5PSW,
but a different ControlData bit layout. Both taggers are now registered
from net/dsa/tag_rzn1_a5psw.c through module_dsa_tag_drivers().

> diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
> index aab0ec143c77c..3dff661fa58cb 100644
> --- a/net/dsa/tag_rzn1_a5psw.c
> +++ b/net/dsa/tag_rzn1_a5psw.c

[ ... ]

> @@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
>  	.rcv	= a5psw_tag_rcv,
>  	.needed_headroom = A5PSW_TAG_LEN,
>  };
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. Since the
line is being moved anyway, should the token be DSA_TAG_PROTO_RZN1_A5PSW?

MODULE_ALIAS_DSA_TAG_DRIVER() in net/dsa/tag.h appends _VALUE to the token
and stringifies the result:

#define MODULE_ALIAS_DSA_TAG_DRIVER(__proto, __name) \
	MODULE_ALIAS(DSA_TAG_DRIVER_ALIAS __name); \
	MODULE_ALIAS(DSA_TAG_DRIVER_ALIAS "id-" \
		     __stringify(__proto##_VALUE))

DSA_TAG_PROTO_A5PSW_VALUE is not defined anywhere. include/net/dsa.h only
has:

#define DSA_TAG_PROTO_RZN1_A5PSW_VALUE		26

So the module gets the literal alias
"dsa_tag:id-DSA_TAG_PROTO_A5PSW_VALUE" instead of "dsa_tag:id-26". It also
doesn't match .proto = DSA_TAG_PROTO_RZN1_A5PSW in a5psw_netdev_ops above.

When the RZ/N1 switch driver returns DSA_TAG_PROTO_RZN1_A5PSW from
get_tag_protocol(), the lookup goes:

dsa_port_parse_cpu()
  dsa_tag_driver_get_by_id()
    request_module("%sid-%d", DSA_TAG_DRIVER_ALIAS, tag_protocol);

This requests "dsa_tag:id-26". No alias matches, so tag_rzn1_a5psw.ko is
not loaded. dsa_port_parse_cpu() then turns the -ENOPROTOOPT into a probe
deferral:

	if (PTR_ERR(tag_ops) == -ENOPROTOOPT)
		return -EPROBE_DEFER;

Won't the RZ/N1 switch keep deferring its probe until someone loads the
tagger module by hand? multi_v7_defconfig sets CONFIG_NET_DSA_RZN1_A5PSW=m,
so the tagger is built as a module in a stock config.

The new ETHSW alias added by this patch does resolve, because
DSA_TAG_PROTO_RZT2H_ETHSW_VALUE exists. After this patch, ID-based
autoloading of the shared module works for RZ/T2H but not for RZ/N1.

The DSA_TAG_PROTO_A5PSW token predates this series. Commit 94793a56b3df
("net: dsa: provide a second modalias to tag proto drivers based on their
name") changed this line and kept the token. It is still there at the end
of the series.

> +DSA_TAG_DRIVER(a5psw_netdev_ops);

[ ... ]

> +module_dsa_tag_drivers(dsa_tag_driver_array);
>  
>  MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");

[Severity: Low]
This isn't a bug, but should MODULE_DESCRIPTION() be updated as well? The
module now also registers the "ethsw" tagger for RZ/T2H, but the
description still mentions only the RZ/N1 A5PSW.

A later commit in the series, "net: dsa: Kconfig: Expand config description
to cover RZ/T2H and RZ/N2H ETHSW", updates the NET_DSA_TAG_RZN1_A5PSW
Kconfig prompt. No patch in the series changes MODULE_DESCRIPTION().

>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
> -module_dsa_tag_driver(a5psw_netdev_ops);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
