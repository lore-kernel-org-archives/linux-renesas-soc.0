Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38572 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932655AbdLRLXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:23:11 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/4] videodevice: Fix minor spacing
Date: Mon, 18 Dec 2017 13:23:21 +0200
Message-ID: <2350156.ygCqAgIcf0@avalon>
In-Reply-To: <494504a89241ba23024e8e125e8d6950fb70a18d.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com> <494504a89241ba23024e8e125e8d6950fb70a18d.1513206331.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday, 14 December 2017 01:10:09 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Provide a space between the return type and the function definition
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  kms++util/src/videodevice.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kms++util/src/videodevice.cpp b/kms++util/src/videodevice.cpp
> index e21916bcd06b..efe1678d031e 100644
> --- a/kms++util/src/videodevice.cpp
> +++ b/kms++util/src/videodevice.cpp
> @@ -436,7 +436,7 @@ void VideoStreamer::queue(DumbFramebuffer* fb)
>  	v4l2_queue_dmabuf(m_fd, idx, fb, get_buf_type(m_type));
>  }
> 
> -DumbFramebuffer*VideoStreamer::dequeue()
> +DumbFramebuffer* VideoStreamer::dequeue()
>  {
>  	uint32_t idx = v4l2_dequeue(m_fd, get_buf_type(m_type));

-- 
Regards,

Laurent Pinchart
