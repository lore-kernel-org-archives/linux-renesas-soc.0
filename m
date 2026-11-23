Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447499;
	b=fk+xTQt6bcnlP7PrUzgowZvor+7VyfMu24tZgNCm8qSIXFWyWm8Go/IkbgEuwnRP6ZQC
	 Q8SOj1JKZUiYoQX4Bp12e6qECInaPNerXqVeW8bYrZP6/GLLhV/MTzUxBczmbgAibWhL3
	 QhYp3XPYIcpuKjB19AGM0iQzpIcR7916OUZ1410AEEaFFvU5MsrgQ2cLrBYX2/at0WrWL
	 xHTMc7GdLWFMVKhPJSK41V9LfdKyfTpfa1NuUvb+yBXUs8vrO6rX/9sVFlxvssY8ZM/Sw
	 Cygo7Ry3h+biI5G7AZy7KSnHzsgPwg3d/vfh29hbUjzsIuMyIBe7p7CsAPJxohNcITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447499;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hU6lCuXcSGRGPK5UfUxs40iBp8ye+14Obren8ukXLbQ=;
	b=czlq83SYqjO6JHP/HnJMEx14sbFN7VW2F9wP4zk29cUQPeZbfGHB6ibyORSLM2u2apv8
	 WA7/2m4NlYCsMFtHEXDD88RL4xgu4ewcJgt8d0Q6+3pdkcpdSzciVAP7zq+EvHmgldGfk
	 syvHvZSlNBuZ3HWUE8iol7A5ib9+qJTetVbNwqSEk1qNgS0bDTHpGZ8uCSArCs6vOQKwc
	 UfGW8bfndXo/WCI+p+trZBp72gkUCn7H4sO+zd8wo91FFxSFBa4YPsZkiFBuYx5rqMTLf
	 oCFoHUnc7EXdtiaxB5BviZafcCivffj95j07YYog0YHz5FU090D0Rg42V5+eh9xHqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gxVQky7b;
	arc=none smtp.remote-ip=91.218.175.124
Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714FF606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 15:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gxVQky7b
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w69mSWUbKNyFWa5SNC3RxlJB/92Ei48ZvSabQKErQrw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447496; v=1; x=1796052296;
 b=gxVQky7b5fSMJm4NdKilc59dIzzYJ23qDvX9Wrracg+DlP59zBVhhO+3mJxI9IaogZn2kkBD
 AtNE2O+iCrEDnMPsMTFsADCISIsKjyDg67ebJtOjaqQet9NzzLvyHp/EtRa9nPuLjjBlny1V/Ae
 794v+b6BRbrWBGqsB+tkAE8A=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1060c7766cc6e36e;
	Mon, 23 Nov 2026 15:24:56 +0000
X-Mizu-Trace-ID: 1060c7766cc6e36e
X-Migadu-Flow: FLOW_OUT
Message-ID: <b43ca10b-6ef5-4114-8d9b-cb1eafa22765@linux.dev>
Date: Mon, 23 Nov 2026 16:24:51 +0100
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
Subject: Re: [PATCH net v6 2/4] net: dsa: rzn1-a5psw: Fix VLANTransmitted
 counter offset
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 stable@vger.kernel.org
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261123130852.3420491-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261123130852.3420491-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/23/26 14:08, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/N1 hardware manual places the VLANTransmittedOK counter at
> offset 0x8f4, not 0x8ec. Correct the register offset so the driver
> reads the counter from the right location.
> 
> Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v6:
>    - No changes from v5
> v5: https://lore.kernel.org/all/20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>   drivers/net/dsa/rzn1_a5psw.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index d54acedac194..9693f8503b0b 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -185,7 +185,7 @@
>   #define A5PSW_etherStatsFragments		0x8E0
>   
>   #define A5PSW_VLANReceived			0x8E8
> -#define A5PSW_VLANTransmitted			0x8EC
> +#define A5PSW_VLANTransmitted			0x8F4
>   
>   #define A5PSW_aDeferred				0x910
>   #define A5PSW_aMultipleCollisions		0x914

Hi Prabhakar,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
