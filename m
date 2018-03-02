Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:41434 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934133AbeCBH7q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 02:59:46 -0500
Received: by mail-io0-f174.google.com with SMTP id q24so9872016ioh.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Mar 2018 23:59:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180227125700.6527-5-ville.syrjala@linux.intel.com>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com> <20180227125700.6527-5-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Mar 2018 08:59:45 +0100
Message-ID: <CACRpkda0km6OrVnz49_h8=QLZEexTM0QrwgUTT4A5iz3m6AbYw@mail.gmail.com>
Subject: Re: [RFC][PATCH 04/11] drm: Split the display info into static and
 dynamic parts
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Alison Wang <alison.wang@freescale.com>,
        Eric Anholt <eric@anholt.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 27, 2018 at 1:56 PM, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently we have a mix of static and dynamic information stored in
> the display info structure. That makes it rather difficult to repopulate
> the dynamic parts when a new EDID appears. Let's make life easier by
> splitting the structure up into static and dynamic parts.
>
> The static part will consist of subpixel_order, panel_orientation,
> and bus_formats.
>
> Actually I'm not sure where bus_formats & co. fit in all this. For some
> drivers those seem to be static, even though they might fill them out
> from .get_modes(). For other drivers this stuff even gets frobbed at
> runtime, making it more some kind of a bastard encoder/connector state.
> I'll just stick it into the static side so that the behaviour doesn't
> change when I start clear out the entire dynamic state with memset().
>
> Cc: Keith Packard <keithp@keithp.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@intel.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Manfred Schlaegl <manfred.schlaegl@gmx.at>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Alison Wang <alison.wang@freescale.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
