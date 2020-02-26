Return-Path: <SRS0=mEDe=4O=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E30C4BA06
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 01:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 736982082F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 01:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ma+dwGI9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729498AbgBZBob (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 25 Feb 2020 20:44:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33644 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729403AbgBZBob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 20:44:31 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99B1A43F;
        Wed, 26 Feb 2020 02:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582681469;
        bh=68iI9YFyw7yzGzx24yLYLDqREd9wos0WYpOdexIXGo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ma+dwGI9lvQa6NClYAq3NSKC51mqSu7tscXHA1PTzdPPCR1GuvgYtsjuabwetyf1u
         QBjAasS/vEvcF98gaI1mIjwJH9Fy4YYG05sRqb2PzjAvS1yc5ot87s3SrPXu+uZx9X
         Qrcpc7lh3ERCXgyRS8AoQlM8H8tTRmkVi7Xv81DU=
Date:   Wed, 26 Feb 2020 03:44:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] drm: shmobile: Reduce include dependencies
Message-ID: <20200226014406.GY4764@pendragon.ideasonboard.com>
References: <20200206111232.75309-1-andriy.shevchenko@linux.intel.com>
 <20200224090430.GT10400@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224090430.GT10400@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thank you for the patch, and sorry for the delay.

On Mon, Feb 24, 2020 at 11:04:30AM +0200, Andy Shevchenko wrote:
> On Thu, Feb 06, 2020 at 01:12:32PM +0200, Andy Shevchenko wrote:
> > This file doesn't need everything provided by <linux/kernel.h>.

s/everything/anything/

> > All it needs are some types, which are provided by <drm/drm_mode.h>.
> > 
> > Drop unneeded <linux/kernel.h> completely.
> 
> Any comments on this?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to push :-)

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v3: Drop header completely (Laurent)
> >  include/linux/platform_data/shmob_drm.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> > index fe815d7d9f58..d661399b217d 100644
> > --- a/include/linux/platform_data/shmob_drm.h
> > +++ b/include/linux/platform_data/shmob_drm.h
> > @@ -10,8 +10,6 @@
> >  #ifndef __SHMOB_DRM_H__
> >  #define __SHMOB_DRM_H__
> >  
> > -#include <linux/kernel.h>
> > -
> >  #include <drm/drm_mode.h>
> >  
> >  enum shmob_drm_clk_source {

-- 
Regards,

Laurent Pinchart
