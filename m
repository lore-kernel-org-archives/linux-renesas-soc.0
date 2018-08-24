Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbeHXPD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 11:03:59 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] Add R-Car V3H (R8A77980) support to the R-Car LVDS driver
Date: Fri, 24 Aug 2018 14:29:42 +0300
Message-ID: <1941633.yX5tMUPcR0@avalon>
In-Reply-To: <a5aae3ff-2585-8eb6-82ef-dc3677eb5abb@cogentembedded.com>
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com> <a5aae3ff-2585-8eb6-82ef-dc3677eb5abb@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thursday, 23 August 2018 19:53:33 EEST Sergei Shtylyov wrote:
> On 06/05/2018 11:25 PM, Sergei Shtylyov wrote:
> > Here's the set of 2 patches against the 'drm-next' branch of the 'drm.git'
> > repo. The purpose of these patches is to add the R-Car V3H (R8A77980)
> > support to the R-Car LVDS driver.
> > 
> > [1/2] dt-bindings: display: renesas: lvds: document R8A77980 bindings
> > [2/2] drm: rcar-du: lvds: add R8A77980 support
> 
>    Laurent, I'm not seeing these patches merged... they are 2.5 months old
> without a comment! :-(

Thank you for pinging me, I've now applied both patches to my tree and will 
push include them in my v4.20 pull request.

-- 
Regards,

Laurent Pinchart
