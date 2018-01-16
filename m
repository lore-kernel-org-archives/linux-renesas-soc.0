Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39916 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750764AbeAPQYF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 11:24:05 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: iwg20d display driver
Date: Tue, 16 Jan 2018 18:24:08 +0200
Message-ID: <7397824.E8BcKjA1bD@avalon>
In-Reply-To: <TY1PR06MB070244C938DAB20E6E3C4ADCB71E0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <TY1PR06MB0702E8B2778BD1E5FB76AA10B71E0@TY1PR06MB0702.apcprd06.prod.outlook.com> <1562100.VQODLR5xyG@avalon> <TY1PR06MB070244C938DAB20E6E3C4ADCB71E0@TY1PR06MB0702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wednesday, 3 January 2018 17:19:51 EET Chris Paterson wrote:
> On Sent: 03 January 2018 13:34 Laurent Pinchart wrote:
> > On Wednesday, 3 January 2018 12:09:48 EET Chris Paterson wrote:
> >> Hello Laurent,
> >> 
> >> Happy new year!
> > 
> > Onnellista uutta vuotta to you too :)
> > 
> >> We are looking at upstreaming support for the display provided in the
> >> iwg20d development kit [1]. The setup is slightly unusual in the sense
> >> that the display is an RGB panel (EDT etm070001adh6), connected to the
> >> RZ/G1M via an LVDS/RGB transmitter (DS90CF384AMTDX/NOPB).
> >> 
> >> We think that the correct driver to use is
> >> drivers/gpu/drm/panel/panel-lvds.c as as far as the SoC/Kernel is
> >> aware there is an LVDS display connected. However the bindings
> >> documentation states: "compatible: Shall contain "panel-lvds" in addition
> >> to a mandatory panel-specific compatible string defined in individual
> >> panel bindings. The "panel-lvds" value shall never be used on its own."
> >> 
> >> As the development kit uses an RGB panel there are no suitable LVDS
> >> panel-specific bindings. Would it be okay in this case to used
> >> panel-lvds on its own?
> > 
> > The rationale is that there's no such thing as a fully generic LVDS panel.
> > The panel-lvds compatible string allows supporting panels that are
> > compatible with the interface defined by the panel-lvds driver, but using
> > the compatible string on its own would mean that the operating system
> > would have no way to tweak operation for a particular panel. It might be
> > that using the panel- lvds driver works today, but that you will realize
> > tomorrow that you need some panel-specific quirks. Being able to identify
> > the exact panel model is thus crucial to be future-proof.
> 
> Agreed.
> 
> > The exact compatible string for your panel should be "edt,etm070001adh6".
> > Using
> > 
> > 	compatible = "edt,etm070001adh6", "panel-lvds";
> > 
> > will work today and be somehow future-proof, but is a bit of a hack as the
> > panel isn't an LVDS panel.
> 
> This was our thought. Would using this compatible string be acceptable (for
> now), even if it isn't the preferred option?

I'm afraid not.

However, I also want to bring good news, I've reworked the DU LVDS code (see 
[2]) which should make it much easier to implement proper support for the 
board. The only missing piece is now a DRM bridge driver for the LVDS to RGB 
decoder. With such a driver in place, and with the proper DT description, I 
believe your board will be supported without having to touch the DU driver 
except for required change to the DU or internal LVDS encoder themselves.

Writing such a driver is also on my to-do list. I might schedule the work for 
the second half of this quarter but I can't guarantee that, so feel free to 
beat me to it. In the meantime I'll rework [2] to try and get it upstream, as 
the current approach was frowned upon. You can however base development on 
that patch series as only the DT backward compatibility code will need to be 
reworked, and that shouldn't influence your work in any way.

> > The right solution would be to model the full display pipeline in DT,
> > including the DS90CF384AMTDX. However, the DU driver doesn't support that
> > yet. Some Gen2 boards suffer from a similar issue in the sense that the
> > device tree pretends that a RGB to HDMI encoder is connected directly to
> > the LVDS output of the SoC, while an LVDS to RGB decoder is present
> > in-between.
> > 
> > Fixing this is somewhere in my todo list but with a low priority I'm
> > afraid. Would you like to give it a go ?
> 
> Depends on your answer to the above ;)
> 
> >> [1]
> >> http://www.iwavesystems.com/product/development-platform/qseven-> >> evaluation-board/rz-g1m-qseven-development-kit-49/rz-g1m-qseven-
> >> development-kit.html

[2] https://www.spinics.net/lists/linux-renesas-soc/msg22369.html

-- 
Regards,

Laurent Pinchart
