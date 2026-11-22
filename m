Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371962;
	b=TrKcsdG66lVrtt8M8klS1XKDRUyGw0dK4unQ7j1nLlNgMbFWxFfxr5ulklRogIjsW5LI
	 6I5unzmIn4iPRtVO66rBFsV/lIgMeDPWaKAgA4go8UdOIxvx8GbRagiD4zMVAmCAoBDln
	 bm2v90rbpxSEnTL5Hv58vwS4HCTPEA7XITx0hTJ+JG4CrILsBeXwU/l3WBqLkwJCdZCpd
	 teFuB7aEU7I31KbfLW410ir9j+BPtIdvh8EclWOe485+7ETsDoI/PmrYFtVOX90UuGZru
	 wbWvIXE0pSwh3SFD5bbNYmYuVqT5+0JhF3gmAWcQ7uWAXbudW7/emQy/kkwx3Pk6lYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371962;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vKXplfw29klXWzsM/alOEy1eosFo21V/yDh9Ut4ySd4=;
	b=ppewQ413caBKRz4xYx/xLydgK0ZGL4fkdPCURPLth6pocdJjluXrkKTS9oWLjEkvsXPD
	 I2Fq9qh/dLKPbn//g8/+Lm20D4tkMQIgmW9qMpHGXINZGbxNESCaWa+s3k6RBvHjPBGFL
	 IcM1fjp9bb05u6jzcWOXFe3l5T1NCQ2ygQmTQOgqIwSFk3ghFthRP62r4LO59SJRs8RrH
	 MgXmR3mipjMfHf9L274iA1frbXSCEBnszzRzFPczhvbgq5b/ps/ZnnxQJVAsqdfsIDSGG
	 OkZ0TuQkexaOCIEogT74XHELNDozTU+l7NBgjU98ldljKbQja9odK/VhCcK3ARlP5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=vNDgyv2z;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF4606A332;
	Sun, 22 Nov 2026 18:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BF4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=vNDgyv2z
Received: from ideasonboard.com (mob-5-92-38-150.net.vodafone.it [5.92.38.150])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C37D4177;
	Sun, 22 Nov 2026 19:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795371808;
	bh=mofZKxThtOO31xRvXRSYb1bxNpLhtkX7vhP8gelB6rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNDgyv2zhF4AllMc3DtpOi0gVUd5M1ZVzeCFLpjjaMDEsbzoM6dpgVtYmSIto6y62
	 b6gR4dvthRucpHQyLpjftoAhDiHwrOXBHs7y7ngW1zuMTJlLCI1AfH7INvdBuDLo5Y
	 OZR9lXKyYQkqInw16KRPSs8knaO8Dpw7LCKY5H7o=
Date: Sun, 22 Nov 2026 19:25:56 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-vin: Return unused buffers correctly
Message-ID: <awMzb15zjEf3n3XU@zed>
References: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
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
In-Reply-To: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>

Hi Niklas

On Sat, Nov 21, 2026 at 12:54:59PM +0100, Niklas Söderlund wrote:
> Unused VB2 buffers should be returned with state DONE not ERROR when
> stopping.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

I'll take it as you don't consider a Fixes required. This however
count as a bug to me as it doesn't respect the expected API behaviour.
Am I too concerned ?

> ---
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se
> ---
> * Changes since v1
> - Fix unused buffers returned in rvin_stop_streaming() too.
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 5e515d16c164..d3d1af47f8b1 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1434,7 +1434,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
>  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
>  		if (vin->buf_hw[i].buffer)
>  			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> -					VB2_BUF_STATE_ERROR);
> +					VB2_BUF_STATE_DONE);
>  	}
>
>  }
> @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
>  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
>  			  vin->scratch_phys);
>
> -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
>  }
>
>  static const struct vb2_ops rvin_qops = {
>
> ---
> base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> change-id: 20260828-vin-fix-vb2-28e1bb24a618
>
> Best regards,
> --
> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
