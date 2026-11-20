Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167336;
	b=5F3QCh1JvcWyoXWWIgcSt3pPdQ4EdNlfs/+pn037gxRE7HChvO5LwcBltd8GUzLNDVfF
	 IgM43CTncPaC5sFfBR/UjF93/WrxDx6XJBOcjpNPdJQIU8oW2vjd71UHoZxdlh7VyBZc6
	 qaq4pmtgdMgcxfmEm0ZpZY0NfUqe5ylKupB2VXG8rzUtBKwwsucREaXy+5sFeFAfapFrQ
	 n6CuyAh7QpKa1kMRH1559yB0nOQU5SzJDbLszJedSIB0HuQskNudHsLl08n61XUpO7GYF
	 1Lbl9p3wh97Cerw6i+ItXnoxCQEaHftZhwYrM14XsT3KyCcNhREPAQCNwesqWClrpcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167336;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=43AS4amyalzgXE0K6sJkFXQxyxxUIzihdzn0SjkUBf0=;
	b=GDUZXQW/t1hKHitSK7PxMci7n9jzSIJLkvrkNiRUo+n3f/aCcbm7/Wp8IHdoj2MMZHkh
	 4vJIYnYZeU3J90Aae0FRgObca/2kAu99sXo3qSPzh3NYcT/crjpUgtV1VTFd7YLs9xSpT
	 2e180rFuOmUgF0NNQH20wTnNAIKH0edWFvfbpkvLQuDGXhQhdSLmgO4H1VofmFZEZrX1n
	 COol9XHfSQAxHkCK7UOQLahAzkCDmi6CZkIfCkxi2qCGZUONXBaYKOWoKKFEDl3tjzjHv
	 y0tLyHpFsEfuVGUPO9Nr8Fz3tZ+9IABCBSAxO6puVP98nI9viaAAfHCJKpCJHDXrDYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RIDEQ8ct;
	arc=none smtp.remote-ip=91.218.175.14
Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3508606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 09:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3508606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RIDEQ8ct
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZflrbahZsofPbCrWMnIKEw5KReETDYjuOB4jROTcdaE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795167334; v=1; x=1795772134;
 b=RIDEQ8ctHIrwE8ojKHe9U6bAca4iJ3jXJlZPLc68RGyIwL/hGRITNsbW6P4IpVUWfleDg653
 t117hqcZ92+p7b8Ouni3OvxGt+w3eUwFPNHNiSvkm7EXoluQAEjnDHukXonkHgv2BeV4NkHq+L1
 Et0uYfgnoU1JwwxUPAQ3dPcs=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49724b56a0ec4ac1;
	Fri, 20 Nov 2026 09:35:28 +0000
X-Mizu-Trace-ID: 49724b56a0ec4ac1
X-Migadu-Flow: FLOW_OUT
Message-ID: <30b4eece-f79c-4a8a-971b-e5566b96d878@linux.dev>
Date: Fri, 20 Nov 2026 10:35:27 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 18/24] net: dsa: rzn1-a5psw: Get pattern
 matcher register offsets from OF data
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RX pattern matcher registers are located at different offsets on
> RZ/N1 and RZ/T2H/RZ/N2H. While RZ/N1 uses 0x3e80 for RXMATCH_CONFIG
> and 0x3eb0 for PATTERN_CTRL, RZ/T2H and RZ/N2H use 0x3f00 and 0x3f40,
> respectively.
> 
> Move the base offsets of both register arrays into struct a5psw_of_data
> and use the correct values for each SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 10 ++++++++--
>   drivers/net/dsa/rzn1_a5psw.h |  8 ++++++--
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 9475e53752ce..6f3f902f9f4c 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -112,7 +112,9 @@ static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
>   	if (enable)
>   		rx_match |= A5PSW_RXMATCH_CONFIG_PATTERN(pattern);
>   
> -	a5psw_reg_rmw(a5psw, A5PSW_RXMATCH_CONFIG(port),
> +	a5psw_reg_rmw(a5psw,
> +		      A5PSW_RXMATCH_CONFIG(a5psw->of_data->rxmatch_config_base,
> +					   port),
>   		      A5PSW_RXMATCH_CONFIG_PATTERN(pattern), rx_match);
>   }
>   
> @@ -953,7 +955,9 @@ static int a5psw_setup(struct dsa_switch *ds)
>   	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
>   
>   	/* Set pattern 0 to forward all frame to mgmt port */
> -	a5psw_reg_writel(a5psw, A5PSW_PATTERN_CTRL(A5PSW_PATTERN_MGMTFWD),
> +	a5psw_reg_writel(a5psw,
> +			 A5PSW_PATTERN_CTRL(a5psw->of_data->pattern_ctrl_base,
> +					    A5PSW_PATTERN_MGMTFWD),
>   			 A5PSW_PATTERN_CTRL_MGMTFWD);
>   
>   	/* Enable port tagging */
> @@ -1348,6 +1352,8 @@ static const struct a5psw_of_data rzn1_of_data = {
>   	.npcs = 4,
>   	.cpu_port = 4,
>   	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
> +	.rxmatch_config_base = 0x3e80,
> +	.pattern_ctrl_base = 0x3eb0,
>   };
>   
>   static const struct of_device_id a5psw_of_mtable[] = {
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index 942931cbc402..5c5f5ec25774 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -74,10 +74,10 @@
>   #define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
>   #define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
>   
> -#define A5PSW_RXMATCH_CONFIG(port)	(0x3e80 + 4 * (port))
> +#define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
>   #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
>   
> -#define A5PSW_PATTERN_CTRL(p)		(0x3eb0 + 4  * (p))
> +#define A5PSW_PATTERN_CTRL(base, p)	((base) + 4 * (p))
>   #define A5PSW_PATTERN_CTRL_MGMTFWD	BIT(1)
>   
>   #define A5PSW_LK_CTRL		0x400
> @@ -239,6 +239,8 @@ union lk_data {
>    * @tag_proto: DSA tag protocol used by the switch
>    * @management_port_fixed_frame_len: Fixed frame length for the management
>    *   port to account for the HW issue.
> + * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
> + * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
>    */
>   struct a5psw_of_data {
>   	unsigned int nports;
> @@ -246,6 +248,8 @@ struct a5psw_of_data {
>   	unsigned int cpu_port;
>   	enum dsa_tag_protocol tag_proto;
>   	unsigned int management_port_fixed_frame_len;
> +	u16 rxmatch_config_base;
> +	u16 pattern_ctrl_base;
>   };
>   
>   /**

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément

