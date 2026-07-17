Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E0175A6C;
	Fri, 17 Jul 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291135; cv=none; b=g7TqRjTiWLH9akEKXqKUxeBpu6ke2Y8cYMMSyngp+c9APwpdFZG+SNMwxrFCvXcz+PrKOueV6g2SE8GiIR/mEGPI48EoRXjGmIZ9x8YQAvWa7OyiMpuOQT9NNTTJo6g8lvUtJNM8LSAojDW1Ae8MduK45z4I8iOsfYXSO1oDblY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291135; c=relaxed/simple;
	bh=LIrveOCfC/Nm2xJTklxOIDfpSLD9jwkNtd1XzE9uHnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHYDL3Ga7gnIoA//0OXu/qPSiR1ylxr7HQ38DQ+ytx43QyvCQZcROpV1z4yQlEv20RprsHY7aG9YOk+WSxwzjXvRaD2aMNTJ9Al/zqhwrmYkHdtErT2H7eiXlUf23r1aVSYh/O+1sang2IE1rZaAHq4VRAfqKg9obfthTRpEGAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fUUzWve9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fUUzWve9"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 299B5192C;
	Fri, 17 Jul 2026 14:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784291075;
	bh=LIrveOCfC/Nm2xJTklxOIDfpSLD9jwkNtd1XzE9uHnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUUzWve9M6ijhuqHco2oiiamtGr16UN66GYsD4wsoE6ZUuICZGnrrOsuY5ORgwwrn
	 1/LN6VAO2Z8g2+R8JNX5RgzffNCi4svhKJLQyW9nJOlG8OIM3MKFfqCxsMpvbdVbiH
	 +XUx40XMcM8J65RHuLMDh3hZPw6AdyvsXqlvVmcE=
Date: Fri, 17 Jul 2026 15:25:30 +0300
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
Message-ID: <20260717122530.GA1955120@killaraus.ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
 <20260706-fancy-perch-of-satiation-0c220e@houat>
 <20260706160243.GB106045@killaraus.ideasonboard.com>
 <20260707-meaty-chocolate-lemming-fa9ead@houat>
 <20260707080143.GA211515@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707080143.GA211515@killaraus.ideasonboard.com>

Hi Maxime,

On Tue, Jul 07, 2026 at 11:01:43AM +0300, Laurent Pinchart wrote:
> On Tue, Jul 07, 2026 at 09:46:52AM +0200, Maxime Ripard wrote:
> > On Mon, Jul 06, 2026 at 07:02:43PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jul 06, 2026 at 05:40:30PM +0200, Maxime Ripard wrote:
> > > > On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > > > > > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > > > > > > Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> > > > > > > data over an I2C bus. The bus is also used to detect the presence of a
> > > > > > > connected monitor by trying to read the EDID data.
> > > > > > > 
> > > > > > > Some devices where the VGA display is integrated in the device and
> > > > > > > always connected do not connect the DDC pins. Some development boards,
> > > > > > > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > > > > > > 
> > > > > > > To support those, add the ability to provide hardcoded EDID data in the
> > > > > > > device tree. This is mutually exclusive with specifying a DDC bus, and
> > > > > > > can only be done when the VGA display is guaranteed to be always
> > > > > > > connected.
> > > > > > > 
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > 
> > > > > > This feels redundant with the EDID firmware loading mechanism we have in
> > > > > > KMS already. It should at least be mentioned why we would need to set it
> > > > > > in the device tree at all.
> > > > > 
> > > > > Very good question.
> > > > > 
> > > > > I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
> > > > > debugfs override_edid feature isn't meant for production. If there are
> > > > > other relevant mechanisms I'm not aware of, please let me know.
> > > > 
> > > > No, that's indeed what I meant.
> > > > 
> > > > > In the use case at hand, the VGA display is an integral part of the
> > > > > device, the same way an LVDS or DSI panel would be. Using
> > > > > CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
> > > > > drm.edid_firmware command line parameter, and provide EDID as a file in
> > > > > /lib/firmware/ (possibly in an initramfs). Beside the complexity, and
> > > > > the fact it won't be very friendly to people who run a different
> > > > > userspace on the device, I think EDID counts in this case as system
> > > > > description, the same way we support specifying panel timings in device
> > > > > tree.
> > > > 
> > > > It's *some* hardware description, but you have no idea whether it's
> > > > actually the hardware you're running from. What would be in that EDID
> > > > anyway?
> > > 
> > > It would be the EDID corresponding to the connected display :-) I see it
> > > as identical to how a user of the simple panel driver is responsible for
> > > listing the timings corresponding to the hardware in the device tree.
> > 
> > What's the expected user-experience for someone with that board
> > unplugging a display and plugging another then? Update the device tree,
> > rebuild it, rebuild the firmware and / or resign it and reboot?
> 
> The whole point is that they can't easily unplug the display. This patch
> series is meant to support devices where the display is an integral part
> of the device. The user experience is expected to be the same as for a
> user who will take a phone, remove the display panel, and plug a
> different one. It's certainly possible, and they would have to update
> the DT indeed.
> 
> > That doesn't sound very practical, and even impossible in some cases.
> > 
> > > > There's another alternative we've used several times already, in
> > > > simple-bridge for example: just register any VESA mode up to a given
> > > > resolution:
> > > > https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/bridge/simple-bridge.c#L66
> > > 
> > > I don't see how that would help. The goal is to provide the kernel with
> > > the data corresponding to the display integrated in the device.
> > 
> > How is that not helping? Your problem is that you have a display you
> > can't get the supported resolutions from. What I'm suggesting allows you
> > to create all the possible resolutions for that display, allowing the
> > user to use the display, which is what we did for multiple drivers with
> > the same problem.
> 
> How would the possible resolutions be provided to the kernel ? Isn't it
> the whole point of EDID ?
> 
> > You seem to be set on providing the EDID to the kernel, but it's a
> > terrible idea to begin with, so I'd rather discuss alternatives.
> 
> Could you elaborate on why it is a terrible idea ?

I'd be happy to continue this discussion when you'll have time.

-- 
Regards,

Laurent Pinchart
