Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812012;
	b=q5XsWMTh5YDV7cG/L0GcNQEUfy3DKmW3L/6bXWqVn2uLMuSypAhVvnPGTHew3jt1PWHN
	 JnVWdkmE485nuF16I+rRMUdAgvX51iG5NysZLU4OvDUVjHPvZmV2F+UbpseF58g8TP0A5
	 svNSDOuryInU18P8YfllzlyRgcvNcN6riMpch2jGbLVNYbSQubqUNVD2yPOJ3jckPo721
	 pKYYJKoctZ7uUKXRIgFxN9+WM8M9NuJywq03W446KwGWW+SllFyKqYycTmbuO/ae5M21F
	 Qp+R8700+LqE7gwya9flXOJ1uXdQrrg5HcrI7kv7dEu/t4YNEGU6lBJzT4S6qGJ498w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812012;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Rl3XsHzeVcKHahUWr2EMatwyVTlaVI9RLbK+GbkRJN8=;
	b=uJt+jpPk4H6dL2AHUX1XXF9hE8N8xSNGE51xUvEiQfMw0A0tC3KO6lvKch8mnFeHSXve
	 7u3end1m4/9uic7pWUHHGl4rf76RxcwHiHGR2ZNDjnvpGdZRjhYfycCCfcljMzz74LT8w
	 E854afl+ADCcdcRKs2MHIO0/iy4EToZgpHg0uW9KweC7IOk774VGUsf+7oMkvQ4WCP232
	 zl7FrLyTk3k/qD+r93W1AS7Djv+jvt65u74G3IhCP2vcKO8hywy2Kv1kjaWd4x3e1igoR
	 TegLTQczHCLbI/7qsDtKrYcxYFikyhSbB1Ox5OtgmlOHsmw1yNmMEbxiZr+4grtS4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=ar5i1nun;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tE+rGdVy;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D5C606A330
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 17:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D5C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=ar5i1nun;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tE+rGdVy
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 1DF8E1D001A3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 12:06:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 04 Nov 2026 12:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793812009;
	 x=1793898409; bh=Rl3XsHzeVcKHahUWr2EMatwyVTlaVI9RLbK+GbkRJN8=; b=
	ar5i1nun+Qv5USv2iyeeFkBPHIHPEPbQZDNNDpUiA2KgNY9X1YUryMLP2uIm/F5B
	Vc0Kj6n/CKot0ibuZT0EEmB7Ao28bBLHyQvnMXWnPh5VAxfn23A2YabyhDJMKgmm
	VYheWT4L5U46k2A9vSOy4cPmxRVd6Z8ZHcmXCssKi75q3xLB/cfB04YOhZPG/f2A
	S1EWea00tsTvqijQHJEw3V6ouA+6CzogGR9mZo5mW8g5LIcFet6ohfOGLSD0PI4S
	ITXtZhHpJjC6KOYKg7S2hJvGmWINUpoBGdReWsU59UsxwhU2Org0TxHxGpbP+Oq8
	jvni/FXMSYf39NqeRfW2WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793812009; x=
	1793898409; bh=Rl3XsHzeVcKHahUWr2EMatwyVTlaVI9RLbK+GbkRJN8=; b=t
	E+rGdVy1j7LsAvONOHj4bOg3yI+YgTGW++qkq/OVHwKyjG7HxgGGEXQhht6Ct5D5
	yoADexpj6BxROdlESQ3JkbesDOFUala0naTlG+CWgwdHq3Uol8evergPfsfp3/pN
	0//0uehLSyP58EYSZVkKoE8eRJjm6VvQvbLd3DH9vBfPH752I5AI2MKOkVCJxVAT
	DhWZknTe4/kLI1rm/u3/zQb+uVhBsmjvzufhOk2mKb7sW2jNLZsECNxF27QWQkcF
	gIXkJR1k2IM43/KJMbykCjzQUhBkxM4dZf40pkES0lL0LdfRI4DW5JX4GQmfppD0
	CHL0AaWrZZE1UIx2J1QHw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793812009; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:Wr1e6+U7Iy6h5mUrJx3ai0TWP1ieQJ1M4T3DSn9nQjvE3Lb
	79oOiyFu/YNBXxn1AJkNWv9VTWk8jTJWRPsGhXJSnntZ+jdSybmBgJmty+A4iC83
	G7VwbkgynCk1178mY3iaSt3WeoBS84wVNu63GLzu+cHIOK0V4jGBEvxyMNaFRy1O
	guHdJewjDGryMMkGKF4LyjDTt6r4//KMTXquaHLSiXqPLHR92Lbm74g7SzjR10pA
	RhgSqA9PrlNMNti/N0uKwl1GkI46W3UWEE7XGaVxHLQnYyqxnK+P4hoUbxqmPsL5
	sbNeaCh1DGnFglSZpWx014wq4oDM8jE/QlMib2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vkRZV9XrsXBmTymG3lF6o8MEEzJfqjeC+dYDBnmJKuQ=:TFisgF5GgYaC9PQcQH5oi5ArZna/EpfSxNDa7lF9kho=;
X-ME-Sender: <xms:KGbratZvvzvm28QsjjZDSvM_wYv8_kXR02VPaVxgfpXqCLRGJZSeyg>
    <xme:KGbrak1V70-ziUZZVXJNUMh_5QywITRkhV4RedMDuTCC4DE3s0mNl7v6okgG-B8IV
    uNwXHn39NcfGXzmGhDcItqxjbf4H-Lh1H0-GIz3vTWEGBEt6GvKJx4x>
X-ME-Received: <xmr:KGbravvvadkxvhPVPixDxUHX8C5JiwrajsKEG6ctIGc8GYzEiVv5f7EoltqTLeE9ORqdchsSVSk2WF4cmDeME2GPliWLfUw>
X-ME-Proxy-Cause: dmFkZTE+SzzdABOJvZq/CcQn9xNutSW5MbXJXTNE+317B7E+J1HxZ4LIRWxvDXE+U05udD
    F7/dWoZP13TUVLYXy+Ml7PjCG3aP/+q1ZIugeH3xDFZHcg8/g2war7p5RFiKaCWcqaisrJ
    AlphjPNIWTD0MXqG86O3yNdfHfMO0HtZYUrMbzUjRgfXTSNogAkxKnxXHYTAXW8PIkNdoK
    Q1yl5nOW1DQEH4ZgSAOBRlWlLAaNxYTEHWc8HHd+hRx9CENhkF+HP1TkanC7B1XyEQOsiw
    HSk5rBj0vJFehuxhqpFcB0ZTXQgvN4cE4GV0loPoUnjM/kfelQc96ZnbRkOd0BYxScTTjL
    CXEIYemdUA7UQayWnxq3BXeyN4mD32vRkLehJXsKq3to7HDDDo5pzlrZQHbwSSQEa2vbu4
    bFx2pKC63+jO+Kf7vHtUzqoabEF7+DixvgZvl/dyL8BCZsKaz/udvpcT1K/Y6YAnJGSZLY
    XA/17nBTs3aWZ3wDUGGf4x6xDdBgCWW9wJ09Y9AfD9TGZvQw621t16kjgfb72Pv5KtMmkr
    Yg8w1KxL4wa8MbwmclqUwAiiTmJUFH6xP237xUkuBqIgcrFxfOWOi4opJgp0MzrpkLMJtO
    c9vubtcTqcjEUQWiTIoFYEAD7R0UIhQMTfEu25yne9RydV7HDMOLz6sFqvfQ
X-ME-Proxy: <xmx:KGbraoB_rPtv-jQhhA_H1MVIMyN3_xFQ9WNzyxnW0NdDW2Pk7KkWag>
    <xmx:KGbraiZUqsfzxojLMJf5qekd1fThRDjC7sD076Z9dT79gzh9W7Ybxg>
    <xmx:KGbraq9X20W5pqPeMAnc_6XhLL2rXHq0S2s0ybv0l8cTwIQ-yg6YZA>
    <xmx:KGbramgX0XqPGNry4jLkrpc4LaCq53l0D0Fff6_jL9tMjESimPlprQ>
    <xmx:KWbrahL7ALVgKiym6kQdtnFCZUIpkPizDWxWWybwikxYOdnvfo-55AzP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 12:06:47 -0500 (EST)
Date: Wed, 4 Nov 2026 18:06:45 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Dan Scally <dan.scally@ideasonboard.com>
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
Message-ID: <20261104170645.GM1959885@ragnatech.se>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
 <20261104142302.GK1959885@ragnatech.se>
 <6a86cb84-c4b4-44b3-9977-12ac1dc8505c@ideasonboard.com>
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
In-Reply-To: <6a86cb84-c4b4-44b3-9977-12ac1dc8505c@ideasonboard.com>

Hi Dan,

On 2026-11-04 16:24:01 +0000, Dan Scally wrote:
> Hi Niklas - thanks for commenting
> 
> On 04/11/2026 14:23, Niklas Söderlund wrote:
> > Hi Daniel,
> > 
> > On 2026-11-04 12:28:15 +0000, Daniel Scally wrote:
> > > The V4L2 generic ISP parameters buffers described in
> > > Documentation/driver-api/media/v4l2-isp.rst has a problem in that if
> > > a driver using the parameters format is running a stream and the
> > > device is suspended to RAM and later resumed, userspace will not tend
> > > to reconfigure it with _all_ of the possible parameter blocks. The
> > > format allows only a subset to be populated into the buffer queued to
> > > the driver and this is the common practice in libcamera. The effect
> > > will be that a resumed device will have lost any configuration that
> > > tends to be sent only a single time at the start of a stream, for
> > > example lens shading table settings.
> > > 
> > > This series performs some preliminary cleanup and then adds the "reset
> > > buffer" concept to v4l2-isp. This is a mechanism through which user
> > > space can flag a struct v4l2_isp_block_header.flags as needing to be
> > > reapplied on device reset, such that the v4l2-isp framework will store
> > > that block into a buffer allocated for the purpose when it validates
> > > the block.
> > > 
> > > The last patch in the series updates the rkisp1 driver to use the
> > > v4l2-isp reset buffer to reapply that saved configuration on resume.
> > > 
> > > An alternative approach might simply be to store the "last seen" copy
> > > of any block in the reset buffer - this would be a simple change.
> > > That implies a lot more processing on the majority of frames, as we'll
> > > then always copy at least something, but it reduces the risk of losing
> > > a setting. That amount of processing each frame seems very undesirable
> > > to me though, particularly given the scene will presumably have changed
> > > after resume and so the settings like AWB gains that are applied for
> > > most frames are probably out of date anyway. On the other hand we may
> > > end up flagging a lot of blocks, as there's parameters that might be
> > > changed mid-stream (like gamma) but would not be so regularly changed
> > > that we could just rely on them being sent naturally on resume, so a
> > > third approach might be to invert the meaning of the flag and store
> > > any block that _isn't_ flagged as _not_ needing to be reapplied.
> > 
> > Is there any reason not saving and restoring all relevant ISP registers
> > directly in the suspend() / resume () callbacks? AFIK this is what most
> > drivers do here and it's not clear to me why this would not work here?
> 
> I don't see any reason that would not work, and maybe I overthought this
> indeed. This method does still seem to have some advantages to me though; it
> means we can easily reuse the existing function in the driver that applies
> the parameters to the hardware, which should make adding suspend() and
> resume() support for a driver that uses the extensible parameters much
> simpler. If we were to read the settings from the ISP registers and store
> them in suspend() instead of doing it this way I think I'd still want to
> re-use the normal "write-params-buffer-to-hardware" function (for example
> rkisp1_ext_params_config() in the rkisp1 driver) to avoid the risk of ending
> up with differences between how the parameters were applied on resume() and
> on the normal handling of a parameters buffer from userspace, so I think
> that we would end up populating a struct v4l2_isp_params_buffer that was
> stored in the device's driver_data struct anyway - the difference would be
> that we'd have to build it in suspend() for each ISP driver instead of
> having the core handle it in the course of normal operation. I could knock
> up an example for the rkisp1 of creating that buffer in suspend() to see how
> it looks perhaps?

I think what made me comment on this is the involvement of user-space in 
how suspend/resume will act. Normally I assume the kernel will deal with 
it all, and after resume it will restore (to the extent possible) the 
hardware state as it where at suspend time. I'm sure this approach exist 
elsewhere in the kernel, I'm just not aware of it.

My worry is that suspend/resume will work as expected for libcamera 
users, but then somebody does something else and expect the kernel to 
handle it correctly like it do for other types of devices.

Maybe I'm being too causations. Putting the user-space involvement to 
the side for a moment, having v4l2-isp provide helpers to apply buffers 
at resume time to save on boiler plate code in drivers is of course a 
good idea.

IIRC this is what is done for V4L2 controls already. The V4L2 core sets 
all controls at resume time so the drivers don't need to deal with it 
directly in their handlers and the existing set/get callbacks are used.

Maybe we need a get params callback to v4l2-isp? And have the core do it 
the same way here? I guess this is one fun area where we mixing V4L2 
classic controls, controls in buffers (v4l2-isp) and per frame controls 
into yet another control abstraction, so maybe not go there ;-)

I'm happy to hear what others think of this. I do see the value of what 
you are trying todo, I'm just a tad worried about involving user-space.

> 
> The "reset buffer" idea also means that if we extend the parameters buffer
> for an ISP with more blocks in the future there's no extra work to do in the
> suspend() and resume() callbacks for them - as long as userspace flagged the
> new block then they would just be reapplied "for free".

I understand and this would be appealing.

> 
> Thanks
> Dan
> 
> > 
> > > 
> > > I'm open to opinions on how best to set the balance!
> > > 
> > > Please note that the changes for the C3 and Dreamchip are only compile
> > > tested.
> > > 
> > > Thanks
> > > Dan
> > > 
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > > Daniel Scally (7):
> > >        media: rppx1: Drop max_size param from rppx1_params()
> > >        media: v4l2-isp: Hold v4l2-isp data in central struct
> > >        media: v4l2-isp: Update users to initialise and validate new struct
> > >        media: v4l2-isp: Use centrally-held data in framework
> > >        media: v4l2-isp: Add v4l2_isp_params_for_each_block()
> > >        media: v4l2-isp: Introduce "reset buffer" concept
> > >        media: rkisp1: Re-apply v4l2-isp reset buffer on resume
> > > 
> > >   Documentation/userspace-api/media/v4l/v4l2-isp.rst |  19 ++++
> > >   .../media/platform/amlogic/c3/isp/c3-isp-common.h  |   2 +
> > >   .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  28 +++--
> > >   .../media/platform/arm/mali-c55/mali-c55-common.h  |   1 +
> > >   .../media/platform/arm/mali-c55/mali-c55-params.c  |  28 ++---
> > >   .../media/platform/dreamchip/rppx1/rpp_params.c    |  30 +++--
> > >   drivers/media/platform/dreamchip/rppx1/rppx1.c     |   8 ++
> > >   drivers/media/platform/dreamchip/rppx1/rppx1.h     |   5 +
> > >   drivers/media/platform/renesas/rcar-isp/core-io.c  |   3 +-
> > >   .../media/platform/rockchip/rkisp1/rkisp1-common.h |   3 +
> > >   .../media/platform/rockchip/rkisp1/rkisp1-params.c |  61 ++++++----
> > >   drivers/media/v4l2-core/v4l2-isp.c                 | 126 +++++++++++++++++++--
> > >   include/media/rppx1.h                              |   2 +-
> > >   include/media/v4l2-isp.h                           | 109 ++++++++++++++----
> > >   include/uapi/linux/media/v4l2-isp.h                |   1 +
> > >   15 files changed, 331 insertions(+), 95 deletions(-)
> > > ---
> > > base-commit: 00178eda305a332f302882849ff7374d4169be8b
> > > change-id: 20261030-v4l2-isp-resume-41fad731df28
> > > prerequisite-change-id: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61:v1
> > > prerequisite-patch-id: 8f6b499ef7898229c5b02e987822dd676a0cfd74
> > > prerequisite-patch-id: 56d0852983c6f46537c03ca3bec71e0ce4046431
> > > prerequisite-patch-id: 0b9edd21d24a25c620792dfa692d91346ceccdde
> > > prerequisite-patch-id: 3b9425028cd62b60b3dc3dbd2fc3b5a8912a1fb4
> > > prerequisite-patch-id: 771f986e2754383e7b5a920b25bf1609dc96f0b4
> > > prerequisite-patch-id: 79c95d6375d662a4f75cccd8650b3fab05e4e66c
> > > prerequisite-patch-id: e2ff2463db4934e707afbf0a239270d26dbf8189
> > > prerequisite-patch-id: 5a923b7606f7cc60fd6b75be2d73231470043bcb
> > > prerequisite-patch-id: fb80748a1a24316cdd77481b60936f716fd0aa71
> > > prerequisite-patch-id: 1450f7d1f4b1a41e7ce65ea6d2fbd450d3a198ad
> > > prerequisite-patch-id: d1d2ba9927536b110f7fbc0c68698d08afb74c27
> > > prerequisite-patch-id: c2ae6f91cb9662307f90070523945ee03a79c4c3
> > > prerequisite-patch-id: 87b425bde44fe889367a93302629dc011a3ec88a
> > > prerequisite-patch-id: 25e4c9ee767dc61406adcf1e1463796a79832795
> > > prerequisite-patch-id: 82388f762700dbcf39fdc43e6ba56c1feb55733a
> > > prerequisite-patch-id: a4ad2fb2c7f8659c6d9bdcd9718a7ee69f124838
> > > 
> > > Best regards,
> > > -- 
> > > Daniel Scally <dan.scally@ideasonboard.com>
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund
