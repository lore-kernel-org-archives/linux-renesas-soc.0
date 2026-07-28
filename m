Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21C3CFF6C;
	Tue, 28 Jul 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221953; cv=none; b=oZNZSQKnI85R2fWX9MA9MCMGSbz0sucEFFGofHBVeIF+JdWnWDSBUmw9Us9T7Ur5SvZY4Z2/ndHEWK3M0vlhrvLu4dJTD81W+OHyQpZix41oEej9qKoXpX55KdP2CODbvgqYG3dhgku/C+9sizORr9VuOFK4vGhDPPI+rfgYp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221953; c=relaxed/simple;
	bh=oH4rhgdMdFfx++tPXkRBSHBMzXfWRQTXcCQfuMeDTQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fogn+WI7kSbLfJ8gaJ+XPYTT1zxgZOK+UDKxRotJ2nx19h29EzgvMP1QXyyV7BbTsKSbMv/Ff1+t6ooTxkrGIjLIADqfYzYu2vopCzXBYGhaHdh6yGVcEBwAFd9XEQI+ziv0hsc/cFEka/EljcVsU9wvvddgi8n7MRc/pJEWOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EC8B9202053;
	Tue, 28 Jul 2026 08:59:07 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wobmN-001g4I-2s;
	Tue, 28 Jul 2026 08:59:07 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wobmN-000000001x1-3Urk;
	Tue, 28 Jul 2026 08:59:07 +0200
Message-ID: <5ab83f63a1c5c62cf90f7cb15590c3e4cfc18436.camel@pengutronix.de>
Subject: Re: [PATCH 3/9] media: rzg2l-cru: Use bulk reset API in
 rzg2l_cru_start_streaming_vq()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Sakari
 Ailus	 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 28 Jul 2026 08:59:07 +0200
In-Reply-To: <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
	 <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-06-16 at 19:05 +0200, Tommaso Merciai wrote:
> Replace individual reset_control_deassert() calls for aresetn and presetn
> with reset_control_bulk_deassert(), and consolidate the error path labels
> into a single err_assert_resets using reset_control_bulk_assert().
>=20
> No functional changes intended.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 ++++++++-----------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 5185a547461d..bf61a74f8f74 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -672,6 +672,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned i=
nt count)
>  {
>  	struct rzg2l_cru_dev *cru =3D vb2_get_drv_priv(vq);
> +	struct reset_control_bulk_data resets[] =3D {
> +		{ .rstc =3D cru->aresetn },
> +		{ .rstc =3D cru->presetn },
> +	};

Why doesn't this also request the resets in bulk?

regards
Philipp
