Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094939CCF3;
	Tue,  4 Aug 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833655; cv=none; b=GHI8PDq2OF5z+GqYmitOljWF415ACQ/hUcmFRWQ0p8br7n9BP7EMU0u4nYQYqYoc4MVlqfIQJAicTGlI57WNqSJv/wwPh5JvxwwLM3Z2ey8JIS3aphnPGefpGqaVvAdy552xFIRrmD23eybCmgwiD9ifm7kKzkcEA3K3ta+TEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833655; c=relaxed/simple;
	bh=KL/AJCAoRGBAqAS32u8WLZ5PCwGlE5U4j266pFaFTjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CizA8CWxjLeocdoybf5YZZfulrQV300E7B/xey6unU4/tYfQ49lTwWernlc+tsShXg4NofQESt5kN/LWUvurUKiOZesGFStXGytsgjGVhZKvWTzF9Lz/yxfBReLEmvCco/OqYn+ptQ47hLGWfEuUNu7OG8q5tMBPGK/jQvJnAsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ayU2Jt+O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lxESpT9O; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ayU2Jt+O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lxESpT9O"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 891A51D001AA;
	Tue,  4 Aug 2026 04:54:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Aug 2026 04:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785833652;
	 x=1785920052; bh=MtWSN2ULMFqVASyfNFljZCa7nYlxiR8NPoVl8egIGr0=; b=
	ayU2Jt+Ory0zIfazyvV4WqTZh/aBGu7HMx10xIn20R3rYvxOw9DviI6H88oAlYj6
	A2jViVZSumqktMhoLtVIJdXMiddxWzHWW8GZnH9i1wT43BijfA+Mpbr0Qq97ZKT+
	IysT1guXcV2RQO1Okajj7hOMBQX4GIU7CiLr/6Ccna9bbG21q9rExbch2fsUIANE
	QsJn8S1snGdaqKJvzxU3raqjyHj8h2JgMyHd/+I8X6HLqR6qsl4fZMCt9j8vW9wi
	gOKLr/LB5NNbTw2qdUIcWQFcx7E98YTwwFDGmtBTwA7uWBnK3bPhhHF6hyGbENOI
	T70i2hPJzrsR59qR/a+8PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785833652; x=
	1785920052; bh=MtWSN2ULMFqVASyfNFljZCa7nYlxiR8NPoVl8egIGr0=; b=l
	xESpT9OU+rFTV2luw51iw92KZmCdk5B2FD5Nca+CjYbHPMnymIRfUC9jW9ETUnqk
	ru9VQJNqSPvr+GundcLWYu5iMKb3S7pIBg9rzg9bLKNkisq0EPIZHWDrCPSYJxoY
	f1H47drjW6SwR43UQqAFYtWuh1TnO7YGyU80h9QXPq07oRU321fRA7p/KKFcjKtz
	LrOyjUCaW6hvYD8Q47+NK5nLutt5I2mez4OIEdmBnKddyy12T2OnEttOmKqpj0OM
	lgxvB/xBo6h461nhuiJAekuGu1FaE6I7mxTSVqqGS12YhMOiCyr4y0ijy3vC0fVV
	9ntiIbvFZBMzEBQ2V4j0g==
X-ME-Sender: <xms:tKhxau2g4W_Sl-YkMrgtJM9x_RXHd7bxBEqN9IEI0ScBTr_lP3qDyg>
    <xme:tKhxapSDlPyV1kFA7TWBIGb1R-e1AsCJIYmZ3A3EAU1SOid9BPDf6oz1zK7nHbdp5
    s-vQzzqEB7vkXss7EHRfWo9l0L-GGcMire2QDmiikC69NzjRaUxeX0B>
X-ME-Received: <xmr:tKhxaifAXScHdRngXAdAmv7hverIijXxMCwnNb2KSGR3PK3IC9as723kKjUuuGW9Ch_N2GO7zuC2khhoctWdjfpCmH9eL94>
X-ME-Proxy-Cause: dmFkZTGtDJDbk3dJ4jSgaiPaiqFxjZ9xUlm755D0tCYs66gUhi/dsSDVQB23tDpwP+FICD
    SByx11lNbrsf8g1dUwuu9V2aQX+lpe7VPJokoqhiQWKmb0QJt9FMZtVz4DTAA3pxyesYFs
    a8SkQJHd4oJGQI1qKTNG0fKGTJ16JOCYuON4KUuMQgVGB0tDFcYgU8zb8hEZ4tYberCAQ/
    A8KljdhE2EKPnu9q9HbvBsl1lhp56HJgopEUD2ZGLsspwvjRxCXx3JNQde4QRFXi2huZHZ
    2uM9OLI7kE1IhVHloz0kWvS6BE4efXfkbj0ROqxsKKOliF1Tm3Ka5TeZDwTvCPonW5HUkj
    aTmPq2S6386iLT+CXU2mr1a814SiqXUzjHamr0Mixp8kn5KoNjMmHEFgteSLYvn6slJYCO
    VL8lgD4VzhjXijYMEN9UIUHFvWNgJEn7XWvr+rxAY2G8UAUtXF1yM5/yOn4tXrN+JXUg/z
    X6aN2+ErxkZ/K7+kK6Cu+sflwddtkbw2rwM5TcR0ItrfxsKlsEUyN8KDkhyicsJiatD5Wv
    qszD3g0L68O/UiTeB60UjSa48BW+D0HmxIkWuxurk5S965niiI3MfAIzMT+MDWH5uzkvXY
    Fxq0U9RLbpe8zHCUyGl5Y9DaX89DYwOkEiJIUNdrEbpNspVjgX82UDPhV3dw
X-ME-Proxy: <xmx:tKhxaqdg-lXSFmt7siGtgccZ1sDLQLVvL9VuVEcw93-owNbG1EYbbw>
    <xmx:tKhxas10s3EptHHgx05XGcWSwVMLQ0D5R5Sfcxm-E_DJKzGLaq23fQ>
    <xmx:tKhxai-8OQ5yGq6cTq9nRRXfDivB8NWBBX75hx-6GVTwOZJERm7leA>
    <xmx:tKhxah51xvpLzl4D_DDm8eRW2782CK6Ahqu5r3d2I87EWrkze-DayQ>
    <xmx:tKhxar6SdidIPm-LqDncVQ0k5V66Fo1a49egf-3dfG2RDw-eg8dnMnqz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 04:54:11 -0400 (EDT)
Date: Tue, 4 Aug 2026 10:54:10 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rcar-isp: Release ISPCORE resources
Message-ID: <20260804085410.GC346309@ragnatech.se>
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
 <20260803090553.4082161-2-lilinmao@kylinos.cn>
 <anChUtV090GkJ6VI@zed>
 <9a3881ad-0da6-4a47-b408-a2106f5a2f14@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3881ad-0da6-4a47-b408-a2106f5a2f14@kylinos.cn>

Hello,

On 2026-08-04 10:25:35 +0800, Linmao Li wrote:
> Hi Jacopo,
> 
> 在 2026/8/3 22:17, Jacopo Mondi 写道:
> > Hi Linmao Li
> > 
> > On Mon, Aug 03, 2026 at 05:05:53PM +0800, Linmao Li wrote:
> > > v4l2_device_register() takes a reference to the parent device, but the
> > > ISPCORE remove path never calls v4l2_device_unregister(). The reference
> > > is therefore leaked whenever an ISPCORE is removed.
> > > 
> > > Probe failures after rppx1_create() also return without destroying the
> > > RPPX1 object.
> > > 
> > > Unregister the V4L2 device and destroy the RPPX1 object on the
> > > corresponding error paths, and unregister the V4L2 device during removal.
> > > v4l2_device_unregister() also unregisters all attached subdevices, so it
> > > replaces the narrower subdevice-only cleanup.
> > > 
> > > Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> > The driver has not landed in any Linux release, but it has just been
> > collected for the next merge window.
> > 
> > If your patches get collected as part of the same cycle, I don't think
> > there's any need for a Fixes tag ?
> 
> Agreed. I will drop the Fixes tags from both patches when respinning the
> series.

With Jacopo's concern addressed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> 
> Thanks,
> Linmao
> 
> > 
> > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > ---
> > >   drivers/media/platform/renesas/rcar-isp/core.c | 12 +++++++++---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> > > index 8dafffdd8de68..923970fd7841f 100644
> > > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > > @@ -883,17 +883,23 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
> > > 
> > >   	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto err_destroy_rpp;
> > > 
> > >   	ret = risp_core_create_subdev(core);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto err_unregister_v4l2;
> > > 
> > >   	mutex_init(&core->io_lock);
> > >   	spin_lock_init(&core->lock);
> > >   	INIT_LIST_HEAD(&core->risp_jobs);
> > > 
> > >   	return 0;
> > > +
> > > +err_unregister_v4l2:
> > > +	v4l2_device_unregister(&core->v4l2_dev);
> > > +err_destroy_rpp:
> > > +	rppx1_destroy(core->rpp);
> > > +	return ret;
> > >   }
> > > 
> > >   void risp_core_remove(struct rcar_isp_core *core)
> > > @@ -907,7 +913,7 @@ void risp_core_remove(struct rcar_isp_core *core)
> > >   	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
> > >   		risp_core_io_destroy(&core->io[i]);
> > > 
> > > -	v4l2_device_unregister_subdev(&core->subdev);
> > > +	v4l2_device_unregister(&core->v4l2_dev);
> > As v4l2_device_unregister() unregister all subdevs of core->v4l2_dev,
> > this seems correct to me.
> > 
> > R-Car ISP is a little complicated, in the sense that the core->subdev
> > gets registered by risp_cs_registered() which is the handler of the
> > channel selector subdev .registered() callback, and to properly
> > balance we should unregister it in the (not implemented)
> > .unregistered() handler.
> > 
> > However, as this is called as part of the driver's remove handler, and
> > that's what we have at the moment, I guess this is ok
> > 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > >   	mutex_destroy(&core->io_lock);
> > >   	rppx1_destroy(core->rpp);
> > > --
> > > 2.25.1
> > > 
> > > 

-- 
Kind Regards,
Niklas Söderlund
