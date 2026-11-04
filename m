Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802189;
	b=j1sYZWzT5xRP2h8QfPmxT2ZZhohkJsrvYlDuvUZrHT06cCQSwmtqNyDEWqtfDfGiUbHI
	 kt5VUCXHsoUlHtZNhm99U9bbAdEAz20MO4N12lZmHAD6JH4fR8iTObVh9ucV1bQzDQCNF
	 TSQBCfK2DuGgtDON63+hHltV3DvVFMOQhf5YSHIkA6DT505ZbEbqMv7mlkT+CWWzH6+zl
	 jv2r62eSXpMOMvx+PfUOGzt/lvAKCfV4ntkxkXDrDf+EGbNOm6r5M6oz+I92Hh+MNC3zZ
	 nLlCA2ZHeY9qNgR4hEg3kzIjt1RIP/V3Q5QBqYIsYRIs48KAginsVj/V7MCNVi5oTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802189;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=wZ3DRmkWaygrCw95oypD39+/CKzDxSTN6BAmdjxj1PI=;
	b=ZQIu8wkzqFBlVi/AHa1o/H3zwtLyPVTuRQ8YacTYQUlduwpPlCDrUhHSFxDvqoYlFTDB
	 jenye/3uGw4xtlmsC22um3fkdUvMQaX4WTUiua0gDeplh5B4fqiz3hb6BUOPD/ynG5hzZ
	 UoRBgR3+tVEnS/JsNc7vuv0xsUU1FMOa7GQm6NEwrK2H9t6RF+omAs7o/Nppvx4kw4L+r
	 PRO1f0XBoiYD/jQeRjBz0+XBt9xvYAz1TiyJcorx0QdS1vE9gHzS35U/rx5a5mowlvzPI
	 40KLwHGNIZbEvwm6f3TBuIqBAdPdyAFR1N3ajiogZbpfhnQT+lvEjgztLnFMjuELPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=MWLtuwuu;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=D+5OHO+Z;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA7606A328
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAA7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=MWLtuwuu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=D+5OHO+Z
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 76F5E7A0162
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 09:23:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 04 Nov 2026 09:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793802185;
	 x=1793888585; bh=wZ3DRmkWaygrCw95oypD39+/CKzDxSTN6BAmdjxj1PI=; b=
	MWLtuwuu0wnyjYpIp54smeZq7WcRSqXglLa8THDdAN9Ds1ri6Igg+IPfAg8lrtwz
	syBtZSJk5c2jI71W+YagrodTBD6u2PzCOYVw3U3bGZT7Jv1UBp0AbI5e5HVSIvO0
	FJaWMCYf2DPVIFqNofJhO/AjsLy9rtDwKKe/GW1RC4wxdzYG6geoobbf/Oe+aaVZ
	H23oTkWWZmRbqp/HWhC0QpezPB3X9EBoIwTekTn4kvvHResFgZe0b9jSCWj7BOUh
	InXDW6GEn3gPRfDq/ZpjsZl927g1CW68XpSCkxAHcnKr4CdrdjaLgzrb06Qu7e5F
	s0K8MFO13/15DzQawNbpFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793802185; x=
	1793888585; bh=wZ3DRmkWaygrCw95oypD39+/CKzDxSTN6BAmdjxj1PI=; b=D
	+5OHO+Zo7roGHU8xsWDxiv+wOBv7dQQitozCCJW/17gC4G5SE1+TBqiXTk9QgJO0
	tapcjj2a3SB9eI6nDQukrl1kqh6s7K9pArxrHYatfC/NSoHW2yH6c4uMqwQKAJoQ
	/PD9hGU5YNBYbtwVhgYyCo2AiAOz0gsugDeEgrNeHqDzxGP60Jt3TTVTkYUQTLyT
	PrRL7uIX8B3ig6dL7fTsTshvuDJO7VMw3MGcgiD236T0m48t+kIw8cTFOVXsFkda
	1nXYdQ8Q7B2Ot1Kb6dN0dvDBKhOHYa0yQ3rrIXDvJXLOEg6tVQ7zse3eMzhYGyUa
	thjARxKERbx2ljJ+Y3GKQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793802185; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:ehf0YWyBuslssRiYS52OjA9X71bY610u+iVtwaLRni/8oUz
	2Aqn9aQmJ04/MJuVe9owkMhdVf76SWDYCuZmMOCok52887QCh0Ce7UzbAWgM8jVZ
	tKMC1CxPKLnIbxh7nWBPGT6uX2gxexBnvARDcfrIaqfGDj+EtjlZEoWPhDWlByZe
	JXw5PjlRiH/JiWi6y8awnUIIhsjKOovbAUtFoPPZtq+of1RwHA+6g+exur9QKuu5
	jfo2CvZKSPrLVn5JlK1xpnyg/bglAb8oQcE2dQdR4f/ALDPNwUo2lXjKRNYiMe9Y
	vUBiAXheAteBp13Q76yOq2f0/eLFVxo8CZYyTAg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8WiOfuZyMdap+bE48SVdsCssOjsRm1RgtdPkx6M+cZc=:3dKkUVLANeDhIDjo92f1TgMhswlkcL7fJFLihtnLb64=;
X-ME-Sender: <xms:yD_raojYF3IyExQ-LjzAu8nfHElZKaRYXc_38-x5nLQbbD9ILo-vjg>
    <xme:yD_rahfVu8FDSYOdoMrU4E-ZWf_i4AQNWICPNr_snBlI4NYPDiWGCUHjtMxxRIjWm
    omvq0Wp9uk-D2McUuuMo7vfmVWcfghMSo3VTTdCj0XeIaH1qytLJR4>
X-ME-Received: <xmr:yD_rav3UgwI2n1R5uQgrMn8BWX-h1WtTNICkspWZCQb63v4K1pJRoPdedDec5nEfRlEPTklLbHTD8nwRcAZKLL_fbGeJtlQ>
X-ME-Proxy-Cause: dmFkZTEo1+WJsU4C+3nNiXfFO8SI/WuAp2HlmE9Ie61JliHIvX6Ui2NijT+UPECYV7P9wZ
    xk47MtoDmoxkGIougV8QR/uK4i1WE9zO3Nw4ZMD5zce8v+BFodocnhpXB5g0wehRzQid49
    EJr+qfgq38hgeWjHslRVK5RqlghPLSxV6ASMX864XEgLeOwO3NErmY+HjgtqRN1slSDhkS
    cI2Tfet0cQgfDpxvE6LJkjJ/XGLBYUo8DK7GOOKZdr+sK61a/S9pvdi0niS/ELLM7rsX4c
    V/vYP9GQNT4I9qQi73IIJb81AZELdlZw3x2TpB/luLNbNug+TfMu/Kxy2Iz+byXDmU9rUK
    6j6XLOATrryMHg0iU3Nbby5DGUvfQZRJw7NG4i35oAlblzCyfAGv0JSdk8XPKcFQH2zoGm
    jsjNywbiU3dxeXIJD21bJPCozkEANJOXEWi1Ek0coPSpDmz1f7uWe/rzVDmyk+gLxr3oQs
    HjVQikGEU5ny3+8iFMHdxKLssOGpYwRltQ3M54StYYzO2RQu7nE+oCqJsxvfaH34oeUqTY
    NkIfzTPv5Bdjt6jy+W9VbhVtlSOz1sOJGi//s5vTSkKtUkFAyZdGDz6jKdAnH8h+k0xWl4
    eFuK/68kN0PsjEwTavY10UvFgn+FvV5yaNVLQm7Lh3kobJXIkckqKIOaE0Qw
X-ME-Proxy: <xmx:yD_ralrNSpmY6UHe6-d5yYhr4D0nJySoZBKlrqriQAlqMOzl3BXvIw>
    <xmx:yD_ravhV--6M9cOyi2NsUjFOlKKdh26bZaYmNFvo9imb4PPcFnnScQ>
    <xmx:yD_rahnKk5RSII8E9JV0YCmarLnq_AyAywuXB4iotmyEea7T1OCsvg>
    <xmx:yD_raooK3RtjX7GDLuo4BqmBXZSDLgpGZNwPloVr2nEhLSrKPqOlzg>
    <xmx:yT_ramiihEUsoZLwtfFpUQbyWdCIVIEbImImt0rRrugz4sr4dc5mngvf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 09:23:04 -0500 (EST)
Date: Wed, 4 Nov 2026 15:23:02 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/7] Introduce v4l2-isp reset buffers
Message-ID: <20261104142302.GK1959885@ragnatech.se>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
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
In-Reply-To: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>

Hi Daniel,

On 2026-11-04 12:28:15 +0000, Daniel Scally wrote:
> The V4L2 generic ISP parameters buffers described in
> Documentation/driver-api/media/v4l2-isp.rst has a problem in that if
> a driver using the parameters format is running a stream and the
> device is suspended to RAM and later resumed, userspace will not tend
> to reconfigure it with _all_ of the possible parameter blocks. The
> format allows only a subset to be populated into the buffer queued to
> the driver and this is the common practice in libcamera. The effect
> will be that a resumed device will have lost any configuration that
> tends to be sent only a single time at the start of a stream, for
> example lens shading table settings.
> 
> This series performs some preliminary cleanup and then adds the "reset
> buffer" concept to v4l2-isp. This is a mechanism through which user
> space can flag a struct v4l2_isp_block_header.flags as needing to be
> reapplied on device reset, such that the v4l2-isp framework will store
> that block into a buffer allocated for the purpose when it validates
> the block. 
> 
> The last patch in the series updates the rkisp1 driver to use the
> v4l2-isp reset buffer to reapply that saved configuration on resume.
> 
> An alternative approach might simply be to store the "last seen" copy
> of any block in the reset buffer - this would be a simple change.
> That implies a lot more processing on the majority of frames, as we'll
> then always copy at least something, but it reduces the risk of losing
> a setting. That amount of processing each frame seems very undesirable
> to me though, particularly given the scene will presumably have changed
> after resume and so the settings like AWB gains that are applied for
> most frames are probably out of date anyway. On the other hand we may
> end up flagging a lot of blocks, as there's parameters that might be
> changed mid-stream (like gamma) but would not be so regularly changed
> that we could just rely on them being sent naturally on resume, so a
> third approach might be to invert the meaning of the flag and store
> any block that _isn't_ flagged as _not_ needing to be reapplied.

Is there any reason not saving and restoring all relevant ISP registers 
directly in the suspend() / resume () callbacks? AFIK this is what most 
drivers do here and it's not clear to me why this would not work here?

> 
> I'm open to opinions on how best to set the balance!
> 
> Please note that the changes for the C3 and Dreamchip are only compile
> tested.
> 
> Thanks
> Dan
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Daniel Scally (7):
>       media: rppx1: Drop max_size param from rppx1_params()
>       media: v4l2-isp: Hold v4l2-isp data in central struct
>       media: v4l2-isp: Update users to initialise and validate new struct
>       media: v4l2-isp: Use centrally-held data in framework
>       media: v4l2-isp: Add v4l2_isp_params_for_each_block()
>       media: v4l2-isp: Introduce "reset buffer" concept
>       media: rkisp1: Re-apply v4l2-isp reset buffer on resume
> 
>  Documentation/userspace-api/media/v4l/v4l2-isp.rst |  19 ++++
>  .../media/platform/amlogic/c3/isp/c3-isp-common.h  |   2 +
>  .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  28 +++--
>  .../media/platform/arm/mali-c55/mali-c55-common.h  |   1 +
>  .../media/platform/arm/mali-c55/mali-c55-params.c  |  28 ++---
>  .../media/platform/dreamchip/rppx1/rpp_params.c    |  30 +++--
>  drivers/media/platform/dreamchip/rppx1/rppx1.c     |   8 ++
>  drivers/media/platform/dreamchip/rppx1/rppx1.h     |   5 +
>  drivers/media/platform/renesas/rcar-isp/core-io.c  |   3 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   3 +
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c |  61 ++++++----
>  drivers/media/v4l2-core/v4l2-isp.c                 | 126 +++++++++++++++++++--
>  include/media/rppx1.h                              |   2 +-
>  include/media/v4l2-isp.h                           | 109 ++++++++++++++----
>  include/uapi/linux/media/v4l2-isp.h                |   1 +
>  15 files changed, 331 insertions(+), 95 deletions(-)
> ---
> base-commit: 00178eda305a332f302882849ff7374d4169be8b
> change-id: 20261030-v4l2-isp-resume-41fad731df28
> prerequisite-change-id: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61:v1
> prerequisite-patch-id: 8f6b499ef7898229c5b02e987822dd676a0cfd74
> prerequisite-patch-id: 56d0852983c6f46537c03ca3bec71e0ce4046431
> prerequisite-patch-id: 0b9edd21d24a25c620792dfa692d91346ceccdde
> prerequisite-patch-id: 3b9425028cd62b60b3dc3dbd2fc3b5a8912a1fb4
> prerequisite-patch-id: 771f986e2754383e7b5a920b25bf1609dc96f0b4
> prerequisite-patch-id: 79c95d6375d662a4f75cccd8650b3fab05e4e66c
> prerequisite-patch-id: e2ff2463db4934e707afbf0a239270d26dbf8189
> prerequisite-patch-id: 5a923b7606f7cc60fd6b75be2d73231470043bcb
> prerequisite-patch-id: fb80748a1a24316cdd77481b60936f716fd0aa71
> prerequisite-patch-id: 1450f7d1f4b1a41e7ce65ea6d2fbd450d3a198ad
> prerequisite-patch-id: d1d2ba9927536b110f7fbc0c68698d08afb74c27
> prerequisite-patch-id: c2ae6f91cb9662307f90070523945ee03a79c4c3
> prerequisite-patch-id: 87b425bde44fe889367a93302629dc011a3ec88a
> prerequisite-patch-id: 25e4c9ee767dc61406adcf1e1463796a79832795
> prerequisite-patch-id: 82388f762700dbcf39fdc43e6ba56c1feb55733a
> prerequisite-patch-id: a4ad2fb2c7f8659c6d9bdcd9718a7ee69f124838
> 
> Best regards,
> -- 
> Daniel Scally <dan.scally@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund
