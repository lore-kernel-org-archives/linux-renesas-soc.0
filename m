Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29F8383C7D;
	Tue, 28 Jul 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253110; cv=pass; b=BiXKzxFlq/1B8O38mHed7RzpmOYNJaQgQ8JlDAD52G/HBcAWlVCFxmz4AbCdQi5sZNvu3ncgu92dE39N8h5EsuJbSdUMJ1DU+ATlix1ko2ohiWilIw61+vNoQ8WcqxKtRlQbYUYE3hei3boylqKhOUN1DBbDXTNYqRkgALALu3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253110; c=relaxed/simple;
	bh=GjcyfumjkW8FPOvARnwebauGRGp0bX6rEnO8haImc+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY0xy2RRwzHTKIGDCVLyvWK0SdrBERDsm3RrVOdkqgFQ+XlpUbNF6bxyklDDSeJwPrdpVoO1mJB+QvNZEXNOlNUwTR8rmw9454PJs/OCSZkAZZyVI/H6vytfV8b69omGFYdxHdmFoobvlfiRXbAfaTvl+uqYYdJIhO8BmfuZ+B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=GEfLNm02; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="GEfLNm02"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4h8fkH1RJ4zyTf;
	Tue, 28 Jul 2026 18:38:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1785253095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+1yn9JB4oX2WiPxhbRNH6l0rD4Bfk/HS0jOHju2Kbw=;
	b=GEfLNm02KyoJPLpAIbQV2NIDL61a8l77ZomoVVtynKI9mOk/t4FUt2CvB7zC4GXScFjmLk
	JvhuS1q5RJz2hHHPLp2i37Ti5UvQy9HIJPXyj0HI5cNkhqAQa0Rd32n/sZPXq3eFd2pOYx
	BgCeO20D0fAkVzcZQw5yNbumPCbsaME=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1785253096;
	b=VS30TpyuzytUPsFJ/ZMpNZNYvSbR8ck5ih9YAjsXhg1wVuic8UfHJc+ylF1fqgBsqHSrQU
	pSd6pGU7fKmtbRptV+kmmNUH9cpLuGPl2dwWNUMevYApJkiJAlt72P0mBU8f07vWYet9tL
	ANyIMGci930ojXeD+jWnJ/MDUhYobsI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1785253095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+1yn9JB4oX2WiPxhbRNH6l0rD4Bfk/HS0jOHju2Kbw=;
	b=VXflQlsEpt6G1LJFdY1gu1gcP1TK/9Y02krVZMfb/e0c7+eBD+jtxGer5CmCLVP/kqIiWP
	BgG8ERAc9fFTFSKxagcFYQ3Sdci3zclYg2URpzGy4V5LxPN6oOVfASuiitGFVkB9QpAV1k
	n+lQZA0pRSEIojjlPTizB4/vFyl8lGA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 68A7D634C5F;
	Tue, 28 Jul 2026 18:38:14 +0300 (EEST)
Date: Tue, 28 Jul 2026 18:38:14 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v10 12/13] media: rppx1: ga: Add support for gamma out
 correction
Message-ID: <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
 <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>

Hejssan,

On Thu, Jun 11, 2026 at 10:41:47PM +0200, Niklas Söderlund wrote:
> +/**
> + * struct rppx1_ga_params - Gamma Out Correction configuration
> + *
> + * The Gamma Out Correction module is available on the Human Vision Output
> + * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
> + * which pipe to operate by setting the @header.type field to
> + * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
> + *
> + * The module allows to apply a @gamma_y gamma correction curve to RGB data
> + * represented as a table of 16 entries. The 16 input sampling points can be
> + * equidistant or segmented using a logarithmic scale according to the value of
> + * @mode.
> + *
> + * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
> + * MV output pipe. Userspace is expected to provide the curve values with a
> + * bit-depth matching the one of pipe in use.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
> + *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
> + * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
> + * @gamma_y: gamma out curve y-axis values
> + */
> +struct rppx1_ga_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u8 mode;

Please use reserved fields to avoid holes in structs!

> +	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -516,7 +565,9 @@ struct rppx1_lsc_params {
>  	sizeof(struct rppx1_bls_params)				+	\
>  	sizeof(struct rppx1_ccor_params)			+	\
>  	sizeof(struct rppx1_lsc_params)				+	\
> -	sizeof(struct rppx1_lsc_params))
> +	sizeof(struct rppx1_lsc_params)				+	\
> +	sizeof(struct rppx1_ga_params)				+	\
> +	sizeof(struct rppx1_ga_params))
>  
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures

-- 
Regards,

Sakari Ailus
