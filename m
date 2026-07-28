Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C494E2DAFAF;
	Tue, 28 Jul 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257409; cv=pass; b=LXhC4KGdf8xcEpUgWdGvGhG8qOLW3k9btTZYzwMnGaW9k/SV3/3YBrMQj2qQrfiMyhX/bmXDN7zhu0rgdWkwUKPApf+oZCD3/+M23tua3ocml7XYp1PGmtpbY43/gdo2hnVckpEsJyRrcCa3gF9Wp+Ko8KKHvgR4EaJceknVP2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257409; c=relaxed/simple;
	bh=9zG8OvAimWiFIqtu0X7RePmyYyRRUy0I/smnQsTf6uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0TK8p//2rLMbJmHbtD4qIfel+cUW6sSQ5UjpMnv843qVDY1/J6hGf0SOoEey8axu9XVVkWa3Y87vvFbDTmD9kY2qt0Rc1G47/veU3Ut36pFWXh2d3M5nvwuociIrEMSQapGj2ITCO+U8LQNccdx3zs//dDhfWPNFJxbHjfhuzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=dzg6Ftq3; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="dzg6Ftq3"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4h8hK35N0DzyTf;
	Tue, 28 Jul 2026 19:49:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1785257400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rKWhEhh16ybEXgtAp/xi+Dr3GT34zvZDmrCLwVg+WI=;
	b=dzg6Ftq3sHPklLDr3mjUcwR6FGqH4WnNYCM7BRZ5x2d0CVLO5wUBbMksfuxIu0Ew1AC9Zz
	jFKp2DY7Of63w57ygdEk713csxfbMaagGVHbTsDTrU87gPGnLLG6RnE30ub6VJZjVJkq+T
	PtsGq9CMu/4tEdWB2F2kagH4FB8ycho=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1785257400;
	b=OpBZ5LFK8uDKfULJYokz0ij7Treyt9O9z0IY5+d+arOafIb5SJJqo43y7vFIOkKrho0DSR
	wJ5imoliiiwsQQjpdYevE3gRyoBnMrzmkpWuJ9T+sFgGQA5dzzCt75n+xx/oyV8DcpfRTA
	vZM5U9m4IWddjm5S03v8aTSqUVRgPBc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1785257400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rKWhEhh16ybEXgtAp/xi+Dr3GT34zvZDmrCLwVg+WI=;
	b=csiBzfAh5JhdnPQZpNfwvEzoatnRbDoEp61P5pVox7Yj/Wm/EM20EOCjZsm96/6X5x4DUx
	gS7vGCaZTWeh8pQypLdq4jao9Ij2sdIftUdExQGcmm5Eo/Z6V0UVDPv3mg9Pjn691ye24v
	L2rT5cUpkmAmoy/enU4lyB6LKsWcMhA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 05BAF634C5F;
	Tue, 28 Jul 2026 19:49:59 +0300 (EEST)
Date: Tue, 28 Jul 2026 19:49:58 +0300
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
Message-ID: <amjdtsd7N65pyN76@valkosipuli.retiisi.eu>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
 <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>
 <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>

On Tue, Jul 28, 2026 at 06:38:14PM +0300, Sakari Ailus wrote:
> Hejssan,
> 
> On Thu, Jun 11, 2026 at 10:41:47PM +0200, Niklas Söderlund wrote:
> > +/**
> > + * struct rppx1_ga_params - Gamma Out Correction configuration
> > + *
> > + * The Gamma Out Correction module is available on the Human Vision Output
> > + * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
> > + * which pipe to operate by setting the @header.type field to
> > + * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
> > + *
> > + * The module allows to apply a @gamma_y gamma correction curve to RGB data
> > + * represented as a table of 16 entries. The 16 input sampling points can be
> > + * equidistant or segmented using a logarithmic scale according to the value of
> > + * @mode.
> > + *
> > + * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
> > + * MV output pipe. Userspace is expected to provide the curve values with a
> > + * bit-depth matching the one of pipe in use.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
> > + * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
> > + * @gamma_y: gamma out curve y-axis values
> > + */
> > +struct rppx1_ga_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u8 mode;
> 
> Please use reserved fields to avoid holes in structs!

The same appears to apply to the rest of the UAPI patches, too.

-- 
Sakari Ailus
