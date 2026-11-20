Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145566;
	b=WYdjcRhy1NDPb8DAXaaV+zntTesXY2gpekNvS4ccUFnbLwEJl61KNphBDOCz89hWne6j
	 y5KxtOMm7SvbOC21waQl6swL2S5dAuBsd9cwfnYkTFcvldvrIVWP/usa5uA0zGS1DmxVN
	 r8aVX8EXCmOg09UuKN3/+q8bw+0rILYg53eK2TsAwobHSqe/FMJUuvMI0aAR0BuXttiKk
	 U63nVqComyXfJGN0VHESPExLSQbCXAIK3g1eZyQkr28HIl11e8RVColuyUhZvKaP2sNci
	 Ych+aZszlKQFrrcQP8Q1rWBN8YmZl7FAZzxscAO/Yqm7qFqrPVJnWUuwXXtembYla/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145566;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=moPE3omPMnDmB0KDC4dZXinm6QYWFnI9LaCIp+qkteE=;
	b=smGvOc+l1VvaWGx9sf2SamEu60QR+7ZgB1NdgCJwnlA00gIsXfJprMfLYL+9i1oZpTvk
	 ukvhCTEnpJI5xYmKEOTqKehP2RyshZJA3NCUUL00L6B0KaCc7RMv/gcaZ+46BiHpK25z8
	 eUQE9Mw6BEriT+6/Kzd7zRp97OC1lfXqbyIu2Dug+FzIqzP5qcrbupKYll1naCTX2K/Ww
	 Tmm8KEARdRmWfgCbACPzRjab/X7igRfbbSsW7giSw1dAzG07xA47zGSsmky/dU5rHnMj2
	 AGzVyukBLt6kWQoysgW7jX0MTHul2omUETfPF9/bCzPMywCC7/RoDp+GJurCg5X2VsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OAtMirkD;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15175606A32C;
	Fri, 20 Nov 2026 03:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15175606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OAtMirkD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=moPE3omPMnDmB0KDC4dZXinm6QYWFnI9LaCIp+qkteE=; b=OAtMirkDw9/5uoWoCTCaXBIogR
	+Ot2EjxbQS4LkjMUv+9/YeTgOXLfpu2/BDxE3lfwZHGKLyMYu2TmdXL2Koc+9T7ttAg94ysYEraNx
	xbwdNyh8wRFD0fnludldZxw8/IvHQigE+OT5pe7qJNGy2BgO0yvV7uP1VnNmj2i/USPw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUFMb-000Byh-4c; Fri, 20 Nov 2026 04:32:37 +0100
Date: Fri, 20 Nov 2026 04:32:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@linux.dev>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for
 optional reset control
Message-ID: <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com>

> This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> SoCs, where the ETHSW IP block is connected to a dedicated reset line
> that must be controlled by software.

So it is not optional for those? At least the DT binding should mark
it as required for these compatibles.

	Andrew
