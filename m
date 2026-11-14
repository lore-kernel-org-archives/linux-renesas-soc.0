Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686864;
	b=fBerXqefdR60Ky8Pjxa6eSCxz2VGmqwU2ndhV/cgls5AAHHAIGaczxfpH8nxs/bBCXIL
	 94378qS0aoB7Tnor7KU+jD/ZFt/BbKjVyWPkj9P4qrzTg047LWRLkPPtz/dpVN3bg5/WP
	 RQk+/7BcS08SbN4MjsU3uis6rgjy6j754UQTeACLE5xXgMXxPo+NdpYMwvDoIURcDrcUU
	 PREGzoIj9RBVJsniFpVk2mqqvhtE0lxEZ5fEp0Qk3tA5PxylXGvl54Bybg5Zm7Yiy00fw
	 3ONZIzEpSfZaJKsZapSlsLNUirpqidCLnbHkpNaW1vI5E/rqqSOQDx/BvDX1FB3qMWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686864;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=3+Mi+0As9yWa1QIgih8IQJVUI4B5Rpv+6dy+sgBCLxs=;
	b=wgh5zyo27IQpNgvdZKcHgDi+NhaOpzjrDvVAuTnDRwPz3bK84jHvj6JCCPeMJMBy+CVK
	 Z77kWPrKvYDzlIZATWfy5gJQ75FB9bqlyYT7p/6uymV9mS3xum5MzRZpFP5yVelOpQQt9
	 PkNVObV6E+0ucs2rPrdCx+/B/xYuzuWJvGna9KyitjobWNiAy3/FTACvtdE6A6b7rcatV
	 Aa7b4AVAZez9Uliv1F4BykUrLzpBATY7pN6gn0vEW71NdCv+wvnlRlnUdBs8cyJvlx4oB
	 /QHgZtv6usrZXetAmXYjLdeTBu/Reu/Sqd4UaNZ4dHqhzAVQbghvnJgeNTe6P5/sMNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=ru8Z3QhX;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1rmPxW23;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE8606A333
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Nov 2026 20:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=ru8Z3QhX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1rmPxW23
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 17B94EC0170
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Nov 2026 15:07:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 14 Nov 2026 15:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794686863;
	 x=1794773263; bh=3+Mi+0As9yWa1QIgih8IQJVUI4B5Rpv+6dy+sgBCLxs=; b=
	ru8Z3QhXQr4BSmwXp1XUdTurm+rLlX+4G8JXr+9Lia6LyV1BDrQH+1VymgBGDy0J
	k9noBHZUkIwijSTLPmZINEfKL9hWMz0Cc+sr62RAUcvMM6LhM4/LcOqF99vocAX+
	jadTfKSBB8fDhjUhWNqbPkxsa5/pXXSVh7rspFbLQIDGunzgYP4XmOjbwwXujSCn
	QmBmlaN+ztLXiWfiWPYtrQCJj5Q2GJpDX3tUcma95GcRGaErq3fBbaDY3ZZIvHmH
	5qkENrgRcljCqpDU3tUDbSsYdWeD5FSEfU9s7xacXAGu0MJIj8STYBFVmEPdfkR2
	8ucvQIJGO/Vf3XlA0bxJnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794686863; x=
	1794773263; bh=3+Mi+0As9yWa1QIgih8IQJVUI4B5Rpv+6dy+sgBCLxs=; b=1
	rmPxW23/GqRX2v75fni2jpkGwsQjoSRxwh/u5MQ+7kV5rkHrNTynrmcbCprBwxJb
	sajSsQGCRAfyO0pL/bp12F1LGkKwxDOsnSAkuVQcCVSXlDyrYoXJOQH6ohNVXxWC
	5ad7vW6v3uBHXqzze5gd3Bhu5P9NqvK4TQnWDbibP2uelGvdnxjYVbZkKoPxYHOd
	+SL6uZ20u58Uxfz58pbxTmtLo1uUIWoQZEvudLPIrCnOI4Rb4fc9Wvkxr3GE6wCL
	4H3RAWeSkV/W9C6/zZGUbcICl917sCDfZbPQcHmWnMpE4nycOLTWltjmGMNL6CJX
	2OaSM91AMclQdv7CgWbIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686863; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:AzBZ439hOLUT0zdnDoIeeb07RmZL84N+r9Jp2HOrbt1qMx8
	Xx7ocObsGpvHfyK/PcXZMo7fwZhOE73K/TVD/MnkxbKOrNTtROfDUe6Q2bcH4Ye2
	DI3WjXDooQoaTqxbywUiVKsZbkP6UxktqyQAC+ZfbOg/t47k7GGTiHIocyVIGwS6
	+damAzpRvyq9DtPfGAYo9TFORbneLnZ2OatUJjs+QhwsEd2tiHwt4CkPPlpweM9S
	/OoYg2k63GaqJexSUF2w6mVMTMT4ElJ2DCq3phLy0toBVsFaAJiZ72QocDFKutMx
	d0p3Vt0FzECyEWRMsgeAIy0tnZS+BOUJshAL59A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VwWjgyrvrnrgGpsVe/hZZBQ2gB2KX7jOmUca8xTCb2c=:qttev0S1MJ1EQmoFvMzMbrGGrmjy+hX+stB9+wWwIsU=;
X-ME-Sender: <xms:jr_4avPiQmSVteFSXjtBBMqPtbb-Iww7qgTQ68ym2RNzvOEhibhsaQ>
    <xme:jr_4ai5NYb7z6dv7j6r8adgdBKexzVVi5ZDx13fYMdpO135fFO9VXSnhdJOrlog-_
    7L-m2LKi10yBDkKzvZVeMuJJDvFhPAgcnFctjpQogKZfrD1g3SwsxrU>
X-ME-Received: <xmr:jr_4ap14ZtuKQi9vguWZCbmvPm2Wi4fOD-gt8a8t8ub-RKMjiYU7EA_ZkVvn2pXWED--Fh6JMSSO-dE9YUwEjNIgRiBGLho>
X-ME-Proxy-Cause: dmFkZTFJZ09NiyEOWjGCVTwEXFzWX3cT9HqLsMYv1xQ14iGJSSU5dVnMKEhFD8/R7frVU8
    xvZtdnKqFeL/BK5+vxo2WR8fMiNZudGxBiutxOf7v8LQkf2O6lJHWNHu4b6g4nYCqwvINn
    bYreZnk+Shixp8CtyUq9zhbf5xKUTr/3/eY5RvCHGKHhoIEbmH5ekGIKj/s6GJJ3rn8Uhz
    Zz4B9zcFLsgf5aaIjExAn2OCQwDQNHUrX+YzyWTVpz5NY0GiTvb4Kwxmg1BENxH2HY4We4
    qcXlaqahPLgq0DQcenbJjmix6SAzsH+Fep9sLA0OK+UFwuQBTGjRUYrj9dmIoreopFcGWh
    n1jPrW30lX7W4A1TCbnCAmkKOIDUfxp6v/1TKiJ+qZHSAp3jUxXcxuALDsPEve/iH58U0F
    g8KM5J6NUMEmeGOGwe5U0hK7Y5Gc4M9XuVi+l0LuoMgwNBy2ysNn9AJJNR9vW8nJAtM5Rh
    WyLTQBIQU7JXx4eUWcHWSWooIOTTiefLzYEmkO/Ocq3+hHWDIpnkoAdLnYZAGeK0PlEjFE
    nQ6euMLpcMp04vGRD2UPGF4o8GKbzBEVCvD78KJvQPSjkjC61O7EXkdk3GB1UAlkf7LMte
    QZLqbJX95vIxluCE76iqpAbHD13pje3g9X3F3ZTk9diQTaJoTkX6e6kg6/qQ
X-ME-Proxy: <xmx:jr_4ajyqK8lDlX9_ROoF_xDTNnFSXCHepUvBkbNwwBPBy6TC15iAww>
    <xmx:j7_4aju-nCJBzt3CQcG7WrlmE2aG7YWJXR-9twjp9_K_S1ZlSymQuQ>
    <xmx:j7_4atxw9_sn8u07TP8AGDX5QKnl31EAOPGsQf-WTDqF2NYrY0h5iw>
    <xmx:j7_4auCEBtHHnErCxfcGLH0teSrXmXFR1YUEVV27IUoF7jt2awEXSg>
    <xmx:j7_4alSpPsDvyBhTj60AOLpbdIg3P4qEGLZ6Vr6JgcB8qGSWyouu3qMA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 15:07:42 -0500 (EST)
Date: Sat, 14 Nov 2026 21:07:41 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: uapi: videodev2: Add 20-, 24- and 28-bit
 bayer pixel formats
Message-ID: <20261114200741.GE938627@ragnatech.se>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
 <avWRlfslqUKfANte@zed>
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
In-Reply-To: <avWRlfslqUKfANte@zed>

Hi Jacopo,

Thanks for your review.

On 2026-11-12 11:16:09 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Sep 10, 2026 at 07:22:30PM +0200, Niklas Söderlund wrote:
> > Hello,
> >
> > This series adds the pixel formats and documentation for the 20-, 24-
> > and 28-bit Bayer formats. This is done in preparation of work on the
> > Renesas R-Car video capture pipeline which will support these pixel
> > formats in multiple drivers. For this reason it is posted as a separate
> > series before the driver work.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Niklas Söderlund (3):
> >       media: uapi: videodev2: Add 20-bit Bayer formats
> >       media: uapi: videodev2: Add 24-bit Bayer formats
> >       media: uapi: videodev2: Add 28-bit Bayer formats
> >
> >  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   3 +
> >  .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 102 +++++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 102 +++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |  12 +++
> >  include/uapi/linux/videodev2.h                     |  12 +++
> 
> Have you forgot to add the new formats to the table in
> v4l2_format_info() in drivers/media/v4l2-core/v4l2-common.c ?

Yes I have, thanks for catching this. Will fix.

> 
> 
> 
> >  6 files changed, 333 insertions(+)
> > ---
> > base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
> > change-id: 20260908-v4l2-add-raw-pix-50ca1182ccd2
> >
> > Best regards,
> > --
> > Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> >

-- 
Kind Regards,
Niklas Söderlund
