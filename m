Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAC5C77B7F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Aug 2023 17:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378807AbjHRRIf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378900AbjHRRI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 13:08:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAFF12A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692378508; x=1723914508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V8Svu96/815AsgUMlmIgsjDtrZQkLdUoW3tizBBNOWM=;
  b=a5jop9fRrp7k1At3q1URwXvJDNzYf5B2eyEfxnqiO4j5KkrPCmQdsQ5d
   KtQoSsJdJ6nf5RBKBOoRV+QSzgH9kamlU9PImSwktliPpJjhD2vqEHcd8
   a+sw0Jda1F26inThkAXPY5peE+QqxJ2MtYTeQo5udTi+zGnZ/oWbqgA1D
   epsdI+mHDPNB5wPxn22u8gBiCXnK6sONfIkAdwXTz3SmGfu/MOypW6eA9
   flGDOQ5dbyohCWYCTGoVmSp034WYN0MKoMdLrL8kIeAawHIkxyWxks+kn
   N2cO7yax4Bcde5tfM4tBkztfh7BxXq2IlTW7RGAU6xWfIKtN3EjaUR30d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439528754"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="439528754"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 10:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="825176190"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="825176190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2023 10:08:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qX2xP-00HD1w-1j;
        Fri, 18 Aug 2023 20:08:19 +0300
Date:   Fri, 18 Aug 2023 20:08:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Message-ID: <ZN+lgzthxaLbOkWi@smile.fi.intel.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
 <20230818165452.320984-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818165452.320984-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 18, 2023 at 05:54:51PM +0100, Biju Das wrote:
> The driver has OF match table, still it uses ID lookup table for
> retrieving match data. Currently the driver is working on the
> assumption that a I2C device registered via OF will always match a
> legacy I2C device ID. The correct approach is to have an OF device ID
> table using of_device_match_data() if the devices are registered via OF.

> Fixes: 9a9f4a01bdae ("drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure")

What is the problem?
The match works either way with these compatible and i2c IDs.

-- 
With Best Regards,
Andy Shevchenko


