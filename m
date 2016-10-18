Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58460 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933560AbcJRJTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 05:19:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <simon@horms.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
Date: Tue, 18 Oct 2016 12:19:26 +0300
Message-ID: <2511719.0AnPiuYGPa@avalon>
In-Reply-To: <CAMuHMdUUeVRwM06+VA8QsqkaT5D4t4xiJML3mgQN9-CPcf4mzQ@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1476740091-7011-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUUeVRwM06+VA8QsqkaT5D4t4xiJML3mgQN9-CPcf4mzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tuesday 18 Oct 2016 11:05:32 Geert Uytterhoeven wrote:
> On Mon, Oct 17, 2016 at 11:34 PM, Laurent Pinchart wrote:
> > Add the DU device to r8a7796.dtsi in a disabled state.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Could you please pick patches 1/4 to 3/4 from this series and apply them to 
your tree ? For convenience I've pushed them to

	git://linuxtv.org/pinchartl/media.git drm/r8a7796/dt

along with patch "arm64: dts: renesas: r8a7795: Remove FCP SoC-specific 
compatible strings" that has been acked too. If you pull from that branch 
please make sure you skip the top-most patch "arm64: dts: renesas: r8a7796-
salvator-x: Enable DU" for now.

-- 
Regards,

Laurent Pinchart
