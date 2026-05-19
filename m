Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA0376A0F;
	Tue, 19 May 2026 14:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201902; cv=none; b=t2Sl1XeknCq7E2UBjMPnvn5xMHIrZk4+/1iaVFblpXJ8ErqTeid6OaUW3uQEW1Z9o/fOVfIT+9O5Q+5cZ7jPoGJgXQWpolsrzKB+THmySlUT4I6O7EViZ0Ao+aw1s57ZRllxgEyi4Do+OfVg5UC5kNvwdHkc3uxuPHKqaSGPz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201902; c=relaxed/simple;
	bh=GfJBGOrJX8zseLt8bHkGFdVnHP59hHjNP00vIllEVnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGinKc3Frtd/v7cXcrjF9LMt5Fex0P2i0cVQ6XCVzcxQG26pPcreWwX2vVRUwWUWGrB8wu8rqyfLHDBKZaw1dcfJl3qgZmON3/u3uJJz8FCyDaYAFxXBR+VDnNeHq5ZrMxmqpfpLRVmJCrJ9COewsoKyAJYBXqIAHiwUT9FUjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UxP3EnTX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UxP3EnTX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rCWmDjb6QlG0p+c+DVYWjWo/iZPdmAjXivYJpRn3Www=; b=UxP3EnTXxgtqiLyO0j4jiXK+NF
	EU6OLNwwlvHtcjqoclJfxvCoA1h6pbAPM1q+VNa+ZHb/Uvhs+ZCbITckPgUTWAenGn+RjN2lXGlC8
	w8/9ghAFMAOOGOK35jwI5llS/TMI8nz2dBovv3zks337aXEUukzUvrxrL28JHPg2bWLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPLgc-003gPV-1R; Tue, 19 May 2026 16:44:46 +0200
Date: Tue, 19 May 2026 16:44:46 +0200
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
Message-ID: <a59c05b3-aacf-4f36-a172-0fa3eb74ba0c@lunn.ch>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
 <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
 <5102480.31r3eYUQgx@steina-w>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5102480.31r3eYUQgx@steina-w>

On Tue, May 19, 2026 at 04:11:05PM +0200, Alexander Stein wrote:
> Am Dienstag, 5. Mai 2026, 17:02:12 CEST schrieb Andrew Lunn:
> > > +/* GBE1 */
> > > +&fec {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_fec>;
> > > +	phy-mode = "rgmii-id";
> > > +	phy-handle = <&ethphy3>;
> > > +	fsl,magic-packet;
> > 
> > One of my FAQs: Has WoL been tested?
> 
> Well, I can "wake" the system per WoL. But resume stucks after CPUs are up

So probably not a networking problem, somebody elses problem, so this
is O.K. for me :-)

Thanks
	Andrew
