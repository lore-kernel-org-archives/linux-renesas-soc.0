Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790885;
	b=JNaKtl036KbdmbfEZ4d+soyMW25R2vrB4Hi+3FbEZi3HIXfPC7Smxc+lGHLRsw/B7+hE
	 AxQ2Xk42jQcqP60x5iL40755ZqciaVAzmPRBUcgF3ngjLboLY3LcfB7abZbcxDyYQVWEH
	 h5YqF15bvCzcBQPfWJn/7l2KcI/lZ8FTt3NrY08EHbAoTaZx7+a53KDrxGhWa6AuuGoC9
	 ZJTOwqXjWiWyEJ1pLfPIOROQSBb5S7S6zxRKVMGClWf0EzO7BbQc4e6EKxdLMnCOx4G7C
	 /hTnBmFjBtosOGnezkFKmOcb66IkiSbbGYQNP0lnbTVmIZgHHJAcEOL/m0TTn0Ciu7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790885;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2HEQDA4gVt20dFQGz8DujoonrchvVQJDi8wajEEgsZo=;
	b=prNaNHGkrj4cdh4/v05wqdpxWpQTmvSarLm3nz9kp3Y6lKBAfi75/Tv6w3M2sA7gIHTW
	 PvJR+3VeM8BC+LBRuc35tnHtldejw+Pm058KkLL3R4HRPh6czapyQgXebtHlhF1Avqhxr
	 2e8lTEgaCYkE8jyAbl97iRTq7Fj0uSlOQSgB3MzvVQpBzRP/PkYCrfqfAmcRjbLju0Rxd
	 BcPj8alLQvND0zsmC4PckcIcT6fVqq84uj9URKGCClpVr5j7/8cDPwG5zzU+2i9E0wiyD
	 ha7cv+9+sYtO/VjAqTUmiuwvs5/Y+0wnj1RIDhwJfVSykAfJCsVnq8RGKb5S1sxiSfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EnTsigEW;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D01606A31E;
	Fri, 27 Nov 2026 14:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EnTsigEW
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74CC8C51;
	Fri, 27 Nov 2026 15:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795790727;
	bh=yWOhzqyWbQUYFV44H2oX7BtFxg7r1XPxlIFKOBjLIYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnTsigEWY2Z2zGQwEqem1lxzRh8RyfH7Zrawl5oIjoZUqtKWGkxcQ454Y9BnrwUIK
	 r5DOwvCjBSuKoC31ZLFnwkdU0iYY5Xob56jLieyOYjHLpU4VfNe+xpny3w/sgTw7AV
	 JZslZXduq2a6diLQ31/axVCGPJQ/WOLdQcOFvvtA=
Date: Fri, 27 Nov 2026 15:47:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-vin: Return unused buffers correctly
Message-ID: <awmU8zyMfRN9teIr@zed>
References: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
 <e44f2383-0a7b-411c-ba42-5f19156d2a08@kernel.org>
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
In-Reply-To: <e44f2383-0a7b-411c-ba42-5f19156d2a08@kernel.org>

Hi Hans
   thanks for checking

On Fri, Nov 27, 2026 at 03:17:44PM +0100, Hans Verkuil wrote:
> On 21/11/2026 12:54, Niklas Söderlund wrote:
> > Unused VB2 buffers should be returned with state DONE not ERROR when
> > stopping.
>
> Why? With 'unused' I assume you mean buffers that have no data in them, i.e. they
> have never been used to capture video.
>
> So ERROR is correct for that. The state DONE is reserved for buffers that return
> a valid payload.
>
> It's standard behavior to return any unused queued buffers as ERROR when we stop
> streaming. That prevents userspace from trying to use their contents.

I probably mis-interpreting the:

 "I/O returns to the same state as after calling ioctl VIDIOC_REQBUFS
  and can be restarted accordingly."

part from
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-streamon.html

(also because I now understand a buffer with FLAGS_ERROR is safe to
requeue according to
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf

 "It is recommended that drivers indicate recoverable errors by setting
 the V4L2_BUF_FLAG_ERROR and returning 0 instead. In that case the
 application should be able to safely reuse the buffer and continue
 streaming."

>
> Jacopo, I'm dropping this one from your PR.

Fine, thanks for checking the PR!

>
> Regards,
>
> 	Hans
>
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Changes in v2:
> > - Link to v1: https://patch.msgid.link/20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se
> > ---
> > * Changes since v1
> > - Fix unused buffers returned in rvin_stop_streaming() too.
> > ---
> >  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index 5e515d16c164..d3d1af47f8b1 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -1434,7 +1434,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> >  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> >  		if (vin->buf_hw[i].buffer)
> >  			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> > -					VB2_BUF_STATE_ERROR);
> > +					VB2_BUF_STATE_DONE);
> >  	}
> >
> >  }
> > @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> >  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> >  			  vin->scratch_phys);
> >
> > -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> > +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
> >  }
> >
> >  static const struct vb2_ops rvin_qops = {
> >
> > ---
> > base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> > change-id: 20260828-vin-fix-vb2-28e1bb24a618
> >
> > Best regards,
> > --
> > Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> >
>
