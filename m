Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47F52F28EA;
	Wed, 27 May 2026 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779849058; cv=none; b=VlPAs1RsbB9OO36AQ2MnJd/I8LDvZuw1pyXW/8IhAUEz8tkuPRiL3hDh1NfbA5fd1VQpxbCIQXtVORGXoapQGVa+iZ7pf1FCuZwnpJ0LXb3MvuU0PHoKSi4nF6wwmQcS2LBZIXE44QWKDehUKkd+3yGBy5uYPipNylswWliinhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779849058; c=relaxed/simple;
	bh=lpr9xFXmjkNhPC9HzvxzWnPCgQ3zrHpMC0tkqgto9vg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mQnlW7enI8ctRCUrBrlFq35QqNGkbt+fi8npQAwC1rg7WPMvE7MMjoExeNhysf+3DdqsUz4CFUJicC93coVy/DjS07uf/W8pJvXMeqRnHMQH+shZej26Ja1ON3IYTybxYu1OJnxgZp2sb3xeZ7iUvW5q5Nxr8YC0srzScPT4nt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=iaw4GdLk; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="iaw4GdLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779849053;
	bh=lpr9xFXmjkNhPC9HzvxzWnPCgQ3zrHpMC0tkqgto9vg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iaw4GdLkKPvJimvx0rRGPb1FU4Og6DZcEVWiEFk3C4ea1qo/69d9KV7zgPPlYFrLg
	 3qCpRwECTDFtqxyNvqiY7CeIS52rjWDyz9tJ9seSNbP/wq958BRXok6rUq6uf1s9as
	 L3uoqUFb3GDz3UezCLDC8sZIKkCBAcAoYrHqcfVia4ka+Co4wfiiKsHAEqL8k+H4iF
	 Xp61ckQRtn+Bjw5ncWT5sE1ASUS7X1R+3Uq1dhraKFoSXYQmSbIE+1zy0LgOBRLAG0
	 T0r/q7F647PkQZtfsOFXuq3VexiER0SMscedY8dhYRd0CzAQ/rqbft/4yCNvaa4aPO
	 TIjAj6saULZ5Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00261607F4;
	Wed, 27 May 2026 10:30:52 +0800 (AWST)
Message-ID: <a0a62d6bcc1d1253a38fa166f4b121caf0463345.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Neil Cheng <neilcheng0417@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, joel@jms.id.au,
 geert+renesas@glider.be, 	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 27 May 2026 12:00:52 +0930
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
	 <cover.1779157117.git.neilcheng0417@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-19 at 10:38 +0800, Neil Cheng wrote:
> Add initial device tree support for the Meta Rainiera6 platform.
>=20
> Changes in v2:
>=20
> - reorder adc0/adc1 properties
> - add Acked-by from Conor Dooley
>=20
> This series adds:
> - Meta Rainiera6 compatible entry
> - Rainiera6 BMC DTS
>=20
> The DTS has been validated with:
> - make dtbs
> - make dt_binding_check
> - make CHECK_DTBS=3Dy
>=20
> Neil Cheng (2):
> =C2=A0 dt-bindings: arm: aspeed: Add Meta Rainiera6 board
> =C2=A0 ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
>=20
> =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-facebook-rainiera6.dts=C2=A0 | 1012 +++++++++=
++++++++
> =C2=A03 files changed, 1014 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rai=
niera6.dts

Applied to aspeed/arm/dt in the BMC tree.

Thanks,

Andrew
