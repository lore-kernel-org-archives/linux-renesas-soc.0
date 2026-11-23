Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420556;
	b=RyC7Vai9JP5Xj8UTYgh+E3/i937UWAqMe7scr4xLvKIiiEfvKFLvTnfJjghUfnUNe+zD
	 Xf1QmzgwX1jhwk0cu0D/oOkjWHI+iFj4niKhHcuLtW07wu+Y72itEvKyFYeItwNYWExFA
	 0jaMlcIorPZMOz7zvfvLvmQ6zlRsIk1k/uhRgCnorEZdBrTuUKbDhjzSEd0Cbbapi+rSA
	 aUyyOJQp+gbLA52l8QaGQDHB1ZjBSjOH+8ULSKNJ5P6sdI8MfKl9d1NhCSD6OIAobxTQR
	 o7DtVYecl3xq4422cIlbZinbvEtEYj6t7Bl33XLN+VXsBfZxWvzQenEMc0EDgjvuSHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420556;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YUQU3dBsUJdDwQ9xKYFhn6QcsGAgc7ifYrpI/+8q6ts=;
	b=Qo7QqbXe21ENOQ5wSv/HUmzBCLls1mcn/upZurxArmHOOyvcp8x7Z6pDTGj8cGw4u40h
	 Mdndk/SnTpM+WNoiHfN3XSkk5pgLhTKtEU77bW+KKgUzhALqVrKehuHlX6e7dt7noW4YT
	 FEjWmFSYubynCou8mGddifKl1Whydz7rdcRSc1jE10jRA2IifMeVwqyai4UY2ZJVneh3P
	 /m8kGhhRJZyDpuuggB4Rkoc1ZXQqVYNz4oFY9vH+4wx3YfDzYsmvYi60nRMOVB/eCUDhw
	 Db2+yqTlV3PNxYFrP0hm6jgleUnyZo3ttv0TjI869NrkMb10W3qhcYVLN5Bq4aZnZ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EGMJKwRT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248C606A31E;
	Mon, 23 Nov 2026 07:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8248C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EGMJKwRT
Received: from ideasonboard.com (mob-5-92-38-150.net.vodafone.it [5.92.38.150])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E50A177;
	Mon, 23 Nov 2026 08:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795420401;
	bh=YUQU3dBsUJdDwQ9xKYFhn6QcsGAgc7ifYrpI/+8q6ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGMJKwRTKvlVDyVh268QA/XzFo7jW4cPhdabLDBOl7m5tsnpdTmgXZ06FVFEeZlPG
	 195ga8lI/3PnIt/l12p4DcWWXyDw5A7tbgKT+RHjQGpAZlKpS2Y77t3hWQoYd4HGgU
	 WRQgAamTvdfI9exWsE7wZN8eUh46MyxvbG7ZS0fo=
Date: Mon, 23 Nov 2026 08:55:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Message-ID: <awPxSN7wctw6xsDf@zed>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
 <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>

Hi Linus

On Mon, Nov 23, 2026 at 01:11:22AM +0100, Linus Walleij wrote:
> On Thu, Nov 5, 2026 at 1:53 PM Linus Walleij <linusw@kernel.org> wrote:
>
> > Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their
> > video endpoints, and enable both blocks on the RZ/V2H EVK.
>
> Gentle ping on this series, everyone happy?
>

I have queued the patches already for my forthcoming PR for 7.5
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pr/mali-ivc/for-7.5

> I guess the DTS patches go to the
> renesas tree and Jacopo picks up the dt-bindings and the driver fix?
>

As we prefer, I got a PR for all 6 patches ready.

> Yours,
> Linus Walleij
