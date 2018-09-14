Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbeIOCVK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 22:21:10 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [GIT PULL FOR renesas-drivers] pinchartl-media/v4l2/vsp1/next
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20180914205007.12905-1-kieran.bingham+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <d4feb5d0-7a21-29e6-5761-0ef696d4bc42@ideasonboard.com>
Date: Fri, 14 Sep 2018 22:04:55 +0100
MIME-Version: 1.0
In-Reply-To: <20180914205007.12905-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 14/09/18 21:50, Kieran Bingham wrote:
> Hi Geert,
> 
> Please consider including this release in renesas-drivers.
> 
> --
> Regards
> 
> Kieran
> 
> The following changes since commit 78cf8c842c111df656c63b5d04997ea4e40ef26a:
> 
>   media: drxj: fix spelling mistake in fall-through annotations (2018-09-12 11:21:52 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git pinchartl-media/v4l2/vsp1/next

Sorry - my local reference to laurent's branch snuck in there.

This should of course be:

   git://linuxtv.org/pinchartl/media.git v4l2/vsp1/next

> 
> for you to fetch changes up to 4a6fcd855184d0d928bb833f1062bd19a0c9b57a:
> 
>   media: vsp1: Document max_width restriction on UDS (2018-09-14 17:35:25 +0300)
> 
> ----------------------------------------------------------------
> Kieran Bingham (5):
>       MAINTAINERS: VSP1: Add co-maintainer
>       media: vsp1: Remove artificial minimum width/height limitation
>       media: vsp1: use periods at the end of comment sentences
>       media: vsp1: Document max_width restriction on SRU
>       media: vsp1: Document max_width restriction on UDS
> 
> Koji Matsuoka (1):
>       media: vsp1: Fix YCbCr planar formats pitch calculation
> 
> Laurent Pinchart (2):
>       media: vsp1: Fix vsp1_regs.h license header
>       media: vsp1: Update LIF buffer thresholds
> 
>  MAINTAINERS                               |  1 +
>  drivers/media/platform/vsp1/vsp1_brx.c    |  4 ++--
>  drivers/media/platform/vsp1/vsp1_drm.c    | 11 ++++++++++-
>  drivers/media/platform/vsp1/vsp1_drv.c    |  6 +++---
>  drivers/media/platform/vsp1/vsp1_entity.c |  2 +-
>  drivers/media/platform/vsp1/vsp1_lif.c    | 29 +++++++++++++++++++++++++----
>  drivers/media/platform/vsp1/vsp1_regs.h   |  2 +-
>  drivers/media/platform/vsp1/vsp1_rpf.c    |  4 ++--
>  drivers/media/platform/vsp1/vsp1_sru.c    |  7 ++++++-
>  drivers/media/platform/vsp1/vsp1_uds.c    | 14 +++++++++++---
>  drivers/media/platform/vsp1/vsp1_video.c  |  9 +++------
>  drivers/media/platform/vsp1/vsp1_wpf.c    |  2 +-
>  include/media/vsp1.h                      |  2 +-
>  13 files changed, 67 insertions(+), 26 deletions(-)
> 

-- 
Regards
--
Kieran
