Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789068;
	b=wccwmgeP7OOyKOsoxB+eRUdsju+whDb0viaeqy46A7O2yYoA6qcGVLmZGwT0nJff6f8O
	 Get05pwUq2ETD7By7NnUNyKz15bmfe5G3uawW4QXv+SmwuGfhZymWfogiX0UNlAiFdlAl
	 xpygKufoDmC9kCVgqONzoBpUXg8q4/wMwUdmdLbiBkxgLHKNrWHACZzsPsWCoPQFTepqO
	 kr2khOglV1ZKF3ZKvwN2dM9712d7CZLU01zHj3+RMA8WZUAQpF6hVlDgFHe+MycAdFL+w
	 MaxJa7WXPe+tpSQAIgTan/pDnBhgPP1MFwo/sjA5GfuQqqb3TDl1uTkFMa2JvVEdgyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789068;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4Y7+W8d6madIKm3ol3xJ147NDbfYsWd56B38XvHhaAU=;
	b=3+ffwAQhZ45O+prAcYxbhBvuxNg19BDMuiqfNZyMU/mqy1fpCrxJZSCohKTP/6r5ncSn
	 hPq/8KUnlofCbwNfxU1s8P7HuN7OpBQDw6C9JS09EAtmzunZtkwaFsVqlDELckwxHL324
	 cvqxgLq0/p1XlPtkr8cvN2L5fHxwB8j/UcSfHju7pnnjQHTxUT0f6GJSoxqRJOOJ0uLcn
	 UQv8cFbjczDCzMVtulEWZ2LnFRM0DM/D+IFFo34a/RWvj2yDEtHAqnLwTXCc9ZOm7HK/Z
	 Yd9fArlqRx8fskocfRm40hmnMvdbCJKrUoHsX42rvZ+oM1J7VqS4SWLqe3JQr6WMUnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPIq3vNS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA6606A31C;
	Fri, 27 Nov 2026 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPIq3vNS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A7B1F00897;
	Fri, 27 Nov 2026 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789068;
	bh=4Y7+W8d6madIKm3ol3xJ147NDbfYsWd56B38XvHhaAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nPIq3vNS1vz2eM1T1n/GSS0MXfB6DG8xMtnKKAp5YyAVI83e7W7VElw9K/69i+nOB
	 uRiAH9stQFhLJN+WXteK8dLd3/G+8AiCyl1T/sAQKMCpYtjWXQyBF+rHWpNTcQ3dPZ
	 MjN8eTkqJgynynnr/EvimIuvd6EHpUXkP4Ngm+HCwJOqO1SJnEbZ+41nWmD3Q3qMBu
	 QQBtGmKN6jOUoIzQljNsqKUN8i4CaQo6JJfOScvutUTMK2hUgPsPLdG66rLQ9UP5vI
	 y0QK1DdvibypbMFhYyRM9G+sMxSW9HvePYObigjdnJW8GcdX+bovjrGqqhDRzCSWrw
	 MRRWI+k+I8zsw==
Message-ID: <e44f2383-0a7b-411c-ba42-5f19156d2a08@kernel.org>
Date: Fri, 27 Nov 2026 15:17:44 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rcar-vin: Return unused buffers correctly
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2026 12:54, Niklas Söderlund wrote:
> Unused VB2 buffers should be returned with state DONE not ERROR when
> stopping.

Why? With 'unused' I assume you mean buffers that have no data in them, i.e. they
have never been used to capture video.

So ERROR is correct for that. The state DONE is reserved for buffers that return
a valid payload.

It's standard behavior to return any unused queued buffers as ERROR when we stop
streaming. That prevents userspace from trying to use their contents.

Jacopo, I'm dropping this one from your PR.

Regards,

	Hans

> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
> 

