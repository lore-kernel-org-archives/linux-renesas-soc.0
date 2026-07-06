Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7F31F9BA;
	Mon,  6 Jul 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353772; cv=none; b=JCX3vafj9z0jPqyInZE1d+beextMdpPV+a2tnmzV5KIsYtzyZTGFQSCd4eZ5ldOaKzZYIeqs7x4xOiOicpIftDLrXjrpuluW3oD+8xz9OPYBxDoJEKEGEnhecjFy922wnRCO4afMxbijeeO5PawfhpVxCfZRnQeMY5m77ZqzSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353772; c=relaxed/simple;
	bh=i8nf4O2WsIEE/n0S6fpBF1M5knrAG/jCBg9Deoxto/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mphzjaYMq0QzhsIJnyWTyV8E9QT1+gqUZPU5bwRHWCIRAZBp3GtAbczOA5hPlcuJJNIE1/jA+Ye5DnZXPeS2hhNcB1FhmS5ea4HWLN4/5L+cUoSDt0vFN2yCSvX4Kn3mrssmwxCZOyw0QhCvIbJcwIZNjJKUFkFvukYaN0T6Exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gqvl818r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gqvl818r"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87983838;
	Mon,  6 Jul 2026 18:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783353716;
	bh=i8nf4O2WsIEE/n0S6fpBF1M5knrAG/jCBg9Deoxto/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqvl818rEpx0lnDUiRHq56bBrBsKS5t0JACNhhFJMKIaFgOPv9L7D8f2hhAD5DqgO
	 pO3LPdjvI5DXRHsXH3yigetnhZPdZQprn8TzXrLhLwLouugdFVDbJeX3d//aAUAEiq
	 Enwsb7eaJcpspMTh6pMmWMJHFYlF7WKmJMqHRh28=
Date: Mon, 6 Jul 2026 19:02:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260706160243.GB106045@killaraus.ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
 <20260706-fancy-perch-of-satiation-0c220e@houat>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-fancy-perch-of-satiation-0c220e@houat>

On Mon, Jul 06, 2026 at 05:40:30PM +0200, Maxime Ripard wrote:
> On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrote:
> > On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > > > Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> > > > data over an I2C bus. The bus is also used to detect the presence of a
> > > > connected monitor by trying to read the EDID data.
> > > > 
> > > > Some devices where the VGA display is integrated in the device and
> > > > always connected do not connect the DDC pins. Some development boards,
> > > > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > > > 
> > > > To support those, add the ability to provide hardcoded EDID data in the
> > > > device tree. This is mutually exclusive with specifying a DDC bus, and
> > > > can only be done when the VGA display is guaranteed to be always
> > > > connected.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > This feels redundant with the EDID firmware loading mechanism we have in
> > > KMS already. It should at least be mentioned why we would need to set it
> > > in the device tree at all.
> > 
> > Very good question.
> > 
> > I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
> > debugfs override_edid feature isn't meant for production. If there are
> > other relevant mechanisms I'm not aware of, please let me know.
> 
> No, that's indeed what I meant.
> 
> > In the use case at hand, the VGA display is an integral part of the
> > device, the same way an LVDS or DSI panel would be. Using
> > CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
> > drm.edid_firmware command line parameter, and provide EDID as a file in
> > /lib/firmware/ (possibly in an initramfs). Beside the complexity, and
> > the fact it won't be very friendly to people who run a different
> > userspace on the device, I think EDID counts in this case as system
> > description, the same way we support specifying panel timings in device
> > tree.
> 
> It's *some* hardware description, but you have no idea whether it's
> actually the hardware you're running from. What would be in that EDID
> anyway?

It would be the EDID corresponding to the connected display :-) I see it
as identical to how a user of the simple panel driver is responsible for
listing the timings corresponding to the hardware in the device tree.

> There's another alternative we've used several times already, in
> simple-bridge for example: just register any VESA mode up to a given
> resolution:
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/bridge/simple-bridge.c#L66

I don't see how that would help. The goal is to provide the kernel with
the data corresponding to the display integrated in the device.

> I guess it's what you would do with that EDID anyway?

-- 
Regards,

Laurent Pinchart
