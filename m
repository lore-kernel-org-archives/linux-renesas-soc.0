Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:28551 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbeKTUVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 15:21:33 -0500
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Fernando <greenfoo@gluegarage.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        dri-devel@lists.freedesktop.org
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        David Airlie <airlied@linux.ie>,
        virtualization@lists.linux-foundation.org,
        Gerd Hoffmann <kraxel@redhat.com>, cocci@systeme.lip6.fr,
        Marek Vasut <marex@denx.de>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        etnaviv@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Michal Marek <michal.lkml@markovi.net>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with "drm_dev_put"
In-Reply-To: <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-4-greenfoo@gluegarage.com> <1542363310.23489.22.camel@pengutronix.de> <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
Date: Tue, 20 Nov 2018 11:53:43 +0200
Message-ID: <87lg5of520.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 16 Nov 2018, Fernando <greenfoo@gluegarage.com> wrote:
> And, related to this, what is the "good" branch to start developing
> new drm patches? Is is "drm-next" or "linux-next"? Or does it change
> depending on how much time until the merge window closes?

I advise most of our developers to work on drm-tip because it contains
the latest stuff in drm core, i915, amd, most of the small drivers, as
well as sound. It's a bit like "linux-next for graphics". And you don't
really have to care about the merge cycles with that.

But YMMV, it probably doesn't work for everyone.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
