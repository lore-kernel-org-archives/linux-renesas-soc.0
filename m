Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39299 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753038AbcLSUXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 15:23:44 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: enable VSPDs on R8A7791
Date: Mon, 19 Dec 2016 22:24:12 +0200
Message-ID: <17860203.AIUhP9KGSE@avalon>
In-Reply-To: <1e9a678f-939d-fa4a-1550-d806ffe47697@cogentembedded.com>
References: <4947043.txDs5ZU4mH@wasted.cogentembedded.com> <1823239.KB8yzOkpmW@avalon> <1e9a678f-939d-fa4a-1550-d806ffe47697@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Monday 19 Dec 2016 22:58:57 Sergei Shtylyov wrote:
> On 12/14/2016 11:55 PM, Laurent Pinchart wrote:
> >> We're going to use R8A7791 VSPDs to control DU, so set the corresponding
> >> flag.
> >> 
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > For the same reason I nacked the corresponding patch to the VSP1 driver, I
> > have to nack this one as well. The Gen2 DU has native planes, this patch
> > would prevent using them. I don't see a good reason to do so.
> 
> One of the reasons is that these patches kill the horizontal noise when
> playing video in Weston...

What horizontal noise ? :-)

-- 
Regards,

Laurent Pinchart
