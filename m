Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158212;
	b=1vD8ZlD7plksUVWcRXfXO8ZWAhDBPtGlvXdlSx5bUUErRafzewL+B7ih3vvIsPNpjt7M
	 dmoBx8mAn1JokV862g8e9vl0ip4PIgo3ypxntyHwJFT2R4c5wHDGU5MgV2DJKoIpY+rbO
	 /y8TeXKDsw/NH+YDf7RcDPCu9FSAWEzzjkbRz6kRgdkTCqqCJbJJ+c2OY8OFqz11OtN7k
	 GtJAG+vEd5h8bsgPdUTzI0Wgnw06cXYcCwVx7llAdsj4Bi4l9LjLf/CDCXAYoQ6vTGts+
	 KcpRKyO6Jv3X5PGjChVUJllN3J1vXq0uf2Lr3jihsvsu8TIusN0K3aCd8/WMQiNTKaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158212;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uHwvIe5lHvX4OsC6ONaqL5E8BXvpSUpMKavi/gOZ90U=;
	b=MYe6QGaJ8LEzj4k8gkYs+OXo/WbFCKfVcM2f/0LbbOMtmLd0YEPZGSaaQhvF0Kxb2nHV
	 1PyHdKy0F/qj+lurZn6ijcIoOHaVB0m74pRBJiMDMYWV/TsMozcs8mAlspXOpfIwBZOVS
	 vuhjiUUje/QYy+e47cpjp0rgqigfcONyn9XvgJIhfeYv25ELznS9/u75yB+Q/IaLZOqYS
	 Gk9T8Jq6Qsah39LRZo/GIKXUgjFbeqOMc2MdYgajS3GHtxPjccnIOH+SgxYHS+lQ9R3CS
	 0ViJ2ZLlSvImZqMV2WftTPpE78+wJ+ZXlJnnOlW/t/HQBQj1bY4Yfb+z7pBj/pibLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="m/vqxZSA";
	arc=none smtp.remote-ip=95.215.58.129
Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1861606A325
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 07:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1861606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m/vqxZSA
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iKGCF34JO5kdAIXGWAc1gSdXT5fwS16EI82kRXr3nRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795158208; v=1; x=1795763008;
 b=m/vqxZSA/mVSIeHOWHgXEDeZvlu4k91nK1kqekCD0zeiwhoObFOicTFYz1s0RByuMM5WkB6v
 xgan2aaiEwAQDYimMXXFQcss1CT7MHBQ1L1VZo41ScHMev1bitfGBlTy9qqgBs7lj/dHO+Art7U
 gPuMDE//lYar8GeByq2VESnk=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 517fa123e3c93d7a;
	Fri, 20 Nov 2026 07:03:28 +0000
X-Mizu-Trace-ID: 517fa123e3c93d7a
X-Migadu-Flow: FLOW_OUT
Message-ID: <348c15f4-529f-4d03-8362-ccac24722ebb@linux.dev>
Date: Fri, 20 Nov 2026 08:03:24 +0100
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
Subject: Re: [PATCH net-next v5 16/24] net: dsa: rzn1-a5psw: Choose tagging
 protocol based on compatible string
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
 <20261120002549.1908299-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
> the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
> and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
> ControlData field differently, so the tag protocol cannot remain fixed.
> 
> The common tagged frame structure is:
> 
>    +----------------------+-------------------------------+
>    | Field                | Size (octets)                 |
>    +----------------------+-------------------------------+
>    | Preamble             | 7                             |
>    | SFD                  | 1                             |
>    | Destination Address  | 6                             |
>    | Source Address       | 6                             |
>    | ControlTag (0xE001)  | 2                             |
>    | ControlData          | 2                             |
>    | ControlData2         | 4 (timestamp, portmask)       |
>    | Type/Length          | 2                             |
>    | Payload              | 0..1500 / 0..9000             |
>    | Pad                  | 0..42                         |
>    | FCS                  | 4                             |
>    +----------------------+-------------------------------+
> 
> The ControlData semantics diverge between the two switch families:
> 
>    +---------+----------------------------------------------+
>    | SoC     | ControlData bits                             |
>    +---------+----------------------------------------------+
>    | RZ/N1   | [0-3]: ingress port                          |
>    |         | [4-15]: reserved                             |
>    +---------+----------------------------------------------+
>    | RZ/T2H  | [0-3]: ingress port                          |
>    |         | [4]: timestamp timer select                  |
>    |         | [5]: reserved                                |
>    |         | [6]: RED period indicator                    |
>    |         | [7-15]: reserved                             |
>    +---------+----------------------------------------------+
> 
> Because these differences affect protocol semantics, select the tag
> format through compatible specific data. This allows the driver to
> choose the appropriate tagging protocol for each SoC while preserving
> the existing RZ/N1 behaviour.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - No change
> 
> v3->v4:
> - No change
> 
> v2->v3:
> - No change
> 
> v1->v2:
> - Updated commit message
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
>   drivers/net/dsa/rzn1_a5psw.h | 2 ++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 8d7cad90d613..c59d881ce10f 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -99,7 +99,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
>   						    int port,
>   						    enum dsa_tag_protocol mp)
>   {
> -	return DSA_TAG_PROTO_RZN1_A5PSW;
> +	struct a5psw *a5psw = ds->priv;
> +
> +	return a5psw->of_data->tag_proto;
>   }
>   
>   static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
> @@ -1330,6 +1332,7 @@ static const struct a5psw_of_data rzn1_of_data = {
>   	.nports = 5,
>   	.npcs = 4,
>   	.cpu_port = 4,
> +	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
>   };
>   
>   static const struct of_device_id a5psw_of_mtable[] = {
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index 26d201931453..58690f5f3887 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -236,11 +236,13 @@ union lk_data {
>    * @nports: Number of ports in the switch
>    * @npcs: Number of PCS connected to the switch
>    * @cpu_port: CPU port number
> + * @tag_proto: DSA tag protocol used by the switch
>    */
>   struct a5psw_of_data {
>   	unsigned int nports;
>   	unsigned int npcs;
>   	unsigned int cpu_port;
> +	enum dsa_tag_protocol tag_proto;
>   };
>   
>   /**

Hi Prabhakar,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
