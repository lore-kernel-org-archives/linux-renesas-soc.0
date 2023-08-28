Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78CDC83F12
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Aug 2023 11:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjH1LOA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbjH1LNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:13:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE5EE3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221225; x=1724757225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gk4gPGTAOejxbqSkIPmv/XOWc0LmOYdvChlZ6KE109I=;
  b=FKfBrvmcbkbbXbRUmezregC7jrEZTzuC5zFFUaxzTAde64lHxKdU9y3w
   mtiuv2LeiDbW5TuMVsRMIBriEY/l7U+YiJViw70hgBtZ0ZqyWW5sOwqBX
   OWWG2wspDXCzHIcmcj3JV96TwlQV6lFlv6N8q2jkJ3eGo0H3GE0sEnCza
   5eOINCFkg1/4/n24fTBg1/e1+rKmRnrEGBvIydhTVZbd5C1YhMvFbrR6W
   4tHFj2YYrpTNIiRFZ5n7aPIW4GPZtjhRHj+3llOhKB9vWt4mxbQcAsGtv
   4elQ+N4OEcTSQ1koDR8KOUtUlp5KDiY8+NEsooi4qjq80XCeMfiFVlW6o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360071920"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360071920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1069000045"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1069000045"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 04:13:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaBg-00FhN6-0M;
        Mon, 28 Aug 2023 14:13:40 +0300
Date:   Mon, 28 Aug 2023 14:13:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Message-ID: <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
References: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 27, 2023 at 10:45:36AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_node() and i2c_match_id() with
> i2c_get_match_data().

...

> +	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));

You (potentially) drop const qualifier here. It's not good and it's not
explained in the commit message why.

-- 
With Best Regards,
Andy Shevchenko


