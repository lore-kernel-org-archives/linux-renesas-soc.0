Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33162 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751291AbeEVQu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 12:50:28 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] R-Car D3 LVDS/HDMI support
Date: Tue, 22 May 2018 19:50:24 +0300
Message-ID: <2229387.Idfvy4ikAn@avalon>
In-Reply-To: <1907232.cqk6dk4XdZ@avalon>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1907232.cqk6dk4XdZ@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Sunday, 20 May 2018 11:27:02 EEST Laurent Pinchart wrote:
> On Tuesday, 15 May 2018 15:20:35 EEST Ulrich Hecht wrote:
> > Hi!
> > 
> > This adds D3 support to the DU and LVDS drivers, not including LVDS PLL
> > support.
> > 
> > It also adds LVDS encoders to the D3 device tree, and LVDS decoder, HDMI
> > encoder and HDMI output connector to the Draak device tree.
> > 
> > In theory that should be good enough to provide HDMI output on the Draak
> > board, but in practice the lack of LVDS PLL support prevents generation of
> > close-enough dot clock frequencies.
> > 
> > This series is based on renesas-drivers-2018-05-02-v4.17-rc3 and requires
> > Jacopo's "drm: bridge: Add thc63lvd1024 LVDS decoder driver" patch.
> 
> As HDMI output isn't functional yet this is difficult to test. Could you add
> support for the VGA output (using the DU DPAD) in v2 of the patch series ?
> VGA should work without LVDS PLL support as the clock frequency
> requirements are not as strict as for HDMI.

*sigh* I should really refrain from writing e-mails when I'm jetlagged :-/ VGA 
is already supported, there's nothing to be done there. Sorry for the noise. 

> > Kieran Bingham (1):
> >   arm64: dts: renesas: r8a77995: Add LVDS support
> > 
> > Koji Matsuoka (1):
> >   drm: rcar-du: Add r8a77995 device support
> > 
> > Ulrich Hecht (3):
> >   drm: rcar-du: lvds: Add R8A77995 support
> >   arm64: dts: renesas: r8a77995-draak: add HDMI output
> >   arm64: dts: renesas: r8a77995-draak: add X12 input dot clock
> >  
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 91 +++++++++++++++++++++
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 56 ++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c          | 26 ++++++++
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c            |  6 ++
> >  4 files changed, 179 insertions(+)

-- 
Regards,

Laurent Pinchart
