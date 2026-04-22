Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9C3D1CAA;
	Wed, 22 Apr 2026 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858150; cv=none; b=CK7gsfCv2jCJ0Mt5KwO6y/LEW1YIPkFuBgmvPvLhPzicIRwfflwt0Uy13dec4b+0qVOzcBHPsbEqe1FOISu5re4JalFUQiYiUlIx2tuMtLIbfLBP5BSJ6TjZy2bsAs0Mka8GQ6YSVNCIUgwgP87iL0LHRNFYb6JNGFM3p1d6/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858150; c=relaxed/simple;
	bh=+gm1pnoDIi8SCVbGdJ7sHWVYZxQN5Mdvee6rXsonTBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnZTwH2kHNRwH5kWKSQRbRnIS/RZMWVNNb7uvveHtcNVDn675tpK0v4GmCFyzuohUyASC0loDdQePsYi7d/EPoCCQetBEujc8GoK8FEWGlREUVmodre3PqFuJ9c28i3jedxErJoZ6j16RFoBev3+9wbVc7ltGjGC/d4eTTTD0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=IyHByBoZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="IyHByBoZ"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8D08F1F95F;
	Wed, 22 Apr 2026 13:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776858138;
	bh=cxVjnXVnQ4o2Yj0yc0TUJWtP9ZwdF5obJ1mgQ3ITq3w=; h=From:To:Subject;
	b=IyHByBoZ0yua7HveDK5Qz7y0M2k8bOkuJLUBq6ifP2jQWQkjbp9HeS6V/FozP0lnr
	 4lS+SjUB0cyT/6/jyyXYGr8SiQx+/eHIuIGSBI8nd2orIY8P6rdgNdYkE05sBHxX4Y
	 bC/ZfvVQbvfZouBaymcebs0Mns++XxuQghc6RvCnoQ959cM/VXa+VtitYunfO7mGxj
	 UtAsh6towM0vAiJ66ZDjkDROIAxDee6oVMMkDflO1EqDE9aoRl36xXS5yo+S4QPmPZ
	 rwIVwdc2dfGIuKJrSuS591FC33hMBt4RsqabHzn19LkGbYYTCai8Xy46c/lDscddfe
	 15Ovc8Ugs+3OA==
Date: Wed, 22 Apr 2026 13:42:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <20260422114213.GA68897@francesco-nb>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5988897.DvuYhMxLoT@steina-w>

On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > [..]
> > 
> > > +
> > > +	reserved-memory {
> > > +		#address-cells = <2>;
> > > +		#size-cells = <2>;
> > > +		ranges;
> > > +
> > > +		linux_cma: linux,cma {
> > > +			compatible = "shared-dma-pool";
> > > +			reusable;
> > > +			size = <0 0x28000000>;
> > > +			alloc-ranges = <0 0x80000000 0 0x80000000>;
> > > +			linux,cma-default;
> > > +		};
> > > +
> > > +		vpu_boot: vpu_boot@a0000000 {
> > 
> > Should this be memory@a0000000 ?
> 
> According to schema in dt-schema repository [1] the node name should
> describe the purpose, so I would keep that.

See this question on the topic, and the related answer from Rob,
https://lore.kernel.org/all/88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com/

Francesco

