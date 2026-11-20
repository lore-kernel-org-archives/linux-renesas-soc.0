Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167170;
	b=oOrTUU52IxNq5YT09slSyczUIZY+nenMzIALbWVYE7E9qyd/1PuA5aTDnaR54cpv5a4W
	 aq7xZYucf84zHwYgkXIb4/SBD2f+IjphzE2Ni/D4IkgRwAsPRfqDbJw/C8phqOAgfWLs9
	 65o9r3ZWx0MuKV2s34wWPJ1NDZIDw5bM+S8VI5yey2jjybiTaWi1XEEQYiC8N84qHjuAb
	 y8B1HMBve3/EFzgpVQ7Uy1YogPohnSJBN5oVn3fWzUG/wlqueJN6/i3HhoPWiDz33bD3D
	 s+9C17TRJ9uil1JP6uOwofoIOiMsdEBdtrS5E7xU+RatjImvd43X/VNr7DIXgsWv1bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167170;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bxsAfoUGos9HyMRI7/4tQpMU5EwXsK5G6ozcfIozN0U=;
	b=2WNcRtCSBh2DmcX9fgpqIoYWHeZtNJbgWGzNkUHEetoSqVrRZsiVcMscsvIxb+bdxEOb
	 U67PsTwEV96ja2eWcrj01mJcv8EPRP/Z8ERekwGyVd5TssGqa/Xrx42aB8HEmh5IoDjlB
	 Sr8lFAXZTkaGKeoQqR+TK247MKVDjM8M+CQWOP6Z7EqziEI2MZ40fjge8vue2Bn67adcM
	 kInUxCXBbtPyjXyDnK9h1yK03LPBnWB3NetOFMoiJowwjPPUm3HJdEPuehdNWcm4z2ZZg
	 XKhq9QwrvAgEDooTXJm9Qpl8/7iyYAH1FRCETrpZUP33tnUWbWE0io9PFDpxUuG+Whg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cGCtDQdU;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423CE606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 09:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cGCtDQdU
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2bXx+Df3DKXm0tFraN/tvLGKzRWUt5my4//0JU1vfoQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795167168; v=1; x=1795771968;
 b=cGCtDQdUzqfnrIUR/kfEDoxRF6AKHSqKmodUJQxY//ZIeqDQGMeps7KeEcYHx7pgSRsP+Km6
 Hu81kv6DKe9mPZuavwXmmrStuvjQgpIb/iSpXh9QiuFr/9z7ZhcstU/81eb3wS+VxqC76mPQSWQ
 57IAgiwaoqeRoFkXRhnb5tyw=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1e58ce883610dc5;
	Fri, 20 Nov 2026 09:32:47 +0000
X-Mizu-Trace-ID: a1e58ce883610dc5
X-Migadu-Flow: FLOW_OUT
Message-ID: <0ff0a7ec-b899-4668-a245-196ed1032548@linux.dev>
Date: Fri, 20 Nov 2026 10:32:46 +0100
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
Subject: Re: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config
 description to cover RZ/T2H and RZ/N2H ETHSW
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
 <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
> the same tagging format is also used by the ETHSW blocks found in Renesas
> RZ/T2H and RZ/N2H SoCs.
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
> - Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
> ---
>   net/dsa/Kconfig | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> index bdeb60af764b..3c18314aee95 100644
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
>   	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
>   
>   config NET_DSA_TAG_RZN1_A5PSW
> -	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
> +	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
>   	help
> -	  Say Y or M if you want to enable support for tagging frames for
> -	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
> -	  destination MAC address.
> +	  Say Y or M if you want to enable frame tagging support for embedded
> +	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
> +	  SoCs. These switches use an 8-byte tag located after the destination
> +	  MAC address.

Hi Prabhakar,

I would fold that in the commit that adds support for the  RZ/T2H, RZ/N2 
itself (ie patch 23: net: dsa: rzn1-a5psw: Add support for RZ/T2H 
Ethernet switch)

Thanks,

Clément

>   
>   config NET_DSA_TAG_LAN9303
>   	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"

