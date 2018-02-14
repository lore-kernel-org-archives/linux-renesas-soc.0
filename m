Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35398 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161773AbeBNSkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 13:40:02 -0500
Received: by mail-lf0-f52.google.com with SMTP id a204so30759968lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2018 10:40:02 -0800 (PST)
Subject: Re: [PATCH v2 3/3] drm: rcar-du: lvds: Refactor LVDS startup
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180214181348.16258-4-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <559de74c-867e-a8f5-f23d-03b564da1f6e@cogentembedded.com>
Date: Wed, 14 Feb 2018 21:39:59 +0300
MIME-Version: 1.0
In-Reply-To: <20180214181348.16258-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 09:13 PM, Laurent Pinchart wrote:

> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> After the recent corrections to the R-Car gen2/3 LVDS startup code, already
> similar enough at their ends rcar_lvds_enable_gen{2|3}() started asking for
> a merge and it's becoming actually necessary with the addition of the R-Car
> V3M (R8A77970) support -- this gen3 SoC has gen2-like LVDPLLCR layout.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

   Well, your role wasn't limited to reviewning/testing, you'd clearly did some editing too... thus I was expecting to see some changelog.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

   Your variant of my patch looks good otherwise. :-)

[...]

MBR, Sergei
