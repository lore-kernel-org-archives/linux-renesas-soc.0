Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CE3C71153
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Aug 2023 11:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjH1L1Y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjH1L05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:26:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9BD92
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693222014; x=1724758014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=COMTdWf3DBFde9p8NBPZiGOQHPVjxLDVseDRnlFzbIM=;
  b=hQ7cte4uhxr7PW0jMpZsfdFOV1sMRAeLi/50/9aroomN8VftrYw6Qcj5
   OOa96LdXfHzGsuo5scmoE0KM/wJTAi5qE37qHViVBP/Kl/3zG5RnHJ1QE
   7ODT5i41RLSesdSPuzAIijCe88s792BiPPQG5+Yye8yCwwpu2uaP00hHq
   HEFhsEqZZcf4fwdktma4BaM3OaJJeDWzbZQlWY2wm9SYooH3bhBQPaS7e
   3tH68Y/XsYVXbyo/uVoOf4UoQyr/rjt8WNZaMe89dnjaxqu8a39O9ITt9
   kwCZrJAVaKygKS4+HgxfGNuzzHTsP87amWK/KEOMTT0IFj7jdxD+US0VR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="441424401"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="441424401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881910720"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 04:26:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaOO-00G7vB-0Z;
        Mon, 28 Aug 2023 14:26:48 +0300
Date:   Mon, 28 Aug 2023 14:26:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4642: Simplify probe()
Message-ID: <ZOyEd+mTIPLFVhGW@smile.fi.intel.com>
References: <20230826193447.113378-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826193447.113378-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 08:34:47PM +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().
> 
> While at it, drop local variable np from probe() by using dev->of_node.

...

> +	if (dev->of_node) {

No, please use (it needed at all) the respective API.

...

> -		-EINVAL;

> +		-ENODEV

...being not explained.

-- 
With Best Regards,
Andy Shevchenko


