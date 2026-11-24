Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506924;
	b=AHDNiefBqmM+DT79NT/cwBaN4ZtV+g7DiyOHug78ahR/zheT44rTVRo8VKBuEe0Drlo1
	 BkSSBnaWy1z6jHbI1qqdlGBS7Gh0SIOopaZJihJycQOaoqxDEdXSVxDU0PQYayCbOqOtZ
	 9I6ShoxFW9nDDb+kzdd+5rBLc9n+SwP8LOozhMMI4Eo95ght/V5gNEeG9/Ms5iFQVcMKz
	 Et7wIXQmd2fX9MODV+SWE2IMxBZqxIKzhgjji0wDD/nNgiu2AF1JvKZbAMMA9B15pmoOX
	 5cqG3EpftRs91keBVOUT2ajNUNgleYiuVGkAKf7QtcgTQdIGRDMBRrKAES8bPWTX1OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506924;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=o6hlEGzHynEAgUMIdJXIvc2d4G6b+TZdNdR1Dh4smQU=;
	b=e5zkzF4LApyPKNU/tnuPRyyRpuutQdjcwW+VQPDV3UTFBXBL1Ad1pskDCzIQvnSVdjjE
	 tvP90WsB+6CCZrLdO6gX5JRuXqKqUfxcUDCIrZR2ijEfzJnr/8YGNr03yJ/fz/qYM/fsf
	 TFroqSzOzBR8XwEln4C5AnkmjjhWf/6/Lv4HXCQg7Rv9OaxytVRK3zfLPRTtYfk9Tw07a
	 kSPaX+jWmc5LMGhAgoQIunBOkkx520UXMcSL6S/RHHUWsf/jFvLoAzsrefwZFxP9V5CEw
	 Mf3/vVr7p7BoylMdkKTL5eGqpEIL+gelGJVmbQoT7+vIlkrCHjbumPfOkCZ/aQdmphw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="E8VS1v+/";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A68606A31E;
	Tue, 24 Nov 2026 07:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=E8VS1v+/
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D08BDBE1;
	Tue, 24 Nov 2026 08:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795506768;
	bh=Xmmce2S7wOrFLBjPvv3SmgDKB/+/+jzZ/mfV8xQHUaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8VS1v+/3igV43aS9B1uyYDxu0iBj3Ci9Glk6bNqZqFF6w/LkL04rAj547NSwYp+t
	 1pMe38lxIy4NDXQkl3QAFpEnS3ce1ULZLOd2URFkRIK0u/KEPOlYJzwcClUmBTTjYr
	 ESGOod8CTqm5UyHvHhXpViv7KH7aRIr0vUCgFaAc=
Date: Tue, 24 Nov 2026 08:55:18 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-vin: Return unused buffers correctly
Message-ID: <awVCdzC_jueqaZPQ@zed>
References: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
 <awMzb15zjEf3n3XU@zed>
 <20261123075858.GE3898744@ragnatech.se>
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
In-Reply-To: <20261123075858.GE3898744@ragnatech.se>

Hi Niklas,

On Mon, Nov 23, 2026 at 08:58:58AM +0100, Niklas Söderlund wrote:
> Hi Jacopo,
>
> On 2026-11-22 19:25:56 +0100, Jacopo Mondi wrote:
> > Hi Niklas
> >
> > On Sat, Nov 21, 2026 at 12:54:59PM +0100, Niklas Söderlund wrote:
> > > Unused VB2 buffers should be returned with state DONE not ERROR when
> > > stopping.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > I'll take it as you don't consider a Fixes required.
>
> Thanks.
>
> > This however
> > count as a bug to me as it doesn't respect the expected API behaviour.
> > Am I too concerned ?
>
> I think so, but I'm not against adding a fixes tag if you feel strongly
> about it. If we do want it I think it needs to be to the commit which
> first added the driver.

Ok, after all existing applications already work with the current
implementation, backporting the fix might cause more harm than good

>
> Fixes: f00add9655e1 ("[media] rcar-vin: add Renesas R-Car VIN driver")
>
> Please let me know if you want me to spin a v3 with this tag added.

No need to, I'll pile this one on the PR for rppx1

Thanks

>
> >
> > > ---
> > > Changes in v2:
> > > - Link to v1: https://patch.msgid.link/20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se
> > > ---
> > > * Changes since v1
> > > - Fix unused buffers returned in rvin_stop_streaming() too.
> > > ---
> > >  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > index 5e515d16c164..d3d1af47f8b1 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > @@ -1434,7 +1434,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> > >  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> > >  		if (vin->buf_hw[i].buffer)
> > >  			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> > > -					VB2_BUF_STATE_ERROR);
> > > +					VB2_BUF_STATE_DONE);
> > >  	}
> > >
> > >  }
> > > @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> > >  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> > >  			  vin->scratch_phys);
> > >
> > > -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> > > +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
> > >  }
> > >
> > >  static const struct vb2_ops rvin_qops = {
> > >
> > > ---
> > > base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> > > change-id: 20260828-vin-fix-vb2-28e1bb24a618
> > >
> > > Best regards,
> > > --
> > > Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
>
> --
> Kind Regards,
> Niklas Söderlund
