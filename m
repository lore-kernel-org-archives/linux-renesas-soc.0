Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB11CEAC2;
	Mon,  6 Jul 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331131; cv=none; b=H27ib+Z3ETWGqVLEACXC0RLp9s7ZasjwhMo0BHwPnouhpvzdIn1bXBsMMDr8q3EGPUJ6VnHxLK/Ch8rwQL/WMBmL8osMAgeurh7WKdZz95sP1FDg1Dfq4tj76qfM5c2c0jEvR0ulQV+iS/pezbt4qj2Lf3K3zuPcyDIWVviiaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331131; c=relaxed/simple;
	bh=M8pn+QlLLysMqwQcLRLoz0lnTqJieKWaHHlj88GmCQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Wnc40/8YPIyLAT44nkbgmkU3555sMyp96DG/5zbT4inAiciAF2EJiNbVG0IhAA8cum+YWyCkBMid4jDLO42ftsj31K4vTt0nU7cP8ljDqyBvMyBWJEIBzGJAi561uGdOkdOwnu5ySixPB5yAiWixlNwrLB4ZlAlC3F5ZA75Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/eOddAd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/eOddAd"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32794524;
	Mon,  6 Jul 2026 11:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783331076;
	bh=M8pn+QlLLysMqwQcLRLoz0lnTqJieKWaHHlj88GmCQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/eOddAdOyPtNffoM9mczj3RP1ic6Gc38MwtOFPIqRqPlvgsz5EZ3KhnYEmFxlt4x
	 Erd5fCEETscm3HdL3RkU3IXF8ojzNtcr4Wb54IYIP/WHSRLfeu9t2EktMSK9ffVfcB
	 JXzIy1OGkvxejhGV8z5E1kNRrtzNjshDa0x3qWLA=
Date: Mon, 6 Jul 2026 12:45:22 +0300
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
Message-ID: <20260706094522.GA42740@killaraus.ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-capable-beaver-of-excellence-a3cf10@houat>

Hi Maxime,

On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> > data over an I2C bus. The bus is also used to detect the presence of a
> > connected monitor by trying to read the EDID data.
> > 
> > Some devices where the VGA display is integrated in the device and
> > always connected do not connect the DDC pins. Some development boards,
> > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > 
> > To support those, add the ability to provide hardcoded EDID data in the
> > device tree. This is mutually exclusive with specifying a DDC bus, and
> > can only be done when the VGA display is guaranteed to be always
> > connected.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> This feels redundant with the EDID firmware loading mechanism we have in
> KMS already. It should at least be mentioned why we would need to set it
> in the device tree at all.

Very good question.

I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
debugfs override_edid feature isn't meant for production. If there are
other relevant mechanisms I'm not aware of, please let me know.

In the use case at hand, the VGA display is an integral part of the
device, the same way an LVDS or DSI panel would be. Using
CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
drm.edid_firmware command line parameter, and provide EDID as a file in
/lib/firmware/ (possibly in an initramfs). Beside the complexity, and
the fact it won't be very friendly to people who run a different
userspace on the device, I think EDID counts in this case as system
description, the same way we support specifying panel timings in device
tree.

Does this make sense ? If so, I'll update the commit message accordingly
in v2.

-- 
Regards,

Laurent Pinchart
