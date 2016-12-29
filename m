Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35099 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752399AbcL2Jyy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 04:54:54 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable R8A7794 DU VSPD compositor
Date: Thu, 29 Dec 2016 11:54:43 +0200
Message-ID: <3105218.LKxk3bXDQr@avalon>
In-Reply-To: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
References: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thursday 29 Dec 2016 00:18:40 Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against the 'drm-next' branch of David
> Airlie's 'linux.git' repo. We're switching to the DU compositor for the DU
> driver on the Renesas R8A7794 SoC.
> 
> [1/2] drm: rcar-du: support less VSPs than CRTCs
> [2/2] drm: rcar-du: enable VSPD on R8A7794

Nack for the same reasons as your previous related patches. If you want to get 
this feature merged we'll need to configure whether the VSPD is used 
standalone or for DU operation at runtime. The DRM live sources were an 
attempt at implementing that, feel free to revive the idea and brush up the 
patches.

-- 
Regards,

Laurent Pinchart
