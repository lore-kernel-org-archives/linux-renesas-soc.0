Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40984 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752227AbcHPPL2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 11:11:28 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: r8a7790/r8a7791: Remove obsolete vsp1 properties
Date: Tue, 16 Aug 2016 18:09:12 +0300
Message-ID: <1731850.1TRV7u0XMF@avalon>
In-Reply-To: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
References: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 16 Aug 2016 16:56:30 Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Laurent,
> 
> This patch series removes from the R-Car H2 and M2-W DT source files the
> obsolete DT properties to identify the exact VSP device instance
> features, which are no longer needed nor used since commit
> 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device based on IP
> version").

I was about to submit the same patches :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Geert Uytterhoeven (2):
>   ARM: dts: r8a7790: Remove obsolete vsp1 properties
>   ARM: dts: r8a7791: Remove obsolete vsp1 properties
> 
>  arch/arm/boot/dts/r8a7790.dtsi | 23 -----------------------
>  arch/arm/boot/dts/r8a7791.dtsi | 18 ------------------
>  2 files changed, 41 deletions(-)

-- 
Regards,

Laurent Pinchart
