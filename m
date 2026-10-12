Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12D489FD3;
	Mon, 12 Oct 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808047; cv=none; b=bzYRb826cpjnYhHej+ufOkPBFF0wdSxDVPQD3J7+PVUdQMFX7XekXI06la35xGye2ShPk/zdZe/ZePrDSL4iwRO44S0iWhV8SeiooaGArUWQb/l22D4uOzPMEMz2pWt2iASeETXllRQZjucWhSkVqIRlTthrYQWD2MuHCOHs/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808047; c=relaxed/simple;
	bh=z/feuDYahDytH7NB2fmq4qSkF3aElbUiGkaBTQzX2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMBC6cyth4kvebJoYbyjPEIFG0nxHHODZn7ulT+WQKOtUyYUSI4KVCNDiuk7ndD16pGysOUoYJadq13ctb9GhN3DtpAbtMbrUesO8M1pUDsGB2E2/TWcZspzLyNkjMBDLzOV+ooL9UQ7w2Y4Kq4NuOCCgAxdk2kQNAy8VLbmx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p5N/ddz6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p5N/ddz6"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C64732C6;
	Mon, 12 Oct 2026 14:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791807914;
	bh=z/feuDYahDytH7NB2fmq4qSkF3aElbUiGkaBTQzX2D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5N/ddz6dlGzG0PbdQ+bYDdHCfSunQi3bbgjyEN0LG85p+czFK9IK8jyuFkYNrw/D
	 OhhOTe9Dth3XEArNPncKmtTRiJAEYiBpECztgtUokrxSFnITAw/2sAq4FOGkLKQum9
	 zZDcsZEpPps5+FDgnlGffYZBNpBGI7/W1TT1/uC4=
Date: Mon, 12 Oct 2026 14:27:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Message-ID: <aszQ4RY3Sd2ieDW5@zed>
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
 <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
 <CAD++jL=v8wESqKxsYzsQSqkKNVficLhD8Mx8a9Rkn4RhgZcgTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=v8wESqKxsYzsQSqkKNVficLhD8Mx8a9Rkn4RhgZcgTA@mail.gmail.com>

Hi Linus

On Mon, Oct 12, 2026 at 11:36:33AM +0200, Linus Walleij wrote:
> On Mon, Oct 12, 2026 at 11:20 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, 6 Oct 2026 at 00:14, Linus Walleij <linusw@kernel.org> wrote:
> > > On Mon, Sep 28, 2026 at 2:21 PM Linus Walleij <linusw@kernel.org> wrote:
> > > > Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> > > > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their
> > > > video endpoints, and enable both blocks on the RZ/V2H EVK.
> > > >
> > > > After these patches, and enabling the right Linux drivers, we get
> > > > this in the console:
> > > > mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> > > >
> > > > This was done in order to enable booting mainline with mainline
> > > > device trees.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > >
> > > Rob ACKed the final DT bindings on this v3 patch series so maybe you
> > > can apply it?
> >
> > Media DT bindings should go through the media tree.
> > Thanks for your understanding!
>
> Right, fair enough.
>
> I think Jacopo merges these for the ISPs, I'll take it chill.
>

Sure, I'll collect v4 in a PR. Media doesn't take non-fixes changes
after rc6 so this will go in 7.5

Thanks
  j

> Yours,
> Linus Walleij
