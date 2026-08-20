Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEE1FF1DA;
	Thu, 20 Aug 2026 01:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787188481; cv=none; b=hQnTAU+IFqW6meI5uUi5x5hlmwRBHQ56C9dqtFonDM2+pW03hOOl0y/mkrx1bvSqOxy6+gpCMgDHaB8Uw6d5RADkULaQ9tSWLXoh0sQaMuiFSJdDimW9b280EyC7kL1/4mK34L2vNRr9fg/0UZkljmOnwyAGrOTftkOWJuS+rxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787188481; c=relaxed/simple;
	bh=YZIOLcg3lbGdEWhjUb8tlJcE4fAXnBy5MUryhub+57o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gg7P1nxTPJnjhJjeaiSB4zhIHGarCqkKY608TkqVinAwVb4yeQZQYOPTc/9va8I9UboOfZpaIDg6PTZwSTa0ulaw2fg0EhmNPx4mQdj13nFRrtQu4ilNCcU9u9J0EqqBQjFRodJkIGsgBFXw/34HMlXT73bYiLQRRL+WFaNR9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=CCpFde5P; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="CCpFde5P"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3C535CC744;
	Thu, 20 Aug 2026 04:14:28 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3C535CC744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1787188469;
	bh=bq3Omu4gGZzFbD2DTaAAE+dSmKH2nlM4i13I4lWDbV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CCpFde5PW8JEuvJtt3jCpKGWS18oxxTCoE7sNRl2BhxcbPrI36TinJitq55nGDfOB
	 An1mlBlFd6nkSglwjkPSiorvBfT7lj+M7vLLMWfA8UI2jwj21Y7AJhORwbIERJOi14
	 zln8A8dcqNyhDM7VftlPqaA6EZTvuzdwi9ujJNWpWSDe1ypafvfLXLGrQdy8XpVVnf
	 wd+bVg31PesqQauE6RLmjD2TpLkT4DZ4lISXyz0HOoZpBXCKrdIRVNBrdGkdWBJnQ5
	 CcjhHpkvUUf1XmBML/waMnc96m9I/t1svcQdKNht98Dcqjuf8+EMyMnjCWuJxBBHRa
	 tr2Oshwr/BHLg==
Message-ID: <138761b9f38b027bd4bd872e3a353075a7b11efb.camel@rendec.net>
Subject: Re: [PATCH v2] irqchip/renesas-rzg2l: Fix loss of interrupt
From: Radu Rendec <radu@rendec.net>
To: Biju <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 	linux-renesas-soc@vger.kernel.org
Date: Wed, 19 Aug 2026 21:14:26 -0400
In-Reply-To: <20260818110937.5816-1-biju.das.jz@bp.renesas.com>
References: <20260818110937.5816-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-18 at 12:09 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> rzg2l_clear_irq_int() and rzg2l_clear_tint_int() perform a
> read-modify-write on the ISCR/TSCR status registers to clear the bit
> for the interrupt just handled. Since these registers are
> write-0-to-clear per bit, this is racy: if another interrupt's status
> bit gets set between the read and the write, that bit is written back
> as 0 by the software-constructed value, clearing an interrupt that
> hasn't been serviced yet and losing it. This can be reproduced by
> triggering multiple interrupts at once, e.g.:
>=20
> =C2=A0 gpioset -c gpiochip0 355=3D0 353=3D0 328=3D0 352=3D0
>=20
> Fix this by writing back only the bit being cleared, with all other
> bits set to 1, instead of read-modify-writing the whole register.
> Since 1-bits are left unchanged by hardware, concurrently-set status
> bits for other interrupts are preserved.
>=20
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller drive=
r")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
> =C2=A0* Updated the commit description.
> ---
> =C2=A0drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index f6b2e69a2f4e..b3774f82855a 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -161,7 +161,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_pri=
v *priv, unsigned int hwirq
> =C2=A0	 * falling/rising-edge.
> =C2=A0	 */
> =C2=A0	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq))) {
> -		writel_relaxed(iscr & ~bit, priv->base + ISCR);
> +		writel_relaxed(~bit, priv->base + ISCR);
> =C2=A0		/*
> =C2=A0		 * Enforce that the posted write is flushed to prevent that the
> =C2=A0		 * just handled interrupt is raised again.
> @@ -177,7 +177,7 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_pr=
iv *priv, unsigned int hwir
> =C2=A0
> =C2=A0	reg =3D readl_relaxed(priv->base + TSCR);
> =C2=A0	if (reg & bit) {
> -		writel_relaxed(reg & ~bit, priv->base + TSCR);
> +		writel_relaxed(~bit, priv->base + TSCR);
> =C2=A0		/*
> =C2=A0		 * Enforce that the posted write is flushed to prevent that the
> =C2=A0		 * just handled interrupt is raised again.

Reviewed-by: Radu Rendec <radu@rendec.net>
