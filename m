Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157524;
	b=kahFz6D7mh/E88f/udFqCWpwD60S68/b73FrSFuWclke0j1lvvOuUmG0bvMrEpJjc8J4
	 NM25V8swcIK59/g1R/Sz3OWqorkIzZoQZCKjvTqCvzNDv+BRh+Ne/r8eQb65+eMsLuWyY
	 OBIriB6+by4sXrqJ7S9TaVP3NSudhncLzk7wRbMllx+mCqusQQExbPgLZqQKuq8RB/7ec
	 XDVL8sITb9YK55a9qirUT7gifOdBzIynuiO3Blxh7zFiA9tJNr7RMVvdZPVeX4sMoabJ3
	 vyVTIGUUWj2ZTqTWTyyDPOjia1p1YNsIXCs7SrxZnEdxrMDdMgMNhJCwz8VRkIlX27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157524;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0z0AzJNanfrVB85wgMFdgJJ5GkqCfeRb/cYUccsjyJg=;
	b=3cWzBIW7+7ovQDjXEXE0EvjIZ9ebvVwKAu2yUqLRo0N9UGNRZBgNzcNaOJi/QYABv6Zm
	 TwT/31Zd27Qo8SiCVtuuEPoXlPPRaMhO2iJn+m18HFZsl7RfBhSLoN2pFah1yNwS6ZThl
	 FOmwJuzRtBhsconzqakEV4qTPSYwfhFgcHZ7bXulB+Bl4d68JQG5qUjmyeQJBz9p/feoE
	 ra0Bdi4PYozgujmNbPTSdnvwjKJ8yEB/c4iSeqTuBHCcouxetkKm208cLuFC7CQZWAigt
	 tmOya/2VPYhC/ihM/C6CtZOw3c7a+2SuDgFMVEiE34g2pyzV1E4DVOqIN8PPno2QAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jcMVexTx;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED2D606A32A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 06:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED2D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jcMVexTx
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ro9VE7XGMtGJmsM9mnH8HIatHqmwaoWhZDuLhhpiHfI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795157521; v=1; x=1795762321;
 b=jcMVexTxKDTegToAManw+obcFWicIYkyNWBbQ8bHPCWoQIHS8oeNmQEtnoc/bqLFcE+AsWYk
 E5gvqiIkV2ACvfJguuJ26FIkKntFy9f//Qh74GihVulthqtUrTbP1pAWX2XuMuoeTRR35PbGo5H
 /3N2qFbMT7WVqAGzErsSYReM=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef437e63efd8efa5;
	Fri, 20 Nov 2026 06:52:00 +0000
X-Mizu-Trace-ID: ef437e63efd8efa5
X-Migadu-Flow: FLOW_OUT
Message-ID: <18426bef-b231-4685-bda7-665becfc6528@linux.dev>
Date: Fri, 20 Nov 2026 07:51:58 +0100
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
Subject: Re: [PATCH net-next v5 10/24] net: dsa: rzn1-a5psw: Fix MDIO clock
 divider calculation
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 stable@vger.kernel.org
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The MDC frequency is hclk / (2 * CLKDIV + 1) on RZ/N1 as well as
> RZ/T2H and RZ/N2H. The existing calculation uses the wrong divisor
> formula and can set MDC above the requested clock-frequency.
> 
> Calculate the smallest CLKDIV that keeps MDC at or below the requested
> frequency.
> 
> Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 7fd2652813ac..df3b3f75b489 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -11,6 +11,7 @@
>   #include <linux/if_bridge.h>
>   #include <linux/if_ether.h>
>   #include <linux/kernel.h>
> +#include <linux/math.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_mdio.h>
> @@ -1104,7 +1105,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
>   	u32 cfgstatus;
>   
>   	rate = clk_get_rate(a5psw->hclk);
> -	div = ((rate / mdio_freq) / 2);
> +	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
>   	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
>   	    div < A5PSW_MDIO_CLK_DIV_MIN) {
>   		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);

LGTM,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
