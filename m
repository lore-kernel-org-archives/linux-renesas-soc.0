Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628D47F2FA;
	Wed,  3 Jun 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490901; cv=none; b=qiC3U+mwpY6LWkAcG7IvgaN1wD58dKxrTXmXL/fVLlMl0B/I+CZQaM9LqEt++BqCTTsqtCWcHj0/wH9OnF0WUjYOiOk8rjeK73tOvOFS5W1CaP+8Ngj4I+fESVDkHRggMnZYOs6kY5iZ4x5gXnjjHr0IBg70xSm6qwOswW//cOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490901; c=relaxed/simple;
	bh=2D8xsDwXfteC536ig9mB/AcCB/Fmi04aowDTBlUWiwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOS3O69IAJ6ZFna0vIo5UfPOOiV9W50WWoCBLKdNtVa2O/XgQPq05nQXNPQU5SAvC84eSRUI7Ah/mHwwwVIrCkt3vHx82azPNXIRpUJNt6/Jk6GIyvIiDvMo6nK2x8bgbQmkJ8/R9DU+Pgu2GUaAsDTYT0nLhZPnJtvHZ3xv9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=m+dQGWl0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P2tRVVQU; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="m+dQGWl0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P2tRVVQU"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 40761EC0040;
	Wed,  3 Jun 2026 08:48:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 03 Jun 2026 08:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780490895;
	 x=1780577295; bh=yw8MkrWFm4eSg2NjVccBRlxKR6CvAd4ayidRifo4nSo=; b=
	m+dQGWl0bRlhUZI7T2+kQuXE/MXX+HLfVZ4v/d54cMkKxCZol2mjy0DGLMMYnq8t
	tdQ9zYlPvhcbK3QaRo0HiBcA/EYwhXCX3AS90tAsmD55bwdSB5xa8IFNApGzwbJE
	FZWeaTPEdKblIwER17e3XCTgFdJvQZ24D+/2HqUakgv4AFIllE242C1q2KBP0/P7
	Fr8cDjENp2evvXqFTuRphkpyYDJFOFiN0xCYa7hEme67Ldpd5XaewJIdV9N2s4eq
	nwjQtw2a/3VjC0ADaUroyhW3/9XS69MZQ/IH/Pl4I3uOCJN7pl4DrpAMcZs4DQk1
	cZz8oMaSKafsIMDJAuTrTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780490895; x=
	1780577295; bh=yw8MkrWFm4eSg2NjVccBRlxKR6CvAd4ayidRifo4nSo=; b=P
	2tRVVQUVHAnmVDFOFm9FvsGMWlcZTsPm+RQzM5M1BXh36+s2/nQu4ZUf1Fu9qanz
	ow1JyL3a4RXYq6vPslOE9QlHuYc+0nNiWfpe3+MMx1CIRKwLBbD+K1p3XxErqiVo
	WC9dyfS37de40iabNQebmzLoFhXnRhFcPh5OXXr8SXhElD0UHMS53qXk78YibEv0
	w6KmQg6DQ5IujRBBuJFcj7WaM8d/m679nSuP6QNyHaaWON4bdUyvJTamcS5VFvHt
	XlcJks+ZbUJyy4I5JYfIA6E5qkQBHVpbOjtel70KPDBLOBelaim+y9DUKz1P16VT
	z9ys2ZaLxEOZ916hcMH7Q==
X-ME-Sender: <xms:jyIgaheOODcseZrBVCfI6sXxnlpdYkg2FyhQhdHIxZjxAIMl7LIqVQ>
    <xme:jyIgarMnqSJhRxb9gMXwevAefcXyATtM9f3gE5lh-2JunY3JHqAfQrv5u_AsW9Qef
    DmizZfMjeq1R6EV7vno0KZNqmVYPCAN0-usZ5NOJBZTrQuQUBERL1N5>
X-ME-Received: <xmr:jyIgassJeBFS5q6hhvZiQOcjrTyDWQBEdttQh9nyT6bEeT7YrnFtbf1g0XIWVBWuwU598Wa6CAA-m_5X8PjfzvZdi5oOxEvNiHkB>
X-ME-Proxy-Cause: dmFkZTEzcVZ86N4uR6EOlDo9UWs50WEEP5dY4TEfJeSueR0m5DVXif+BmFenNP5UxILp2l
    f9bX5JqD29q7wUMm7BU1hOsiHmck3FP4qwp1UQfMfk+/N7IA44uh70Mmk14hU1mapG0qM1
    dm2od3UOyUxb30qjYatz8poNXphzDpYiTLut2GwOkX8+0uKGl0JTYbmrrEgK+3m9r1hi5L
    dpBeO1sHF69iOtxluzAqWPNWmGSgImBdpV6dIdGQclHzFsMjk3y1n/U098H/JCiS2SI9OP
    qoqa5fHUhQlxuoY5TV7YZddx5Nv2tuftuS/2jWkgCO+XvsvcfJt7dvZVBIj8yep06+WZIB
    1dIOlvdO0Kyve6usp8wI9P82ZuMtH6U154TOcGnEl2M/pJnhB+MzxinGvpkj14RQRLildI
    8rvepnFuFPu113S+C1yK3haCwRm8Cthk2/ux7rmzqTTkKNCW4LNoVIlr3QS1qkTev+otFU
    0k8Nbnp7NNkOiSFrpdSI81W3vr8m21t2cCyKnxaYNa7VSzGMsrMwkXZOMOOVAQdsa2biAs
    QHqJBANR7IdHceTVHhVFYO1IQKMdLg9EITjRP2q/kbdje2cOEPn3WryltsJS7AxKd0YXD5
    12YlJhozm/l4wZyBXRtbVTqKyKxyu1CE6IYhlK9w6IbYPdbm8I4oF16z4+Og
X-ME-Proxy: <xmx:jyIgasBtwIxSlgNEAQ6zi6LVd3QguZvO-Dzr8s_u_zIQ9-eR4YDWrQ>
    <xmx:jyIgarYPpwR994Vrq_mgsb8nn10EqVVMkxNB8CblFJHGYfNCTfyEOw>
    <xmx:jyIgavXpk3AePz6nETI9kS4yWRi8h9AVsLY5aSK-U12QOJ4STgZ_2w>
    <xmx:jyIgaiPriHiZECc_j-r4RSrPB-xjpwjE--XTHXTu1gc9wMDXB4Rf9g>
    <xmx:jyIgarwChpT2s61iOeSd5NMml6Y4Gazh-64J550YnFqWVqZDyhWl7qb6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 08:48:14 -0400 (EDT)
Date: Wed, 3 Jun 2026 14:48:13 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/13] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Message-ID: <20260603124813.GC91369@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-2-niklas.soderlund+renesas@ragnatech.se>
 <aiAGShBotGpjm64f@zed>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAGShBotGpjm64f@zed>

Hi Jacopo,

Thanks for your feedback.

On 2026-06-03 12:49:11 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Sat, May 16, 2026 at 11:13:08PM +0200, Niklas Söderlund wrote:
> > From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> >
> > Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
> > parameters and statistics buffers. These formats are used by the driver
> > to exchange ISP configuration and 3A statistics with userspace through
> > the extensible parameters framework.
> >
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Depending on the discussion on
> [PATCH 0/6] media: v4l2-isp: Add support for extensible statistics
> we might be able to drop these two.

Indeed.

> 
> In case we don't is it intentional to split documenting them to a
> later patch ?

Yes.

> 
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >  include/uapi/linux/videodev2.h       | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index a2b650f4ec3c..cd3f4a86e27f 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
> >  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
> >  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> > +	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
> > +	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
> >  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> >  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
> >  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index eda4492e40dc..1f78b5378b3b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -889,6 +889,10 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
> >  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
> >
> > +/* Vendor specific - used for Dreamchip RPP-X1 ISP */
> > +#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
> > +#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
> > +
> >  #ifdef __KERNEL__
> >  /*
> >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> > --
> > 2.54.0
> >

-- 
Kind Regards,
Niklas Söderlund
