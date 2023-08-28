Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A04C83F14
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Aug 2023 11:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjH1LWD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjH1LVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:21:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372A6B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221705; x=1724757705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZCnkb7ozrDqqfnUlj0YBSpkU2zjL41e+0N85OkjBhk=;
  b=WBywN+W68dggOZ1nT0mteAIwqe0I/3igkkgJhmcYsJ4YMwBrPJ9E7K4Y
   De3UBZ2uzuIUGv0K7pGzaeBw/yLm8zzWoM3uPpJ24NuNxuhXKKdGmjl5Z
   IS46gPBPcZhauhbYc9HeJ4A19WxBsxSHyV8yUCiITunBJaF/mo0enVg2J
   7lOQl0EKWuBVl8K3J3QtMFX/tsqmw4GrZbiei3rSuj7xVr4m3d/c0NrFH
   n2OnvDc6OiHUlqIQcVf0Dvi2vhUFr9x9yRIgjLWYNnVkGA7K9x8ybMWJB
   7kwMUIqY3Alqxc53eab9+Lo7mXE+TpAB6+4ht4CPgmhUVfIyYH+2hvMbN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="378853645"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="378853645"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="688071357"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="688071357"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 04:21:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaJR-00FxRY-2M;
        Mon, 28 Aug 2023 14:21:41 +0300
Date:   Mon, 28 Aug 2023 14:21:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: max8998: Simplify probe() and drop
 max8998_i2c_get_driver_data()
Message-ID: <ZOyDRa5qR1nR3gz0@smile.fi.intel.com>
References: <20230826095536.67962-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826095536.67962-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:55:36AM +0100, Biju Das wrote:
> Simplify probe() by using i2c_get_match_data() instead of
> max8998_i2c_get_driver_data() for retrieving match data from
> OF/ID tables.

Ditto.

-- 
With Best Regards,
Andy Shevchenko


