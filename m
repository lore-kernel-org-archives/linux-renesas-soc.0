Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157618;
	b=NWHsKtE7e7a6Drnv7RwuwOW93sdp7UMq3DjD4ZVRvhPhD+nZh6tTrRNsN+mHZZQkS65I
	 yrvCU+lu/JbQwIX3P8yfPDD63NJrNyjxmxmWONPo4Y+Be7O82IfDjoAW7S9L98QK0f6v9
	 2fWRa55tJkUzNFvgUx+gzjdj5kCAMt7WOXe85yh0pe/Qc42RGb7kvR1Edvfmh0A+nhf5z
	 6oC+LdlTgcPhNIU/kOxU2F1MXAeGhHWTULASGT6qcsMXP7VxNupRLH9D4cX4IN0Uq+57A
	 n/HxRc+OpxzE/G00bSYOpiftH+C8H/asBOl2Remqlrkpf0tSffVMW8fiGHxam/z929g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157618;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/5mED0zlZbWclf6hKMztAT43+oQHdLuqWKYHDbNLEWs=;
	b=N74bYxWE4RFwxf6CqH8QocQHIkpHM0C6x6M56GxA7Uxi/QKKq/yOxZ7362BJstA5VIoF
	 yfsB/bGorfLKm6Rhj6uLIauuhLDWS3/cHM9v2TnV/Oz+F2I5EqclUfQ/FgTBQj+CL+/Kg
	 HgtlvPviJ+azuq0+LzCX4gGbarSgZECzB4ez0hT6G89SdryN+hZZgWE9mXNvlb0817oKE
	 2e6accVM92OWGfEFe8pdVGv2I/MFZWudMtq+WtyruE8vNXjBNcsc21qhkUFakEnl6u7cK
	 FV/5d2F6WtXfTzn5CZgNaR79UxT2YZyTw41gAK94FBBzeKcb0tXHRu9snQ/4vDmabJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=asPFejUS;
	arc=none smtp.remote-ip=91.218.175.46
Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A13606A32C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 06:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A13606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=asPFejUS
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/1Qnc6yuGP8/bJRwORfaWD/9W6hWPIsUbF/BQQzaA7M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795157616; v=1; x=1795762416;
 b=asPFejUSo4rwADv4+XgGNJxilMmZN3T+sCQ9Ov161PWTh4+IPJpEd1qWKXUfmSZ9N5o2vsiK
 dhA6xanVXGMADfwPHMEAjEEy5cwLwdaRJgKZhS07ABKPCnj2nTGcKpUvZExqjFs3U/SEfF2rMPn
 s+P8XN6rcg6l1DjhY/Y8g4vE=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7c91ca9ef99ff3a;
	Fri, 20 Nov 2026 06:53:36 +0000
X-Mizu-Trace-ID: d7c91ca9ef99ff3a
X-Migadu-Flow: FLOW_OUT
Message-ID: <77d4edbe-b4fc-480c-860b-5880fbd807ea@linux.dev>
Date: Fri, 20 Nov 2026 07:53:35 +0100
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
Subject: Re: [PATCH net-next v5 11/24] net: dsa: rzn1-a5psw: Set driver data
 in probe
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
 <20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> a5psw_remove() and a5psw_shutdown() retrieve the driver private data
> using platform_get_drvdata(), but a5psw_probe() never sets it.
> Consequently, both callbacks return early without unregistering or
> shutting down the DSA switch.
> 
> Set the driver data in probe to ensure the remove and shutdown
> callbacks can access the private data and perform the required DSA
> cleanup.
> 
> Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index df3b3f75b489..0e4bbf34ec27 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1221,6 +1221,7 @@ static int a5psw_probe(struct platform_device *pdev)
>   	if (!a5psw)
>   		return -ENOMEM;
>   
> +	platform_set_drvdata(pdev, a5psw);
>   	a5psw->dev = dev;
>   	mutex_init(&a5psw->lk_lock);
>   	spin_lock_init(&a5psw->reg_lock);

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
