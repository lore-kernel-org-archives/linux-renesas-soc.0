Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204206;
	b=Ru5ibJl5+xVgbMiOv9iayVUO4zNjD0Apcjm4wKJNVbYEn/nj4MxOCbOpotRCcpxarpO4
	 R/kB7Dzmh1+C9qS91wb3YcZjrBYkg//JpYAKnbPNIYoFIchDCuecHEl72vYQE/NT3d2ti
	 syVylVDnF54tjRpzJRhoO+qJfJx7/zlMk7CD35g8aho8WJQraSB741HHt7qA7KKXFrJjr
	 ra4zfgO+69D79C1Fa4gyNyYXNY3dT9vKa8dk9ffeaXgzxW09czlaGz1n/1Ph12eYMbue4
	 SXdJwAK5EsIDvYSpgAq15/0MOSKv1PiuYPSALNPPv99R8J2z27FX12/Z8BPSQYGlDSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204206;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rzdmCVxlS67chY2L1kjSiskNfIgZrwVXGAL3N6uFPfw=;
	b=Nr6Q62XhYTeZNx5HdSpuxQaUsuu++5XnPnfWkw94XpYYuxqFLXKNk+ftRmhjTpaO2LEl
	 upF4AFffr9PhmsO7kfVLwEpMQUK3Hq3UrmRV9WNCxyoanN7gzQ5urpqtdvDwqRP4DOVAE
	 ib3pNAI/sUAAuatKuDZE23RCmg+DcFT4Sr3E5q2U2m8waJycZETcmir6T+2v5enBK6Mhf
	 gzaPwSKYeVrb4fJYWjTRPrw5Ac79kDS1Gn2K8Eq3pc1fbyoTSH97dNoFP5qSpYrWimWs7
	 aF2WP+ZZPV+ALMPPCENzsmq9vqouCFkqCQI64OIVfvGlAj7NFPbaipnYfOS6Ns/cNxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lgAPx2nt;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB392606A6F7;
	Fri, 20 Nov 2026 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB392606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lgAPx2nt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rzdmCVxlS67chY2L1kjSiskNfIgZrwVXGAL3N6uFPfw=; b=lgAPx2ntaPt+MVZe9dKhcz/Q1T
	Y4dokAPgvwtLT/WuXMPP9Uh6zCsKdZUfoE1VfRkPuCIpV3NpmtTxvW9hxDjUdV0HPPQN+m+SfpQ5J
	c6NntfQdZ6z5jSN4nSdAMhiNFMMtVVTSs6aHoIiiCFESBSW7ECEO2Y8+vEsMlbbjy/PE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUUc7-000MtF-5m; Fri, 20 Nov 2026 20:49:39 +0100
Date: Fri, 20 Nov 2026 20:49:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Clement Leger <clement.leger@linux.dev>,
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
Subject: Re: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table
 size from OF data
Message-ID: <591a0ba2-bdee-4568-9e92-839c4a1fd337@lunn.ch>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
 <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>
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
In-Reply-To: <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>

> My intention here was to keep changes minimal so that it's easier to
> review. Since the fixes patches will go as a separate series, I would
> like to keep this as is. Hope thats OK.

It is good to have lots of small patches, with good commit messages,
which are obviously correct.

Just stick to the 15 patch limit in one series, and have a couple of
series to add the full functionality.

       Andrew
