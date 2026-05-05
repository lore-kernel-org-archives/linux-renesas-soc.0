Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10B480971;
	Tue,  5 May 2026 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993346; cv=none; b=LoJqSkutPAWyEpBTl8ag7gLRGwTPhGEGNDl/R80wXq7gjb20mM0UOxkTxNsmT1cMqbtot9d8iKkHY7PJkATptZS88C133CUa0HOxMSfXK4bNasSqQxkoJTWsbITNgo5tD+cWO8ctDk1bnBk2vFHkAepYlIK9PlZKN5gLnpNn3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993346; c=relaxed/simple;
	bh=D5NM9D45U+HRxtr4zS0rhyXNBvtlLryblFSilZm8AM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFy+fT1GWafNf30cnCGWqw+9MhK4RYmHx1dIw/2oLwB618IyLQHNHoVdYUnwn5bD9F3ivwrc63J7DjsyC+WUCvupG6jA/xSBjImXesUzDkYC0iYqhSaksek7Ik6CrmsoWf8d1hh8POtLW5+g+Sr91Whs+nfXj8LN9a++hOeA7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=D85IxtV+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="D85IxtV+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+qiW4xxubIB0MR1bojP/4mlYxoFshGCTX1h3dtN3LIM=; b=D85IxtV+T0xm75lvOV74ujn0fs
	FpNxV4oHsYQcQCqXOB5aTfzjdGn8BdOX5ag1CfvPMAIE+agsMBIQoO7MBGZRP8OI1OG4dx2mFMNEr
	4PSkrkKLdUtIhIsFg4PLNRWVGYEaDtA0LalI60SnFoLP4b2Jt9MHvC2zOZn97MummApo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKHHo-001U0Q-NX; Tue, 05 May 2026 17:02:12 +0200
Date: Tue, 5 May 2026 17:02:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8MPQS with i.MX8MP
Message-ID: <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>

> +/* GBE1 */
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy3>;
> +	fsl,magic-packet;

One of my FAQs: Has WoL been tested?

    Andrew
