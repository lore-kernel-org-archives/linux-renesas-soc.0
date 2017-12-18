Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38593 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757744AbdLRL31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:29:27 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 2/4] py: pyvid: Provide stream_off binding
Date: Mon, 18 Dec 2017 13:29:37 +0200
Message-ID: <1580159.1XNxhOst6Z@avalon>
In-Reply-To: <f1877f6b75214f041d838c8018a99d247825ce1d.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com> <f1877f6b75214f041d838c8018a99d247825ce1d.1513206331.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday, 14 December 2017 01:10:10 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The videodevice module defines a stream_off function call, but this is
> not available in the python bindings interface.
> 
> Provide the binding of VideoStreamer::stream_off.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  py/pykms/pyvid.cpp | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/py/pykms/pyvid.cpp b/py/pykms/pyvid.cpp
> index 6a6080e4b2b7..92006c404038 100644
> --- a/py/pykms/pyvid.cpp
> +++ b/py/pykms/pyvid.cpp
> @@ -34,5 +34,6 @@ void init_pyvid(py::module &m)
>  			.def("queue", &VideoStreamer::queue)
>  			.def("dequeue", &VideoStreamer::dequeue)
>  			.def("stream_on", &VideoStreamer::stream_on)
> +			.def("stream_off", &VideoStreamer::stream_off)

I've always wondered why V4L2 has two ioctls for stream on and stream off, 
when a single one with an on/off parameter would be perfectly fine. I'm thus 
tempted to implement stream control through a single function, but that's a 
matter of taste. Feel free to give it a go if you want, otherwise

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			;
>  }

-- 
Regards,

Laurent Pinchart
